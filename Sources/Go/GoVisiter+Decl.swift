//
//  File.swift
//  
//
//  Created by 秦天欢 on 2020/12/20.
//

import Foundation
import Common


// 执行分析，分析的结果存在AST节点中
class GoDeclVisiter: GoVisiter {
    
    var cu: CompilationUnion
    var pkgScope: Scope
    var currentScope: Scope
    var fileObject: FileSystemObject
    init(cu: CompilationUnion, pkgScope: Scope, fileObject: FileSystemObject) {
        self.cu = cu
        self.pkgScope = pkgScope
        self.fileObject = fileObject
        self.currentScope = Scope(parent: self.pkgScope, name: "File")
        super.init()
        self.handleError = true
    }
    
    func pushScope(_ name: String = "Anonymous") {
        let newScope = Scope(parent: self.currentScope, name: name)
        self.currentScope = newScope
    }
    
    func popScope() {
        self.currentScope = self.currentScope.parent ?? self.currentScope
    }
    
    override func visit_node(_ node: GoAST) {
        super.visit_node(node)
        node.setScope(self.currentScope)
    }
    
    override func visit_block(_ node: goast_block) {
        self.pushScope("Block")
        super.visit_block(node)
        self.popScope()
    }
    
    
    override func visit_communication_case(_ node: goast_communication_case) {
        self.pushScope("CommunicationCase")
        super.visit_communication_case(node)
        self.popScope()
    }
    
    override func visit_composite_literal(_ node: goast_composite_literal) {
        self.pushScope("CompositeLiteral")
        super.visit_composite_literal(node)
        self.popScope()
    }
    
    override func visit_const_declaration(_ node: goast_const_declaration) {
        super.visit_const_declaration(node)
        
        // 处理左侧变量
        let constSpecs = node.finds(t: goast_const_spec.self)
        for constSpec in constSpecs {
            let cs = constSpec as! goast_const_spec
            for name in cs.name {
                self.currentScope.declare(name: self.cu.codes(pos: name.pos), node: name)
                name.setDeclarations([
                    SymbolPosition(file: self.fileObject, node: name)
                ])
            }
        }
    }
    
    override func visit_default_case(_ node: goast_default_case) {
        self.pushScope("DefaultCase")
        super.visit_default_case(node)
        self.popScope()
    }
    
    override func visit_expression_case(_ node: goast_expression_case) {
        self.pushScope("ExpressionCase")
        super.visit_expression_case(node)
        self.popScope()
    }
    
    override func visit_expression_switch_statement(_ node: goast_expression_switch_statement) {
        self.pushScope("ExpressionSwitchStatement")
        super.visit_expression_switch_statement(node)
        self.popScope()
    }
    
    override func visit_field_declaration(_ node: goast_field_declaration) {
        super.visit_field_declaration(node)
        
        // 处理field_name变量
        for name in node.name {
            self.currentScope.declare(name: self.cu.codes(pos: name.pos), node: name)
            name.setDeclarations([
                SymbolPosition(file: self.fileObject, node: name)
            ])
        }
    }
    
    override func visit_field_identifier(_ node: goast_field_identifier) {
        super.visit_field_identifier(node)
        
        // 设置文件内的decl
        let name = self.cu.codes(pos: node.pos)
        if let decl = self.currentScope.find(name: name) {
            node.setDeclarations([
                SymbolPosition(file: self.fileObject, node: decl)
            ])
        }
    }
    
    override func visit_for_statement(_ node: goast_for_statement) {
        self.pushScope("ForStatement")
        super.visit_for_statement(node)
        self.popScope()
    }
    
    override func visit_func_literal(_ node: goast_func_literal) {
        self.pushScope("FuncLiteral")
        super.visit_func_literal(node)
        self.popScope()
    }
    
    override func visit_function_declaration(_ node: goast_function_declaration) {
        self.pushScope("FunctionDeclaration")
        super.visit_function_declaration(node)
        self.popScope()
        
        if let name = node.name {
            self.currentScope.declare(name: self.cu.codes(pos: name.pos), node: name)
            name.setDeclarations([
                SymbolPosition(file: self.fileObject, node: name)
            ])
        }
    }
    
    override func visit_identifier(_ node: goast_identifier) {
        super.visit_identifier(node)
        
        // 设置文件内的decl
        let name = self.cu.codes(pos: node.pos)
        if let decl = self.currentScope.find(name: name) {
            node.setDeclarations([
                SymbolPosition(file: self.fileObject, node: decl)
            ])
        }
    }
    
