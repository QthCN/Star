//
//  File 2.swift
//  
//
//  Created by 秦天欢 on 2021/1/24.
//

import Foundation
import Common


// 执行分析，分析的结果存在AST节点中
//  - 分析Expr的type
//  - 分析ident的定义

class GoExprVisiter: GoVisiter {
    
    weak var pkg: GoPackage!
    weak var cu: CompilationUnion!
    weak var file: FileSystemObject!
    
    
    init(cu: CompilationUnion, pkg: GoPackage, file: FileSystemObject) {
        self.cu = cu
        self.pkg = pkg
        self.file = file
        super.init()
    }
    
    private func typeInfer_assign_right_to_left(left: goast_expression_list, right: goast_expression_list) {
        var types: [GoType] = []
        
        if right.children.count == 1 {
            return self.typeInfer_assign_right_to_left(left: left, right: right.children[0])
        }

        for item in right.children {
            switch item.getType() {
            case let itemType as GoTupleType:
                for v in itemType.vars {
                    types.append(v.typ ?? GoUnknownType())
                }
            default:
                if let t = item.getType() as? GoType {
                    types.append(t)
                } else {
                    types.append(GoUnknownType())
                }
            }
        }

        for (idx, item) in left.children.enumerated() {
            if idx >= types.count {
                break
            }
            let rightType = types[idx]
            if rightType is GoUnknownType {
                // pass
            } else {
                item.setType(type: rightType)
            }
        }
    }
    
    private func typeInfer_assign_right_to_left(left: [goast_identifier], right: goast_expression_list) {
        let exprs = goast_expression_list(pos: Position(0, 0, 0, 0, 0, 0))
        exprs.children = left
        return self.typeInfer_assign_right_to_left(left: exprs, right: right)
    }
    
    private func typeInfer_assign_right_to_left(left: goast_expression_list, right: goast__expression) {
        var types: [GoType] = []

        if right is goast_type_assertion_expression {
            guard let rightType = right.getType() as? GoType else {
                return
            }
            if left.children.count == 1 {
                if let ident = left.children[0] as? goast_identifier {
                    ident.setType(type: rightType)
                }
            } else if left.children.count == 2 {
                if let ident = left.children[0] as? goast_identifier {
                    ident.setType(type: rightType)
                }
                if let ok = left.children[1] as? goast_identifier {
                    ok.setType(type: GoBasicType(kind: .bool))
                }
            }
        } else if right is goast_index_expression {
            let idxExpr = right as! goast_index_expression
            
            if idxExpr.operand?.getType() is GoSliceType || idxExpr.operand?.getType() is GoArrayType {
                if let t = right.getType() as? GoType {
                    if let value = left.children[0] as? goast_identifier {
                        value.setType(type: t)
                    }
                }
            } else if idxExpr.operand?.getType() is GoMapType {
                if let t = right.getType() as? GoType {
                    if left.children.count == 2 {
                        if let value = left.children[0] as? goast_identifier {
                            value.setType(type: t)
                        }
                        if let ok = left.children[1] as? goast_identifier {
                            ok.setType(type: GoBasicType(kind: .bool))
                        }
                    } else if left.children.count == 1 {
                        if let value = left.children[0] as? goast_identifier {
                            value.setType(type: t)
                        }
                    }
                }
            }
        } else {
            switch right.getType() {
            case let itemType as GoTupleType:
                for v in itemType.vars {
                    types.append(v.typ ?? GoUnknownType())
                }
            default:
                if let t = right.getType() as? GoType {
                    types.append(t)
                } else {
                    types.append(GoUnknownType())
                }
            }

            for (idx, item) in left.children.enumerated() {
                if idx >= types.count {
                    break
                }
                let rightType = types[idx]
                if rightType is GoUnknownType {
                    // pass
                } else {
                    item.setType(type: rightType)
                }
            }
        }
    }
    
