//
//  File.swift
//  
//
//  Created by 秦天欢 on 2021/4/21.
//

import Foundation
import Common


class JavaExprVisiter: JavaVisiter {
    weak var pkg: JavaPackage!
    weak var cu: CompilationUnion!
    weak var file: FileSystemObject!
    
    
    init(cu: CompilationUnion, pkg: JavaPackage, file: FileSystemObject) {
        self.cu = cu
        self.pkg = pkg
        self.file = file
        super.init()
    }
    
    override func visit_array_access(_ node: javaast_array_access) {
        super.visit_array_access(node)
        
        if let t = (node.array?.getType() as? JavaGenericArrayType)?.componentType {
            node.setType(type: t)
        }
    }
    
    override func visit_array_creation_expression(_ node: javaast_array_creation_expression) {
        super.visit_array_creation_expression(node)
        
        let typ = JavaGenericArrayType()
        typ.setPosition(sp: SymbolPosition(file: self.file, node: node))
        node.setType(type: typ)
        
        if let et = node.type?.getType() as? JavaType {
            typ.componentType = et
        }
    }
    
    override func visit_assignment_expression(_ node: javaast_assignment_expression) {
        super.visit_assignment_expression(node)

        if let t = node.right?.getType() as? JavaType {
            node.setType(type: t)
            if let l = node.left {
                if let le = l as? javaast_expression {
                    if le.getType() == nil {
                        // 一般而言Java的变量都是有类型的，如果左侧变量没有定义，则使用右侧类型
                        le.setType(type: t)
                    }
                }
            }
        } else {
            if let t = (node.left as? UASTExpr)?.getType() as? JavaType {
                node.setType(type: t)
            }
        }
    }
    
    override func visit_binary_expression(_ node: javaast_binary_expression) {
        super.visit_binary_expression(node)
        
        if let t = node.left?.getType() as? JavaType {
            node.setType(type: t)
        } else if let t = node.right?.getType() as? JavaType {
            node.setType(type: t)
        }
    }
    
    override func visit_binary_integer_literal(_ node: javaast_binary_integer_literal) {
        super.visit_binary_integer_literal(node)
        
        let typ = JavaBasicType(kind: .int)
        typ.setPosition(sp: SymbolPosition(file: self.file, node: node))
        node.setType(type: typ)
    }
    
    override func visit_boolean_type(_ node: javaast_boolean_type) {
        super.visit_boolean_type(node)
        
        let typ = JavaBasicType(kind: .boolean)
        typ.setPosition(sp: SymbolPosition(file: self.file, node: node))
        node.setType(type: typ)
    }
    
    override func visit_cast_expression(_ node: javaast_cast_expression) {
        super.visit_cast_expression(node)
        
        let typ = JavaSumType()
        for t in node.type {
            if let nt = t.getType() as? JavaType {
                typ.types.append(nt)
            }
        }
        typ.setPosition(sp: SymbolPosition(file: self.file, node: node))
        node.setType(type: typ)
    }
    
    override func visit_character_literal(_ node: javaast_character_literal) {
        super.visit_character_literal(node)
        
        let typ = JavaBasicType(kind: .char)
        typ.setPosition(sp: SymbolPosition(file: self.file, node: node))
        node.setType(type: typ)
    }
    
    override func visit_class_literal(_ node: javaast_class_literal) {
        super.visit_class_literal(node)
        
        if let typ = node.children?.getType() as? JavaType {
            node.setType(type: typ)
        }
    }
    
    override func visit_constant_declaration(_ node: javaast_constant_declaration) {
        super.visit_constant_declaration(node)
        
        if let typ = node.type?.getType() as? JavaType {
            for declarator in node.declarator {
                if let i = declarator.name {
                    i.setType(type: typ)
                }
            }
        }
    }
    
    override func visit_decimal_floating_point_literal(_ node: javaast_decimal_floating_point_literal) {
        super.visit_decimal_floating_point_literal(node)
        
        let typ = JavaBasicType(kind: .float)
        typ.setPosition(sp: SymbolPosition(file: self.file, node: node))
        node.setType(type: typ)
    }
    
    override func visit_decimal_integer_literal(_ node: javaast_decimal_integer_literal) {
        super.visit_decimal_integer_literal(node)
        
        let typ = JavaBasicType(kind: .float)
        typ.setPosition(sp: SymbolPosition(file: self.file, node: node))
        node.setType(type: typ)
    }
    
    override func visit_false(_ node: javaast_false) {
        super.visit_false(node)
        
        let typ = JavaBasicType(kind: .boolean)
        typ.setPosition(sp: SymbolPosition(file: self.file, node: node))
        node.setType(type: typ)
    }
    