    override func visit_if_statement(_ node: goast_if_statement) {
        self.visit_node(node)
        self.pushScope("IfStatement")
        
        if let ast = node.initializer {
            self.visit__simple_statement(ast)
        }

        if let ast = node.condition {
            self.visit__expression(ast)
        }
        
        self.pushScope("IfConsequence")
        if let ast = node.consequence {
            self.visit_block(ast)
        }
        self.popScope()
        
        self.pushScope("IfAlternative")
        if let ast = node.alternative {
            self.visit_ast(ast)
        }
        self.popScope()
        
        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
        
        self.popScope()
    }
    
    override func visit_import_declaration(_ node: goast_import_declaration) {
        super.visit_import_declaration(node)
        
        // 处理goast_package_identifier
        let goast_package_identifiers = node.finds(t: goast_package_identifier.self)
        for identifier in goast_package_identifiers {
            let name = identifier as! goast_package_identifier
            self.currentScope.declare(name: self.cu.codes(pos: name.pos), node: name)
            name.setDeclarations([
                SymbolPosition(file: self.fileObject, node: name)
            ])
        }
    }
    
    override func visit_label_name(_ node: goast_label_name) {
        super.visit_label_name(node)
        
        self.currentScope.declare(name: self.cu.codes(pos: node.pos), node: node)
        node.setDeclarations([
            SymbolPosition(file: self.fileObject, node: node)
        ])
    }
    
    override func visit_method_declaration(_ node: goast_method_declaration) {
        self.pushScope("MethodDeclaration")
        super.visit_method_declaration(node)
        self.popScope()
        
        // 对于Method我们不做name的处理，因为实际上name属于receiver
    }
    
    override func visit_package_identifier(_ node: goast_package_identifier) {
        super.visit_package_identifier(node)
        
        // 设置文件内的decl
        let name = self.cu.codes(pos: node.pos)
        if let decl = self.currentScope.find(name: name) {
            node.setDeclarations([
                SymbolPosition(file: self.fileObject, node: decl)
            ])
        }
    }
    
    override func visit_function_type(_ node: goast_function_type) {
        self.pushScope("FunctionType")
        super.visit_function_type(node)
        self.popScope()
    }
    
    override func visit_method_spec_list(_ node: goast_method_spec_list) {
        self.pushScope("MethodSpecList")
        super.visit_method_spec_list(node)
        self.popScope()
    }
    
    override func visit_field_declaration_list(_ node: goast_field_declaration_list) {
        self.pushScope("FieldDeclarationList")
        super.visit_field_declaration_list(node)
        self.popScope()
    }
    
    override func visit_parameter_declaration(_ node: goast_parameter_declaration) {
        super.visit_parameter_declaration(node)
        
        for name in node.name {
            self.currentScope.declare(name: self.cu.codes(pos: name.pos), node: name)
            name.setDeclarations([
                SymbolPosition(file: self.fileObject, node: name)
            ])
        }
    }
    
    override func visit_short_var_declaration(_ node: goast_short_var_declaration) {
        super.visit_short_var_declaration(node)
        
        if let left = node.left {
            if let right = node.right {
                let op = self.cu.codesBetweenPos(left.pos, right.pos).trimmingCharacters(in: .whitespacesAndNewlines)
                if op != ":=" {
                    return
                }
            }
            
            let identifiers = left.finds(t: goast_identifier.self)
            for identifier in identifiers {
                let name = identifier as! goast_identifier
                if self.currentScope.find(name: self.cu.codes(pos: name.pos)) != nil && identifiers.count > 1 {
                    // 如果name已经有定义了并且左侧变量个数大于1
                } else {
                    self.currentScope.declare(name: self.cu.codes(pos: name.pos), node: name)
                    name.setDeclarations([
                        SymbolPosition(file: self.fileObject, node: name)
                    ])
                }
            }
        }
    }
    
    override func visit_source_file(_ node: goast_source_file) {
        super.visit_source_file(node)
        // 这里不做File层面的Scope的定义，具体的Scope在init时已经创建了
    }
    
    override func visit_type_alias(_ node: goast_type_alias) {
        super.visit_type_alias(node)
        
        if let name = node.name {
            self.currentScope.declare(name: self.cu.codes(pos: name.pos), node: name)
            name.setDeclarations([
                SymbolPosition(file: self.fileObject, node: name)
            ])
        }
    }
    
    override func visit_type_case(_ node: goast_type_case) {
        self.pushScope("TypeCase")
        super.visit_type_case(node)
        self.popScope()
    }
    
    override func visit_type_declaration(_ node: goast_type_declaration) {
        super.visit_type_declaration(node)
        
        // typeSpec情况
        let typeSpecs = node.finds(t: goast_type_spec.self)
        for typeSpec in typeSpecs {
            if let name = (typeSpec as! goast_type_spec).name {
                self.currentScope.declare(name: self.cu.codes(pos: name.pos), node: name)
                name.setDeclarations([
                    SymbolPosition(file: self.fileObject, node: name)
                ])
            }
        }
        
        // typeAlias情况
        let typeAliases = node.finds(t: goast_type_alias.self)
        for typeAlias in typeAliases {
            if let name = (typeAlias as! goast_type_alias).name {
                self.currentScope.declare(name: self.cu.codes(pos: name.pos), node: name)
                name.setDeclarations([
                    SymbolPosition(file: self.fileObject, node: name)
                ])
            }
        }
    }
    