    // TODO 和TypeVisiter中的合并
    private func handleDefaultTypes(n: String) -> GoType? {
        let s = n.lowercased()
        switch s {
        case "bool":
            return GoBasicType(kind: .bool)
        case "int", "int8", "int16", "int32", "int64":
            return GoBasicType(kind: .int)
        case "uint", "uint8", "uint16", "uint32", "uint64":
            return GoBasicType(kind: .uint)
        case "uintptr":
            return GoBasicType(kind: .uintptr)
        case "float32", "float64":
            return GoBasicType(kind: .float)
        case "complex64", "complex128":
            return GoBasicType(kind: .complex)
        case "string":
            return GoBasicType(kind: .string)
        case "unsafepointer":
            return GoBasicType(kind: .unsafePointer)
        case "byte":
            return GoBasicType(kind: .byte)
        case "rune":
            return GoBasicType(kind: .rune)
        default:
            return nil
        }
    }
    
    private func getType(_ node: GoAST?) -> GoType? {
        guard let typeNode = node as? UASTExpr else {
            return nil
        }
        
        if let goType = typeNode.getType() as? GoType {
            return goType
        }
        
        let s = self.cu.codes(pos: node!.pos)
        
        // TODO 处理int这种系统自带类型，后续这些需要放到GlobalScope中
        if let goType = self.handleDefaultTypes(n: s) {
            return goType
        }

        // 根据node的类型获取其type
        switch typeNode {
        case is goast_type_identifier:
            if let decl = node!.getScope()?.find(name: s) as? UASTExpr {
                return decl.getType() as? GoType
            } else {
                if let decl = self.pkg.findSymbol(name: s) {
                    return (decl.getNode() as? UASTExpr)?.getType() as? GoType
                } else {
                    return nil
                }
            }
        default:
            return nil
        }
    }
    
    private func handleSignatureParameterList(parameters: goast_parameter_list?) -> (GoTupleType, Bool) {
        var hasVariadicParameter = false
        
        if parameters == nil {
            return (GoTupleType(vars: []), hasVariadicParameter)
        }
        
        var vars: [GoVar] = []
        for child in parameters!.children {
            switch child {
            case let node as goast_parameter_declaration:
                if let type = self.getType(node.type) {
                    for ident in node.name {
                        let v = GoVar(name: self.cu.codes(pos: ident.pos), typ: type, situation: .param)
                        ident.setType(type: type)
                        vars.append(v)
                    }
                } else {
                    for ident in node.name {
                        let v = GoVar(name: self.cu.codes(pos: ident.pos), situation: .param)
                        vars.append(v)
                    }
                }
            case let node as goast_variadic_parameter_declaration:
                hasVariadicParameter = true
                if let type = self.getType(node.type) {
                    if let ident = node.name {
                        let v = GoVar(name: self.cu.codes(pos: ident.pos), typ: type, situation: .param)
                        ident.setType(type: type)
                        vars.append(v)
                    }
                } else {
                    if let ident = node.name {
                        let v = GoVar(name: self.cu.codes(pos: ident.pos), situation: .param)
                        vars.append(v)
                    }
                }
            default:
                break
            }
        }
        
        return (GoTupleType(vars: vars), hasVariadicParameter)
    }
    
    private func handleSignature(receiver: goast_parameter_list?, parameters: goast_parameter_list?, results: GoAST?) -> GoSignatureType? {
        let sig = GoSignatureType()
        
        if receiver != nil {
            let (recv, _) = self.handleSignatureParameterList(parameters: receiver)
            if receiver != nil && recv.vars.count == 1 {
                sig.recv = recv.vars[0]
            }
        }
        
        if parameters != nil {
            let (params, hasVariadicParam) = self.handleSignatureParameterList(parameters: parameters)
            sig.params = params
            sig.variadic = hasVariadicParam
        }
        
        switch results {
        case nil:
            sig.results = GoTupleType(vars: [])
        case let node as goast_parameter_list:
            let (res, _) = self.handleSignatureParameterList(parameters: node)
            sig.results = res
        default:
            if let type = self.getType(results as? goast__simple_type) {
                let v = GoVar(typ: type, situation: .param)
                sig.results = GoTupleType(vars: [v])
            } else {
                sig.results = GoTupleType(vars: [])
            }
        }
        return sig
    }
    
    override func visit_binary_expression(_ node: goast_binary_expression) {
        super.visit_binary_expression(node)
        
        if let t = node.left?.getType() as? GoType {
            node.setType(type: t)
        } else if let t = node.right?.getType() as? GoType {
            node.setType(type: t)
        }
    }
    
