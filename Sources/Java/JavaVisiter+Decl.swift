//
//  File.swift
//  
//
//  Created by 秦天欢 on 2021/4/8.
//

import Foundation
import Common


class JavaDeclVisiter: JavaVisiter {
    
    var cu: CompilationUnion
    var pkg: JavaPackage
    var pkgScope: Scope
    var currentScope: Scope
    var fileObject: FileSystemObject
    
    
    init(cu: CompilationUnion, pkg: JavaPackage, pkgScope: Scope, fileObject: FileSystemObject) {
        self.cu = cu
        self.pkg = pkg
        self.pkgScope = pkgScope
        self.fileObject = fileObject
        // 这里的命名格式用于根据scope反查File
        self.currentScope = Scope(parent: self.pkgScope, name: "File - \(fileObject.rpath())")
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
    
    override func visit_node(_ node: JavaAST) {
        super.visit_node(node)
        node.setScope(self.currentScope)
    }
    
    override func visit_annotation_type_body(_ node: javaast_annotation_type_body) {
        self.pushScope("AnnotationTypeBody")
        super.visit_annotation_type_body(node)
        self.popScope()
    }
    
    override func visit_annotation_type_declaration(_ node: javaast_annotation_type_declaration) {
        super.visit_annotation_type_declaration(node)
        
        if let name = node.name {
            self.currentScope.declare(name: self.cu.codes(pos: name.pos), node: name)
            name.setDeclarations([
                SymbolPosition(file: self.fileObject, node: name)
            ])
        }
    }
    
    override func visit_annotation_type_element_declaration(_ node: javaast_annotation_type_element_declaration) {
        super.visit_annotation_type_element_declaration(node)
        
        if let name = node.name {
            self.currentScope.declare(name: self.cu.codes(pos: name.pos), node: name)
            name.setDeclarations([
                SymbolPosition(file: self.fileObject, node: name)
            ])
        }
    }
    
    override func visit_block(_ node: javaast_block) {
        self.pushScope("Block")
        super.visit_block(node)
        self.popScope()
    }
    
    override func visit_catch_clause(_ node: javaast_catch_clause) {
        self.pushScope("CatchClause")
        super.visit_catch_clause(node)
        self.popScope()
    }
    
    override func visit_catch_formal_parameter(_ node: javaast_catch_formal_parameter) {
        super.visit_catch_formal_parameter(node)
        
        if let name = node.name {
            self.currentScope.declare(name: self.cu.codes(pos: name.pos), node: name)
            name.setDeclarations([
                SymbolPosition(file: self.fileObject, node: name)
            ])
        }
    }
    
    override func visit_class_body(_ node: javaast_class_body) {
        self.pushScope("ClassBody")
        super.visit_class_body(node)
        self.popScope()
    }
    
    override func visit_class_declaration(_ node: javaast_class_declaration) {
        if let name = node.name {
            self.currentScope.declare(name: self.cu.codes(pos: name.pos), node: name)
            name.setDeclarations([
                SymbolPosition(file: self.fileObject, node: name)
            ])
        }
        
        super.visit_class_declaration(node)
    }
    
    override func visit_constructor_body(_ node: javaast_constructor_body) {
        self.pushScope("ConstructorBody")
        super.visit_constructor_body(node)
        self.popScope()
    }
    
    override func visit_do_statement(_ node: javaast_do_statement) {
        self.pushScope("DoStatement")
        super.visit_do_statement(node)
        self.popScope()
    }
    
    override func visit_enhanced_for_statement(_ node: javaast_enhanced_for_statement) {
        self.pushScope("EnhancedForStatement")
        
        if let name = node.name {
            self.currentScope.declare(name: self.cu.codes(pos: name.pos), node: name)
            name.setDeclarations([
                SymbolPosition(file: self.fileObject, node: name)
            ])
        }
        
        super.visit_enhanced_for_statement(node)
        self.popScope()
    }
    
    override func visit_enum_body(_ node: javaast_enum_body) {
        self.pushScope("EnumBody")
        super.visit_node(node)
        self.popScope()
    }
    
    override func visit_enum_declaration(_ node: javaast_enum_declaration) {
        if let name = node.name {
            self.currentScope.declare(name: self.cu.codes(pos: name.pos), node: name)
            name.setDeclarations([
                SymbolPosition(file: self.fileObject, node: name)
            ])
        }
        
        super.visit_enum_declaration(node)
    }
    
    override func visit_finally_clause(_ node: javaast_finally_clause) {
        self.pushScope("FinallyClause")
        super.visit_finally_clause(node)
        self.popScope()
    }
    
    override func visit_for_statement(_ node: javaast_for_statement) {
        self.pushScope("ForStatement")
        super.visit_for_statement(node)
        self.popScope()
    }
    
    override func visit_formal_parameter(_ node: javaast_formal_parameter) {
        if let name = node.name {
            self.currentScope.declare(name: self.cu.codes(pos: name.pos), node: name)
            name.setDeclarations([
                SymbolPosition(file: self.fileObject, node: name)
            ])
        }
        
        super.visit_formal_parameter(node)
    }
    
    override func visit_if_statement(_ node: javaast_if_statement) {
        self.pushScope("IfStatement")
        super.visit_if_statement(node)
        self.popScope()
    }
    
    override func visit_inferred_parameters(_ node: javaast_inferred_parameters) {
        for name in node.children {
            self.currentScope.declare(name: self.cu.codes(pos: name.pos), node: name)
            name.setDeclarations([
                SymbolPosition(file: self.fileObject, node: name)
            ])
        }
        
        super.visit_inferred_parameters(node)
    }
    
    override func visit_interface_body(_ node: javaast_interface_body) {
        self.pushScope("InterfaceBody")
        super.visit_interface_body(node)
        self.popScope()
    }
    
    override func visit_interface_declaration(_ node: javaast_interface_declaration) {
        if let name = node.name {
            self.currentScope.declare(name: self.cu.codes(pos: name.pos), node: name)
            name.setDeclarations([
                SymbolPosition(file: self.fileObject, node: name)
            ])
        }
        
        super.visit_interface_declaration(node)
    }
    
    override func visit_labeled_statement(_ node: javaast_labeled_statement) {
        self.pushScope("LabeledStatement")
        super.visit_labeled_statement(node)
        self.popScope()
    }
    
    override func visit_lambda_expression(_ node: javaast_lambda_expression) {
        self.pushScope("LambdaExpression")
        super.visit_lambda_expression(node)
        self.popScope()
    }
    
    override func visit_method_declaration(_ node: javaast_method_declaration) {
        self.pushScope("MethodDeclaration")
        super.visit_method_declaration(node)
        self.popScope()
    }
    
    override func visit_module_body(_ node: javaast_module_body) {
        self.pushScope("ModuleBody")
        super.visit_module_body(node)
        self.popScope()
    }
    
    override func visit_program(_ node: javaast_program) {
        self.pushScope("Program")
        super.visit_program(node)
        self.popScope()
    }
    
    override func visit_resource(_ node: javaast_resource) {
        if let name = node.name {
            self.currentScope.declare(name: self.cu.codes(pos: name.pos), node: name)
            name.setDeclarations([
                SymbolPosition(file: self.fileObject, node: name)
            ])
        }
        
        super.visit_resource(node)
    }
    
    override func visit_switch_block(_ node: javaast_switch_block) {
        self.pushScope("SwitchBlock")
        super.visit_switch_block(node)
        self.popScope()
    }
    
    override func visit_switch_statement(_ node: javaast_switch_statement) {
        self.pushScope("SwitchStatement")
        super.visit_switch_statement(node)
        self.popScope()
    }
    
    override func visit_synchronized_statement(_ node: javaast_synchronized_statement) {
        self.pushScope("SynchronizedStatement")
        super.visit_synchronized_statement(node)
        self.popScope()
    }
    
    override func visit_throw_statement(_ node: javaast_throw_statement) {
        self.pushScope("ThrowStatement")
        super.visit_throw_statement(node)
        self.popScope()
    }
    
    override func visit_try_statement(_ node: javaast_try_statement) {
        self.pushScope("TryStatement")
        super.visit_try_statement(node)
        self.popScope()
    }
    
    override func visit_try_with_resources_statement(_ node: javaast_try_with_resources_statement) {
        self.pushScope("TryWithResourcesStatement")
        super.visit_try_with_resources_statement(node)
        self.popScope()
    }
    
    override func visit_variable_declarator(_ node: javaast_variable_declarator) {
        if let name = node.name {
            self.currentScope.declare(name: self.cu.codes(pos: name.pos), node: name)
            name.setDeclarations([
                SymbolPosition(file: self.fileObject, node: name)
            ])
        }
        
        super.visit_variable_declarator(node)
    }
    
    override func visit_while_statement(_ node: javaast_while_statement) {
        self.pushScope("WhileStatement")
        super.visit_while_statement(node)
        self.popScope()
    }
    
    override func visit_import_declaration(_ node: javaast_import_declaration) {
        var s = self.cu.codes(pos: node.pos)
        s = s.components(separatedBy: ";").first ?? ""
        let p = s.components(separatedBy: .whitespaces)
        var parts: [String] = []
        for item in p {
            if item.trimmingCharacters(in: .whitespaces) != "" {
                parts.append(item)
            }
        }
        
        // 判断是否为asterisk
        let isAsterisk = parts.last!.hasSuffix(".*")
        
        // 判读是否为static
        let isStatic = parts.count > 2 && parts[1] == "static"
        
        // 获取name
        var fullname = ""
        var namestr = ""
        var classname = ""
        var methodname = ""
        if isStatic {
            namestr = parts[2]
            var names = namestr.components(separatedBy: ".")
            if names.count >= 3 {
                classname = names.last!
                names = names.dropLast()
                methodname = names.last!
                names = names.dropLast()
                fullname = names.joined(separator: ".")
            }
            
        } else if parts.count > 1 {
            namestr = parts[1]
            var names = namestr.components(separatedBy: ".")
            classname = names.last!
            names = names.dropLast()
            fullname = names.joined(separator: ".")
        }
    
        if fullname != "" {
            self.pkg.addImport(filepath: self.fileObject.rpath(), impt: JavaImport(fullname: fullname, classname: classname, methodname: methodname, isAsterisk: isAsterisk, isStatic: isStatic))
        }
        
        super.visit_import_declaration(node)
    }
    
    
    // module_declaration
    // package_declaration
    
}
