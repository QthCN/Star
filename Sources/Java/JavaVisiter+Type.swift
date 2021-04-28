//
//  File.swift
//  
//
//  Created by 秦天欢 on 2021/4/13.
//

import Foundation
import Common


class JavaTypeVisiter: JavaVisiter {
    
    weak var pkg: JavaPackage!
    weak var cu: CompilationUnion!
    weak var file: FileSystemObject!
    
    
    init(cu: CompilationUnion, pkg: JavaPackage, file: FileSystemObject) {
        self.cu = cu
        self.pkg = pkg
        self.file = file
        super.init()
    }
    
    private func get_current_imports() -> [JavaImport] {
        return self.pkg.imports[self.file.rpath()] ?? []
    }
    
    private func find_symbol_from_imports(name: String) -> SymbolPosition? {
        for imp in self.get_current_imports() {
            if imp.classname == name {
                let targetPkgs = self.pkg.getPkgByImport(imp)
                if targetPkgs.count > 0 {
                    return targetPkgs[0].findSymbol(name: name)
                }
            } else if imp.isAsterisk {
                let targetPkgs = self.pkg.getPkgByImport(imp)
                for targetPkg in targetPkgs {
                    if let symbolNode = targetPkg.findSymbol(name: name) {
                        return symbolNode
                    }
                }
            } else {
                // 处理其它情况
            }
        }
        return nil
    }
    
    private func getType(_ node: JavaAST?) -> JavaType? {
        guard let typeNode = node as? UASTExpr else {
            return nil
        }
        
        if let javaType = typeNode.getType() as? JavaType {
            return javaType
        }
        
        let s = self.cu.codes(pos: node!.pos)
        
        // 根据node的类型获取其type
        switch typeNode {
        case is javaast_type_identifier:
            if let decl = node!.getScope()?.find(name: s) as? UASTExpr {
                // 在当前文件中查找，对于内部类的定义其也会声明在scope中，所以会一并处理
                return decl.getType() as? JavaType
            } else if let decl = self.find_symbol_from_imports(name: s) {
                // 在imports中查找
                return (decl.getNode() as? UASTExpr)?.getType() as? JavaType
            } else if let decl = self.pkg.findSymbol(name: s) {
                // 在本package中查找
                return (decl.getNode() as? UASTExpr)?.getType() as? JavaType
            } else {
                return nil
            }
        default:
            return nil
        }
    }
    
    override func visit_identifier(_ node: javaast_identifier) {
        super.visit_identifier(node)
        
        // 设置文件内的decl
        if node.listDeclarations().count == 0 {
            if node.parent is javaast_field_access {
                let p = node.parent as! javaast_field_access
                if p.object?.pos.startBytes == node.pos.startBytes {
                    let name = self.cu.codes(pos: node.pos)
                    if let decl = node.getScope()?.find(name: name) {
                        node.setDeclarations([
                            SymbolPosition(file: self.file, node: decl)
                        ])
                    }
                } else {
                    // 对于field_identifier，放在Expr阶段处理
                }
            } else {
                let name = self.cu.codes(pos: node.pos)
                if let decl = node.getScope()?.find(name: name) {
                    node.setDeclarations([
                        SymbolPosition(file: self.file, node: decl)
                    ])
                }
            }
        }
    }
    
    override func visit_void_type(_ node: javaast_void_type) {
        super.visit_void_type(node)
        
        let typ = JavaBasicType(kind: .void)
        typ.setPosition(sp: SymbolPosition(file: self.file, node: node))
        node.setType(type: typ)
    }
    
    override func visit_integral_type(_ node: javaast_integral_type) {
        super.visit_integral_type(node)
        
        let typ = JavaBasicType(kind: .int)
        typ.setPosition(sp: SymbolPosition(file: self.file, node: node))
        node.setType(type: typ)
    }
    
    override func visit_floating_point_type(_ node: javaast_floating_point_type) {
        super.visit_floating_point_type(node)
        
        let typ = JavaBasicType(kind: .float)
        typ.setPosition(sp: SymbolPosition(file: self.file, node: node))
        node.setType(type: typ)
    }
    
    override func visit_boolean_type(_ node: javaast_boolean_type) {
        super.visit_boolean_type(node)
        
        let typ = JavaBasicType(kind: .boolean)
        typ.setPosition(sp: SymbolPosition(file: self.file, node: node))
        node.setType(type: typ)
    }
    
    override func visit_type_identifier(_ node: javaast_type_identifier) {
        super.visit_type_identifier(node)
        
        if let type = self.getType(node) {
            node.setType(type: type)
        }
    }
    
    override func visit_array_type(_ node: javaast_array_type) {
        super.visit_array_type(node)
        
        let typ = JavaGenericArrayType()
        typ.setPosition(sp: SymbolPosition(file: self.file, node: node))
        node.setType(type: typ)
        
        if let et = node.element?.getType() as? JavaType {
            typ.componentType = et
        }
    }
    
    override func visit_field_declaration(_ node: javaast_field_declaration) {
        super.visit_field_declaration(node)
        
        if let t = self.getType(node.type) {
            for variable in node.declarator {
                if let name = variable.name {
                    if let v = name.getType() as? JavaVar {
                        v.rawType = t
                        name.setType(type: t)
                    }
                }
            }
        } else {
            for variable in node.declarator {
                if let name = variable.name {
                    name.setType(type: nil)
                }
            }
        }
    }
    
    override func visit_method_declaration(_ node: javaast_method_declaration) {
        super.visit_method_declaration(node)
        
        guard let nt = node.name?.getType() as? JavaMethod else {return}
        
        // 设置sig
        let sig = JavaSignatureType()
        
        if let rt = self.getType(node.type) {
            let rv = JavaVar()
            rv.rawType = rt
            rv.node = node.type
            sig.result = rv
        }
        
        sig.params = []
        for param in node.parameters?.children ?? [] {
            switch param {
            case let pn as javaast_formal_parameter:
                let pv = JavaVar()
                if let name = pn.name {
                    pv.name = self.cu.codes(pos: name.pos)
                }
                if let pt = self.getType(pn.type) {
                    pv.rawType = pt
                }
                pv.node = param
                sig.params.append(pv)
                break
            case let pn as javaast_receiver_parameter:
                // TODO
                break
            case let pn as javaast_spread_parameter:
                // TODO
                break
            default:
                let pv = JavaVar()
                pv.rawType = JavaUnknownType()
                pv.node = param
                sig.params.append(pv)
            }
        }
        
        nt.sig = sig
    }
    
    override func visit_scoped_type_identifier(_ node: javaast_scoped_type_identifier) {
        super.visit_scoped_type_identifier(node)
        
        // TODO
    }
    
    override func visit_generic_type(_ node: javaast_generic_type) {
        super.visit_generic_type(node)
        
        // TODO
    }
    
}