    override func visit_call_expression(_ node: goast_call_expression) {
        super.visit_call_expression(node)
        
        if let t = (node.function?.getType() as? GoFunc)?.sig?.results {
            node.setType(type: t)
        } else if let t = (node.function?.getType() as? GoSignatureType)?.results {
            node.setType(type: t)
        }
    }
    
    override func visit_composite_literal(_ node: goast_composite_literal) {
        super.visit_composite_literal(node)
        
        if let t = (node.type as? UASTExpr)?.getType() as? GoType {
            node.setType(type: t)
        }
    }
    
    override func visit_const_spec(_ node: goast_const_spec) {
        super.visit_const_spec(node)
        
        for name in node.name {
            if let t = node.type?.getType() as? GoType {
                name.setType(type: t)
            } else if let t = (node.value as? UASTExpr)?.getType() as? GoType {
                name.setType(type: t)
            }
        }
    }
    
    override func visit_false(_ node: goast_false) {
        super.visit_false(node)
        
        node.setType(type: GoBasicType(kind: .bool))
    }
    
    override func visit_float_literal(_ node: goast_float_literal) {
        super.visit_float_literal(node)
        
        node.setType(type: GoBasicType(kind: .float))
    }
    
    override func visit_func_literal(_ node: goast_func_literal) {
        super.visit_func_literal(node)
        
        if let sig = self.handleSignature(receiver: nil, parameters: node.parameters, results: node.result) {
            sig.setPosition(sp: SymbolPosition(file: self.file, node: node))
            node.setType(type: sig)
        }
    }
    
    override func visit_identifier(_ node: goast_identifier) {
        super.visit_identifier(node)
        
        if node.declarations.count == 0 {
            // 此时说明这个declaration不在当前文件，因此去当前package的其它文件中找
            let name = self.cu.codes(pos: node.pos)
            if let decl = self.pkg.findSymbol(name: name) {
                node.setDeclarations([
                    decl
                ])
            }
        }
        
        // 设置类型为第一个declaration的类型
        for decl in node.declarations {
            if let t = (decl.getNode() as? UASTExpr)?.getType() as? GoType {
                node.setType(type: t)
                break
            }
        }
    }
    
    
    
    override func visit_imaginary_literal(_ node: goast_imaginary_literal) {
        super.visit_imaginary_literal(node)
        
        node.setType(type: GoBasicType(kind: .complex))
    }
    
    override func visit_index_expression(_ node: goast_index_expression) {
        super.visit_index_expression(node)
        
        if let t = (node.operand?.getType() as? GoMapType)?.elem {
            node.setType(type: t)
        } else if let t = (node.operand?.getType() as? GoArrayType)?.elem {
            node.setType(type: t)
        } else if let t = (node.operand?.getType() as? GoSliceType)?.elem {
            node.setType(type: t)
        }
    }
    
    override func visit_int_literal(_ node: goast_int_literal) {
        super.visit_int_literal(node)
        
        node.setType(type: GoBasicType(kind: .int))
    }
    
    override func visit_interpreted_string_literal(_ node: goast_interpreted_string_literal) {
        super.visit_interpreted_string_literal(node)
        
        node.setType(type: GoBasicType(kind: .string))
    }
    
    override func visit_parameter_declaration(_ node: goast_parameter_declaration) {
        super.visit_parameter_declaration(node)
        
        if let t = node.type?.getType() as? GoType {
            for name in node.name {
                name.setType(type: t)
            }
        }
    }
    
    override func visit_parenthesized_expression(_ node: goast_parenthesized_expression) {
        super.visit_parenthesized_expression(node)
        
        if let t = node.children?.getType() as? GoType {
            node.setType(type: t)
        }
    }
    
    override func visit_raw_string_literal(_ node: goast_raw_string_literal) {
        super.visit_raw_string_literal(node)
        
        node.setType(type: GoBasicType(kind: .string))
    }
    
    override func visit_rune_literal(_ node: goast_rune_literal) {
        super.visit_rune_literal(node)
        
        node.setType(type: GoBasicType(kind: .rune))
    }
    
    override func visit_slice_expression(_ node: goast_slice_expression) {
        super.visit_slice_expression(node)
        
        if let t = (node.operand?.getType() as? GoArrayType)?.elem {
            node.setType(type: t)
        } else if let t = (node.operand?.getType() as? GoSliceType)?.elem {
            node.setType(type: t)
        }
    }
    