    override func visit_floating_point_type(_ node: javaast_floating_point_type) {
        super.visit_floating_point_type(node)
        
        let typ = JavaBasicType(kind: .float)
        typ.setPosition(sp: SymbolPosition(file: self.file, node: node))
        node.setType(type: typ)
    }
    
    override func visit_hex_floating_point_literal(_ node: javaast_hex_floating_point_literal) {
        super.visit_hex_floating_point_literal(node)
        
        let typ = JavaBasicType(kind: .float)
        typ.setPosition(sp: SymbolPosition(file: self.file, node: node))
        node.setType(type: typ)
    }
    
    override func visit_hex_integer_literal(_ node: javaast_hex_integer_literal) {
        super.visit_hex_integer_literal(node)
        
        let typ = JavaBasicType(kind: .int)
        typ.setPosition(sp: SymbolPosition(file: self.file, node: node))
        node.setType(type: typ)
    }
    
    override func visit_instanceof_expression(_ node: javaast_instanceof_expression) {
        super.visit_instanceof_expression(node)
        
        let typ = JavaBasicType(kind: .boolean)
        typ.setPosition(sp: SymbolPosition(file: self.file, node: node))
        node.setType(type: typ)
    }
    
    override func visit_integral_type(_ node: javaast_integral_type) {
        super.visit_integral_type(node)
        
        let typ = JavaBasicType(kind: .int)
        typ.setPosition(sp: SymbolPosition(file: self.file, node: node))
        node.setType(type: typ)
    }
    
    override func visit_generic_type(_ node: javaast_generic_type) {
        super.visit_generic_type(node)
    }
    
    override func visit_local_variable_declaration(_ node: javaast_local_variable_declaration) {
        super.visit_local_variable_declaration(node)

        if let typ = node.type?.getType() as? JavaType {
            for declarator in node.declarator {
                if let i = declarator.name {
                    i.setType(type: typ)
                }
            }
        }
    }
    
    override func visit_object_creation_expression(_ node: javaast_object_creation_expression) {
        super.visit_object_creation_expression(node)
        
        if let t = node.type?.getType() as? JavaType {
            node.setType(type: t)
        }
    }
    
    override func visit_octal_integer_literal(_ node: javaast_octal_integer_literal) {
        super.visit_octal_integer_literal(node)
        
        let typ = JavaBasicType(kind: .int)
        typ.setPosition(sp: SymbolPosition(file: self.file, node: node))
        node.setType(type: typ)
    }
    
    override func visit_parenthesized_expression(_ node: javaast_parenthesized_expression) {
        super.visit_parenthesized_expression(node)
        
        if let t = node.children?.getType() as? JavaType {
            node.setType(type: t)
        }
    }
    
    override func visit_string_literal(_ node: javaast_string_literal) {
        super.visit_string_literal(node)
        
        let typ = JavaBasicType(kind: .string)
        typ.setPosition(sp: SymbolPosition(file: self.file, node: node))
        node.setType(type: typ)
    }
    
    override func visit_ternary_expression(_ node: javaast_ternary_expression) {
        super.visit_ternary_expression(node)
        
        if let typ = node.alternative?.getType() as? JavaType {
            node.setType(type: typ)
        } else if let typ = node.consequence?.getType() as? JavaType {
            node.setType(type: typ)
        }
    }
    
    override func visit_true(_ node: javaast_true) {
        super.visit_true(node)
        
        let typ = JavaBasicType(kind: .boolean)
        typ.setPosition(sp: SymbolPosition(file: self.file, node: node))
        node.setType(type: typ)
    }
    
    override func visit_unary_expression(_ node: javaast_unary_expression) {
        super.visit_unary_expression(node)
        
        if let typ = node.operand?.getType() as? JavaType {
            node.setType(type: typ)
        }
    }
    
    override func visit_update_expression(_ node: javaast_update_expression) {
        super.visit_update_expression(node)
        
        if let typ = node.children?.getType() as? JavaType {
            node.setType(type: typ)
        }
    }
    
    override func visit_void_type(_ node: javaast_void_type) {
        super.visit_void_type(node)
        
        let typ = JavaBasicType(kind: .void)
        typ.setPosition(sp: SymbolPosition(file: self.file, node: node))
        node.setType(type: typ)
    }
    
    override func visit_formal_parameter(_ node: javaast_formal_parameter) {
        super.visit_formal_parameter(node)
        
        if let typ = node.type?.getType() as? JavaType {
            if let name = node.name {
                name.setType(type: typ)
            }
        }
    }
    
