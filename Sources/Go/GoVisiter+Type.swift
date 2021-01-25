//
//  File.swift
//
//
//  Created by 秦天欢 on 2021/01/21.
//

import Foundation
import Common


// 执行分析，分析的结果存在AST节点中
//  - 单文件scope的Type分析。在之前的分析中所有namedtype都关联到了对应的结构体，因此在这里对所有type信息进行关联

class GoTypeVisiter: GoVisiter {
    
    weak var pkg: GoPackage!
    weak var cu: CompilationUnion!
    weak var file: FileSystemObject!
    
    
    init(cu: CompilationUnion, pkg: GoPackage, file: FileSystemObject) {
        self.cu = cu
        self.pkg = pkg
        self.file = file
        super.init()
    }
    
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
    
    override func visit_array_type(_ node: goast_array_type) {
        super.visit_array_type(node)
        
        if node.length == nil {
            return
        }
        
        guard let length = Int(self.cu.codes(pos: node.length!.pos)) else {
            return
        }

        guard let elementType = self.getType(node.element) else {
            return
        }
        
        let arrayType = GoArrayType(len: length, elem: elementType)
        arrayType.setPosition(sp: SymbolPosition(file: self.file, node: node))
        node.setType(type: arrayType)
    }
    
    override func visit_channel_type(_ node: goast_channel_type) {
        super.visit_channel_type(node)
        
        guard let elementType = self.getType(node.value) else {
            return
        }
        
        let codes = self.cu.codes(pos: node.pos).trimmingCharacters(in: .whitespacesAndNewlines)
        var dir: GoChanDir = .sendrecv
        if codes.hasPrefix("<-") {
            dir = .recvonly
        } else if codes.hasPrefix("chan") {
            let subCodes = codes.dropFirst(4).trimmingCharacters(in: .whitespacesAndNewlines)
            if subCodes.hasPrefix("<-") {
                dir = .sendonly
            } else {
                dir = .sendrecv
            }
        }
        
        let chanType = GoChanType(dir: dir, elem: elementType)
        chanType.setPosition(sp: SymbolPosition(file: self.file, node: node))
        node.setType(type: chanType)
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
                    if node.name.count == 0 {
                        // func (int, string) 这种
                        let v = GoVar(typ: type, situation: .param)
                        vars.append(v)
                    }
                } else {
                    for ident in node.name {
                        let v = GoVar(name: self.cu.codes(pos: ident.pos), situation: .param)
                        vars.append(v)
                    }
                    if node.name.count == 0 {
                        // func (int, string) 这种
                        let v = GoVar(situation: .param)
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
                    } else {
                        // func (int, string) 这种
                        let v = GoVar(typ: type, situation: .param)
                        vars.append(v)
                    }
                } else {
                    if let ident = node.name {
                        let v = GoVar(name: self.cu.codes(pos: ident.pos), situation: .param)
                        vars.append(v)
                    } else {
                        // func (int, string) 这种
                        let v = GoVar(situation: .param)
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
    
    override func visit_function_declaration(_ node: goast_function_declaration) {
        super.visit_function_declaration(node)
        
        guard let funcType = node.name?.getType() as? GoFunc else {
            return
        }
        
        // 补充funcType信息
        if let sig = self.handleSignature(receiver: nil, parameters: node.parameters, results: node.result) {
            funcType.setSignature(sig: sig)
        }
    }
    
    override func visit_function_type(_ node: goast_function_type) {
        super.visit_function_type(node)
        
        if let sig = self.handleSignature(receiver: nil, parameters: node.parameters, results: node.result) {
            sig.setPosition(sp: SymbolPosition(file: self.file, node: node))
            node.setType(type: sig)
        }
    }
    
    override func visit_implicit_length_array_type(_ node: goast_implicit_length_array_type) {
        super.visit_implicit_length_array_type(node)
        
        guard let elementType = self.getType(node.element) else {
            return
        }
        
        let arrayType = GoArrayType(len: 0, elem: elementType)
        arrayType.setPosition(sp: SymbolPosition(file: self.file, node: node))
        node.setType(type: arrayType)
    }
    
    override func visit_map_type(_ node: goast_map_type) {
        super.visit_map_type(node)
        
        guard let keyType = self.getType(node.key) else {
            return
        }
        
        guard let valueType = self.getType(node.value) else {
            return
        }
        
        let mapType = GoMapType(key: keyType, elem: valueType)
        mapType.setPosition(sp: SymbolPosition(file: self.file, node: node))
        node.setType(type: mapType)
    }
    
    override func visit_parenthesized_type(_ node: goast_parenthesized_type) {
        super.visit_parenthesized_type(node)
        
        if let type = node.children?.getType() as? GoType {
            node.setType(type: type)
        }
    }
    
    override func visit_pointer_type(_ node: goast_pointer_type) {
        super.visit_pointer_type(node)
        
        guard let baseType = self.getType(node.children) else {
            return
        }
        
        let pointType = GoPointerType(base: baseType)
        pointType.setPosition(sp: SymbolPosition(file: self.file, node: node))
        node.setType(type: pointType)
    }
    
    override func visit_qualified_type(_ node: goast_qualified_type) {
        super.visit_qualified_type(node)
        
        guard let pkg = node.package else {
            return
        }
        
        let pkgName = self.cu.codes(pos: pkg.pos)
        
        guard let x = node.name else {
            return
        }
        
        let name = self.cu.codes(pos: x.pos)
        
        // 获取对应package
        guard let targetPkg = self.pkg.getPkgByName(fileObj: self.file, name: pkgName) else {
            return
        }
        // 在对应的package中搜索符号
        guard let sp = targetPkg.findSymbol(name: name) else {
            return
        }
        // 获取对应符号的类型
        guard let t = (sp.getNode() as? UASTExpr)?.getType() as? GoType else {
            return
        }
        // 绑定类型
        node.setType(type: t)
    }
    
    override func visit_slice_type(_ node: goast_slice_type) {
        super.visit_slice_type(node)
        
        guard let elemType = self.getType(node.element) else {
            return
        }
        
        let sliceType = GoSliceType(elem: elemType)
        sliceType.setPosition(sp: SymbolPosition(file: self.file, node: node))
        node.setType(type: sliceType)
    }
    
    
    override func visit_type_identifier(_ node: goast_type_identifier) {
        super.visit_type_identifier(node)
        
        if let type = self.getType(node) {
            node.setType(type: type)
        }
    }
    
    override func visit_method_declaration(_ node: goast_method_declaration) {
        super.visit_method_declaration(node)
        
        // 创建对应的Func并加入到Struct的NamedType中
        guard let sig = self.handleSignature(receiver: node.receiver, parameters: node.parameters, results: node.result) else {
            return
        }
        
        guard let nameNode = node.name else {
            return
        }
        let name = self.cu.codes(pos: nameNode.pos)
        
        let f = GoFunc(name: name, sig: sig)
        
        var namedType: GoNamedType? = nil
        switch sig.recv?.typ {
        case let n as GoPointerType:
            if n.base is GoNamedType {
                namedType = n.base as? GoNamedType
            }
        case let n as GoNamedType:
            namedType = n
        default:
            break
        }
        
        if let nt = namedType {
            nt.addMethod(method: f)
        }
    }
    
    override func visit_interface_type(_ node: goast_interface_type) {
        super.visit_interface_type(node)
        
        let interfaceType = GoInterfaceType(methods: [], embeddeds: [])
        
        for member in node.children?.children ?? [] {
            switch member {
            case let memberNode as goast_method_spec:
                if let sig = self.handleSignature(receiver: nil, parameters: memberNode.parameters, results: memberNode.result) {
                    if let nameNode = memberNode.name {
                        let name = self.cu.codes(pos: nameNode.pos)
                        let f = GoFunc(name: name, sig: sig)
                        interfaceType.addMethod(method: f)
                    }
                }
            case let memberNode as goast_type_identifier:
                if let type = self.getType(memberNode) {
                    interfaceType.addEmbeded(embeded: type)
                }
            case let memberNode as goast_qualified_type:
                if let type = self.getType(memberNode) {
                    interfaceType.addEmbeded(embeded: type)
                }
            default:
                break
            }
        }
        
        interfaceType.setPosition(sp: SymbolPosition(file: self.file, node: node))
        node.setType(type: interfaceType)
    }
    
    override func visit_struct_type(_ node: goast_struct_type) {
        super.visit_struct_type(node)
        
        let structType = GoStructType(fields: [])
        
        for item in node.children?.children ?? [] {
            if let t = self.getType(item.type) {
                for nameNode in item.name {
                    let name = self.cu.codes(pos: nameNode.pos)
                    let v = GoVar(name: name, typ: t, situation: .field)
                    structType.addField(field: v)
                }
            } else {
                for nameNode in item.name {
                    let name = self.cu.codes(pos: nameNode.pos)
                    let v = GoVar(name: name, situation: .field)
                    structType.addField(field: v)
                }
            }
        }
        
        structType.setPosition(sp: SymbolPosition(file: self.file, node: node))
        node.setType(type: structType)
    }
    
    override func visit_type_spec(_ node: goast_type_spec) {
        super.visit_type_spec(node)
        
        guard let name = node.name?.getType() as? GoNamedType else {
            return
        }
        guard let t = node.type?.getType() as? GoType else {
            return
        }
        name.typ = t
    }
    
    override func visit_type_alias(_ node: goast_type_alias) {
        super.visit_type_alias(node)
        
        guard let name = node.name?.getType() as? GoNamedType else {
            return
        }
        guard let t = node.type?.getType() as? GoType else {
            return
        }
        name.typ = t
    }
    
}