    override func visit_true(_ node: goast_true) {
        super.visit_true(node)
        
        node.setType(type: GoBasicType(kind: .bool))
    }
    
    override func visit_type_assertion_expression(_ node: goast_type_assertion_expression) {
        super.visit_type_assertion_expression(node)
        
        if let t = node.type?.getType() as? GoType {
            node.setType(type: t)
        }
    }
    
    override func visit_type_conversion_expression(_ node: goast_type_conversion_expression) {
        super.visit_type_conversion_expression(node)
        
        if let t = node.type?.getType() as? GoType {
            node.setType(type: t)
        }
    }
    
    override func visit_unary_expression(_ node: goast_unary_expression) {
        super.visit_unary_expression(node)
        
        if let t = node.operand?.getType() as? GoType {
            node.setType(type: t)
        }
    }
    
    override func visit_var_spec(_ node: goast_var_spec) {
        super.visit_var_spec(node)
        
        for name in node.name {
            if let t = node.type?.getType() as? GoType {
                name.setType(type: t)
            } else if let t = (node.value as? UASTExpr)?.getType() as? GoType {
                name.setType(type: t)
            }
        }
    }
    
    override func visit_variadic_parameter_declaration(_ node: goast_variadic_parameter_declaration) {
        super.visit_variadic_parameter_declaration(node)
        
        if let t = node.type?.getType() as? GoType {
            if let name = node.name {
                name.setType(type: t)
            }
        }
    }
    
    override func visit_short_var_declaration(_ node: goast_short_var_declaration) {
        super.visit_short_var_declaration(node)
        
        guard let left = node.left else {
            return
        }
        
        guard let right = node.right else {
            return
        }
        
        self.typeInfer_assign_right_to_left(left: left, right: right)
    }
    
    override func visit_receive_statement(_ node: goast_receive_statement) {
        super.visit_receive_statement(node)
        
        guard let left = node.left else {
            return
        }
        
        guard let right = node.right else {
            return
        }
        
        self.typeInfer_assign_right_to_left(left: left, right: right)
    }
    
    override func visit_range_clause(_ node: goast_range_clause) {
        super.visit_range_clause(node)
        
        guard let right = node.right else {
            return
        }
        if let left = node.left {
            if left.children.count == 1 {
                switch right.getType() {
                case _ as GoArrayType:
                    if let ident = left.children[0] as? goast_identifier {
                        ident.setType(type: GoBasicType(kind: .int))
                    }
                case _ as GoSliceType:
                    if let ident = left.children[0] as? goast_identifier {
                        ident.setType(type: GoBasicType(kind: .int))
                    }
                case let rangeType as GoMapType:
                    if let ident = left.children[0] as? goast_identifier {
                        ident.setType(type: rangeType.key)
                    }
                case _ as GoBasicType:
                    if let ident = left.children[0] as? goast_identifier {
                        ident.setType(type: GoBasicType(kind: .int))
                    }
                default:
                    break
                }
            } else if left.children.count == 2 {
                switch right.getType() {
                case let rangeType as GoArrayType:
                    if let ident = left.children[0] as? goast_identifier {
                        ident.setType(type: GoBasicType(kind: .int))
                    }
                    if let value = left.children[1] as? goast_identifier {
                        value.setType(type: rangeType.elem)
                    }
                case let rangeType as GoSliceType:
                    if let ident = left.children[0] as? goast_identifier {
                        ident.setType(type: GoBasicType(kind: .int))
                    }
                    if let value = left.children[1] as? goast_identifier {
                        value.setType(type: rangeType.elem)
                    }
                case let rangeType as GoMapType:
                    if let ident = left.children[0] as? goast_identifier {
                        ident.setType(type: rangeType.key)
                    }
                    if let value = left.children[1] as? goast_identifier {
                        value.setType(type: rangeType.elem)
                    }
                case let rangeType as GoBasicType:
                    if let ident = left.children[0] as? goast_identifier {
                        ident.setType(type: GoBasicType(kind: .int))
                    }
                    if rangeType.kind == .string {
                        if let value = left.children[1] as? goast_identifier {
                            value.setType(type: GoBasicType(kind: .string))
                        }
                    } else if rangeType.kind == .int  {
                        if let value = left.children[1] as? goast_identifier {
                            value.setType(type: GoBasicType(kind: .int))
                        }
                    }
                default:
                    break
                }
            }
        }
    }
    