    override func visit_identifier(_ node: javaast_identifier) {
        super.visit_identifier(node)
        
        if node.declarations.count == 0 {
            // 应该不需要处理
        }
        
        // 设置类型为第一个declaration的类型
        for decl in node.declarations {
            if let t = (decl.getNode() as? UASTExpr)?.getType() as? JavaType {
                node.setType(type: t)
                break
            }
        }
    }
    
    override func visit_this(_ node: javaast_this) {
        super.visit_this(node)
        
        // 搜索直接的Class
        var clazz: javaast_class_declaration? = nil
        var p = node.parent
        while p != nil {
            if p is javaast_class_declaration {
                clazz = p as? javaast_class_declaration
                break
            }
            p = p?.parent
        }
        
        if let typ = clazz?.name?.getType() as? JavaType {
            node.setType(type: typ)
        }
    }
    
    override func visit_field_access(_ node: javaast_field_access) {
        super.visit_field_access(node)

        if let ot = (node.object as? UASTExpr)?.getType() as? JavaType {
            guard let field = node.field else {return}
            
            switch ot {
            case let clazz as JavaObjectype:
                if let nt = self.type_of_class_member_invocation(clazz: clazz, member_name: self.cu.codes(pos: field.pos)) {
                    node.setType(type: nt)
                }
                break
            // TODO static等
            default:
                break
            }
        }
    }
    
    override func visit_method_invocation(_ node: javaast_method_invocation) {
        super.visit_method_invocation(node)
        if let ot = (node.object as? UASTExpr)?.getType() as? JavaType {
            guard let name = node.name else {return}
            
            switch ot {
            case let clazz as JavaObjectype:
                if let nt = self.type_of_class_method_invocation(clazz: clazz, method_name: self.cu.codes(pos: name.pos), arguments: node.arguments?.children ?? []) {
                    node.setType(type: nt)
                }
                break
            default:
                break
            }
        } else if node.name != nil && node.object == nil {
            // TODO
            var clazz: javaast_class_declaration? = nil
            var p = node.parent
            while p != nil {
                if p is javaast_class_declaration {
                    clazz = p as? javaast_class_declaration
                    break
                }
                p = p?.parent
            }
            
            if let typ = clazz?.name?.getType() as? JavaObjectype {
                if let nt = self.type_of_class_method_invocation(clazz: typ, method_name: self.cu.codes(pos: node.name!.pos), arguments: node.arguments?.children ?? []) {
                    node.setType(type: nt)
                    return
                }
            }
        }
    }
    
    private func type_of_class_method_invocation(clazz: JavaObjectype, method_name: String, arguments: [javaast_expression]) -> JavaType?{
        // 在当前clazz中搜索
        for method in clazz.methodMembers {
            if method.name != method_name {
                continue
            }
            
            // 判断参数是否满足要求
            if method.sig?.params.count != arguments.count {
                continue
            }
            
            var match = true
            for (lp, rp) in zip(method.sig!.params, arguments) {
                if !self.type_eq(left: lp.rawType, right: rp.getType() as? JavaType) {
                    match = false
                    break
                }
            }
            
            if match {
                return method.sig?.result?.rawType
            }
        }
        
        // 在parent中搜索
        for parent in clazz.superClasses {
            if let pclazz = parent as? JavaObjectype {
                if let t = self.type_of_class_method_invocation(clazz: pclazz, method_name: method_name, arguments: arguments) {
                    return t
                }
            }
        }
        
        for parent in clazz.superInterfaces {
            if let pclazz = parent as? JavaObjectype {
                if let t = self.type_of_class_method_invocation(clazz: pclazz, method_name: method_name, arguments: arguments) {
                    return t
                }
            }
        }
        
        return nil
    }
    
    private func type_of_class_member_invocation(clazz: JavaObjectype, member_name: String) -> JavaType? {

        // 在当前clazz中搜索
        for member in clazz.varMembers {
            if member.name == member_name {
                return member.rawType
            }
        }
        
        // 在parent中搜索
        for parent in clazz.superClasses {
            if let pclazz = parent as? JavaObjectype {
                if let t = self.type_of_class_member_invocation(clazz: pclazz, member_name: member_name) {
                    return t
                }
            }
        }
        
        for parent in clazz.superInterfaces {
            if let pclazz = parent as? JavaObjectype {
                if let t = self.type_of_class_member_invocation(clazz: pclazz, member_name: member_name) {
                    return t
                }
            }
        }
        
        return nil
    }
    
    private func type_eq(left: JavaType?, right: JavaType?) -> Bool {
        // TODO
        return true
    }
    
}