    override func visit_type_identifier(_ node: goast_type_identifier) {
        super.visit_type_identifier(node)
        
        // 设置文件内的decl
        let name = self.cu.codes(pos: node.pos)
        if let decl = self.currentScope.find(name: name) {
            node.setDeclarations([
                SymbolPosition(file: self.fileObject, node: decl)
            ])
        }
    }
    
    override func visit_type_switch_statement(_ node: goast_type_switch_statement) {
        self.pushScope("TypeSwitchStatement")
        
        self.visit_node(node)
        
        if let ast = node.initializer {
            self.visit__simple_statement(ast)
        }

        if let ast = node.alias {
            self.visit_expression_list(ast)
            let identifiers = ast.finds(t: goast_identifier.self)
            for identifier in identifiers {
                let name = identifier as! goast_identifier
                self.currentScope.declare(name: self.cu.codes(pos: name.pos), node: name)
                name.setDeclarations([
                    SymbolPosition(file: self.fileObject, node: name)
                ])
            }
        }

        if let ast = node.value {
            self.visit__expression(ast)
        }

        for ast in node.children {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
        self.popScope()
    }
    
    override func visit_var_declaration(_ node: goast_var_declaration) {
        super.visit_var_declaration(node)
        
        // 处理左侧变量
        let varSpecs = node.finds(t: goast_var_spec.self)
        for varSpec in varSpecs {
            let vs = varSpec as! goast_var_spec
            for name in vs.name {
                self.currentScope.declare(name: self.cu.codes(pos: name.pos), node: name)
                name.setDeclarations([
                    SymbolPosition(file: self.fileObject, node: name)
                ])
            }
        }
    }
    
    override func visit_variadic_parameter_declaration(_ node: goast_variadic_parameter_declaration) {
        super.visit_variadic_parameter_declaration(node)
        
        if let name = node.name {
            self.currentScope.declare(name: self.cu.codes(pos: name.pos), node: name)
            name.setDeclarations([
                SymbolPosition(file: self.fileObject, node: name)
            ])
        }
    }
    
    override func visit_range_clause(_ node: goast_range_clause) {
        super.visit_range_clause(node)
        
        if let left = node.left {
            if let right = node.right {
                let op = self.cu.codesBetweenPos(left.pos, right.pos).trimmingCharacters(in: .whitespacesAndNewlines)
                if !op.contains(":=") {
                    return
                }
            }
            
            let identifiers = left.finds(t: goast_identifier.self)
            for identifier in identifiers {
                let name = identifier as! goast_identifier
                if self.currentScope.find(name: self.cu.codes(pos: name.pos)) != nil && identifiers.count > 1 {
                    // 如果name已经有定义了并且左侧变量个数大于1
                } else {
                    self.currentScope.declare(name: self.cu.codes(pos: name.pos), node: name)
                    name.setDeclarations([
                        SymbolPosition(file: self.fileObject, node: name)
                    ])
                }
            }
        }
    }
    
    override func visit_selector_expression(_ node: goast_selector_expression) {
        super.visit_selector_expression(node)
        
        if let field = node.field {
            // selector的field的declaration会在后面typeinfer时处理
            field._declarations = []
        }
    }
    
    override func visit_qualified_type(_ node: goast_qualified_type) {
        super.visit_qualified_type(node)
        
        if let name = node.name {
            // qualified_type的name的declaration会在后面typeinfer时处理
            name._declarations = []
        }
    }
    
    override func visit_receive_statement(_ node: goast_receive_statement) {
        super.visit_receive_statement(node)
        
        if let left = node.left {
            if let right = node.right {
                let op = self.cu.codesBetweenPos(left.pos, right.pos).trimmingCharacters(in: .whitespacesAndNewlines)
                if op != ":=" {
                    return
                }
            }
            
            let identifiers = left.finds(t: goast_identifier.self)
            for identifier in identifiers {
                let name = identifier as! goast_identifier
                if self.currentScope.find(name: self.cu.codes(pos: name.pos)) != nil && identifiers.count > 1 {
                    // 如果name已经有定义了并且左侧变量个数大于1
                } else {
                    self.currentScope.declare(name: self.cu.codes(pos: name.pos), node: name)
                    name.setDeclarations([
                        SymbolPosition(file: self.fileObject, node: name)
                    ])
                }
            }
        }
    }
    
}