    override func visit_type_switch_statement(_ node: goast_type_switch_statement) {
        self.visit_node(node)
        
        if let ast = node.initializer {
            self.visit__simple_statement(ast)
        }

        if let ast = node.alias {
            self.visit_expression_list(ast)
        }

        if let ast = node.value {
            self.visit__expression(ast)
        }
        
        if let alias = node.alias {
            if let value = node.value {
                self.typeInfer_assign_right_to_left(left: alias, right: value)
            }
        }

        for ast in node.children {
            // TODO 支持type case
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }
    
    private func handleSelectorExprNamedType(t: GoNamedType, field: String) -> GoType? {
        // 先搜索方法
        for f in t.methods {
            if f.name == field {
                return f
            }
        }
        
        // TODO 简单判断下是否存在递归
        if t.typ === t {
            print("NamedType with identical typ!")
            return nil
        }
        
        // 搜索对应type
        switch t.typ {
        case let nodeType as GoNamedType:
            return self.handleSelectorExprNamedType(t: nodeType, field: field)
        case let nodeType as GoStructType:
            return self.handleSelectorExprStructType(t: nodeType, field: field)
        case let nodeType as GoInterfaceType:
            return self.handleSelectorExprInterfaceType(t: nodeType, field: field)
        default:
            return nil
        }
    }
    
    private func handleSelectorExprStructType(t: GoStructType, field: String) -> GoType? {
        // 先处理直接属性
        for f in t.fields {
            if f.name == field {
                return f.typ
            }
        }
        
        // 在处理父级属性
        for f in t.fields {
            if f.name == nil {
                if let fieldType = f.typ {
                    
                    if let nt = fieldType as? GoNamedType {
                        if nt.typ === t {
                            print("NamedType with identical typ!")
                            return nil
                        }
                    }
                    
                    if let r = self.handleSelectorExprType(t: fieldType, field: field) {
                        return r
                    }
                }
            }
        }
        
        return nil
    }
    
    private func handleSelectorExprInterfaceType(t: GoInterfaceType, field: String) -> GoType? {
        for f in t.methods {
            if f.name == field {
                return f.sig?.results
            }
        }
        
        for embeded in t.embeddeds {
            if let r = self.handleSelectorExprType(t: embeded, field: field) {
                return r
            }
        }
        
        return nil
    }
    
    private func handleSelectorExprType(t: GoType, field: String) -> GoType? {
        switch t {
        case let nodeType as GoTupleType:
            if nodeType.vars.count > 0 {
                if let varType = nodeType.vars[0].typ {
                    return self.handleSelectorExprType(t: varType, field: field)
                }
            }
        case let nodeType as GoPointerType:
            if let base = nodeType.base {
                return self.handleSelectorExprType(t: base, field: field)
            }
        case let nodeType as GoNamedType:
            return self.handleSelectorExprNamedType(t: nodeType, field: field)
        case let nodeType as GoStructType:
            return self.handleSelectorExprStructType(t: nodeType, field: field)
        case let nodeType as GoInterfaceType:
            return self.handleSelectorExprInterfaceType(t: nodeType, field: field)
        default:
            return nil
        }
        
        return nil
    }
    
    override func visit_selector_expression(_ node: goast_selector_expression) {
        super.visit_selector_expression(node)
        
        guard let operand = node.operand else {
            return
        }
        let operandName = self.cu.codes(pos: operand.pos)
        
        guard let field = node.field else {
            return
        }
        let fieldName = self.cu.codes(pos: field.pos)
        
        // 尝试获取type，如果无法获取则认为其是一个package
        if let nodeType = operand.getType() as? GoType {
            if let t = self.handleSelectorExprType(t: nodeType, field: fieldName) {
                node.setType(type: t)
                
                if let pos = t.position() {
                    field.setDeclarations([
                        pos
                    ])
                }
                
            }
        } else {
            if let pkg = self.pkg.getPkgByName(fileObj: self.file, name: operandName) {
                if let obj = pkg.findSymbol(name: fieldName) {
                    if let t = (obj.getNode() as? UASTExpr)?.getType() as? GoType {
                        node.setType(type: t)
                    }
                    field.setDeclarations([
                        obj
                    ])
                }
            }
        }
    }
}
