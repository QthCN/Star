//
//  File.swift
//  
//
//  Created by 秦天欢 on 2021/5/1.
//

import Foundation
import Common


public func ast2structure(cu: CompilationUnion, ast: AST) -> [Structure] {
    var ss: [Structure] = []
    
    for child in ast.children_nodes {
        switch child {
        case let node as goast_const_declaration:
            ss = ss + ast2structure(cu: cu, node: node)
        case let node as goast_field_declaration_list:
            ss = ss + ast2structure(cu: cu, node: node)
        case let node as goast_function_declaration:
            ss = ss + ast2structure(cu: cu, node: node)
        case let node as goast_import_declaration:
            ss = ss + ast2structure(cu: cu, node: node)
        case let node as goast_method_declaration:
            ss = ss + ast2structure(cu: cu, node: node)
        case let node as goast_type_declaration:
            ss = ss + ast2structure(cu: cu, node: node)
        case let node as goast_var_declaration:
            ss = ss + ast2structure(cu: cu, node: node)
        default:
            break
        }
    }
    
    return ss
}

private func ast2structure(cu: CompilationUnion, node: goast_const_declaration) -> [Structure] {
    var ss: [Structure] = []
    
    for child in node.children {
        for name in child.name {
            ss.append(Structure(node: name, type: .variable, name: cu.codes(pos: name.pos)))
        }
    }
    
    return ss
}

private func ast2structure(cu: CompilationUnion, node: goast_field_declaration_list) -> [Structure] {
    var ss: [Structure] = []
    
    for child in node.children {
        for name in child.name {
            ss.append(Structure(node: name, type: .variable, name: cu.codes(pos: name.pos)))
        }
    }
    
    return ss
}

private func ast2structure(cu: CompilationUnion, node: goast_function_declaration) -> [Structure] {
    var ss: [Structure] = []
    
    if let name = node.name {
        ss.append(Structure(node: name, type: .function, name: cu.codes(pos: name.pos)))
    }
    
    return ss
}

private func ast2structure(cu: CompilationUnion, node: goast_import_declaration) -> [Structure] {
    var ss: [Structure] = []
    
    let imports = node.finds(t: goast_import_spec.self)
    for i in imports {
        if let name = (i as? goast_import_spec)?.name {
            ss.append(Structure(node: name, type: .imp, name: cu.codes(pos: name.pos)))
        }
    }
    
    return ss
}

private func ast2structure(cu: CompilationUnion, node: goast_method_declaration) -> [Structure] {
    var ss: [Structure] = []
    
    if let name = node.name {
        if let receiver = node.receiver {
            if receiver.children.count == 1 {
                if let typ = (receiver.children[0] as? goast_parameter_declaration)?.type {
                    ss.append(Structure(node: name, type: .function, name: "\(cu.codes(pos: typ.pos)).\(cu.codes(pos: name.pos))"))
                } else {
                    ss.append(Structure(node: name, type: .function, name: cu.codes(pos: name.pos)))
                }
            } else {
                ss.append(Structure(node: name, type: .function, name: cu.codes(pos: name.pos)))
            }
        } else {
            ss.append(Structure(node: name, type: .function, name: cu.codes(pos: name.pos)))
        }
    }
    
    return ss
}

private func ast2structure(cu: CompilationUnion, node: goast_type_declaration) -> [Structure] {
    var ss: [Structure] = []
    
    if let name = node.find(t: goast_type_identifier.self) {
        ss.append(Structure(node: name, type: .type, name: cu.codes(pos: name.pos)))
    }
    
    return ss
}

private func ast2structure(cu: CompilationUnion, node: goast_var_declaration) -> [Structure] {
    var ss: [Structure] = []
    
    for child in node.children {
        for name in child.name {
            ss.append(Structure(node: name, type: .variable, name: cu.codes(pos: name.pos)))
        }
    }
    
    return ss
}
