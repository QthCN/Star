//
//  File 2.swift
//  
//
//  Created by 秦天欢 on 2021/2/24.
//

import Foundation
import Common

func GenCallGraph_ast(cu: CompilationUnion, node: AST) -> [CGNode] {
    var records: [CGNode] = []
    
    switch node {
    case let target as goast_call_expression:
        let target_records = GenCallGraph_goast_call_expression(cu: cu, node: target)
        for cr in target_records {
            records.append(cr)
        }
    case let target as goast_if_statement:
        if let record = GenCallGraph_goast_if_statement(cu: cu, node: target) {
            records.append(record)
        }
    case let target as goast_for_statement:
        if let record = GenCallGraph_goast_for_statement(cu: cu, node: target) {
            records.append(record)
        }
    case let target as goast_select_statement:
        if let record = GenCallGraph_goast_select_statement(cu: cu, node: target) {
            records.append(record)
        }
    case let target as goast_expression_switch_statement:
        if let record = GenCallGraph_goast_expression_switch_statement(cu: cu, node: target) {
            records.append(record)
        }
    case let target as goast_type_switch_statement:
        if let record = GenCallGraph_goast_type_switch_statement(cu: cu, node: target) {
            records.append(record)
        }
    default:
        for child_node in node.children_nodes {
            let child_records = GenCallGraph_ast(cu: cu, node: child_node)
            for cr in child_records {
                records.append(cr)
            }
        }
    }
    
    return records
}

func GenCallGraph_goast_method_declaration(cu: CompilationUnion, node: goast_method_declaration) -> CGCaller? {
    let caller = CGCaller(pos: "\(node.pos.startLine+1):\(node.pos.startCol+1)")
    guard let name = node.name else { return nil }
    caller.name = cu.codes(pos: name.pos)
    if let body = node.body {
        caller.nodes = GenCallGraph_ast(cu: cu, node: body)
    }

    return caller
}


func GenCallGraph_goast_function_declaration(cu: CompilationUnion, node: goast_function_declaration) -> CGCaller? {
    let caller = CGCaller(pos: "\(node.pos.startLine+1):\(node.pos.startCol+1)")
    guard let name = node.name else { return nil }
    caller.name = cu.codes(pos: name.pos)
    if let body = node.body {
        caller.nodes = GenCallGraph_ast(cu: cu, node: body)
    }
    
    return caller
}


func GenCallGraph_get_names_from_expr(cu: CompilationUnion, node: AST) -> String {
    switch node {
    case let name as goast_identifier:
        return cu.codes(pos: name.pos)
    case let name as goast_field_identifier:
        return cu.codes(pos: name.pos)
    case let selector as goast_selector_expression:
        var s = ""
        if let operand = selector.operand {
            s += GenCallGraph_get_names_from_expr(cu: cu, node: operand)
        }
        if s != "" {
            s += "."
        }
        if let field = selector.field {
            s += GenCallGraph_get_names_from_expr(cu: cu, node: field)
        } else {
            return ""
        }
        return s
    default:
        return ""
    }
}


func GenCallGraph_goast_call_expression(cu: CompilationUnion, node: goast_call_expression) -> [CGNode] {
    var records: [CGNode] = []
    let callee = CGCallee(pos: "\(node.pos.startLine+1):\(node.pos.startCol+1)")
    guard let function = node.function else { return [] }
    callee.name = GenCallGraph_get_names_from_expr(cu: cu, node: function)
    if callee.name == "" {
        return []
    }
    
    records.append(callee)
    
    for child_node in node.children_nodes {
        let child_records = GenCallGraph_ast(cu: cu, node: child_node)
        for cr in child_records {
            records.append(cr)
        }
    }
    return records
}

func GenCallGraph_goast_if_statement(cu: CompilationUnion, node: goast_if_statement) -> CGCondition? {
    let condition = CGCondition(pos: "\(node.pos.startLine+1):\(node.pos.startCol+1)")
    condition.name = "If"
    
    if let initialize = node.initializer {
        condition.initialize = GenCallGraph_ast(cu: cu, node: initialize)
    }
    
    if let cond = node.condition {
        condition.condition = GenCallGraph_ast(cu: cu, node: cond)
    }
    
    if let consequence = node.consequence {
        condition.branch["true"] = GenCallGraph_ast(cu: cu, node: consequence)
    }
    
    if let alternative = node.alternative {
        condition.branch["false"] = GenCallGraph_ast(cu: cu, node: alternative)
    }
    
    return condition
}


func GenCallGraph_goast_for_statement(cu: CompilationUnion, node: goast_for_statement) -> CGCondition? {
    let condition = CGCondition(pos: "\(node.pos.startLine+1):\(node.pos.startCol+1)")
    condition.name = "For"
    
    if let body = node.body {
        condition.branch["body"] = GenCallGraph_ast(cu: cu, node: body)
    }
    
    switch node.children {
    case let for_clause as goast_for_clause:
        if let cond = for_clause.condition {
            condition.condition = GenCallGraph_ast(cu: cu, node: cond)
        }
        if let initialize = for_clause.initializer {
            condition.initialize = GenCallGraph_ast(cu: cu, node: initialize)
        }
        if let update = for_clause.update {
            condition.update = GenCallGraph_ast(cu: cu, node: update)
        }
    case let range_clause as goast_range_clause:
        if let initialize = range_clause.right {
            condition.initialize = GenCallGraph_ast(cu: cu, node: initialize)
        }
    default:
        break
    }
    
    return condition
}

func GenCallGraph_goast_select_statement(cu: CompilationUnion, node: goast_select_statement) -> CGCondition? {
    let condition = CGCondition(pos: "\(node.pos.startLine+1):\(node.pos.startCol+1)")
    condition.name = "Select"
    
    var caseIdx = 1
    for child in node.children {
        switch child {
        case let communication_case as goast_communication_case:
            condition.branch["case \(caseIdx)"] = []
            for child in communication_case.children {
                let records = GenCallGraph_ast(cu: cu, node: child)
                condition.branch["case \(caseIdx)"]! += records
            }
            caseIdx += 1
        case let default_case as goast_default_case:
            condition.branch["default"] = []
            for child in default_case.children {
                let records = GenCallGraph_ast(cu: cu, node: child)
                condition.branch["default"]! += records
            }
        default:
            break
        }
    }
    
    return condition
}


func GenCallGraph_goast_expression_switch_statement(cu: CompilationUnion, node: goast_expression_switch_statement) -> CGCondition? {
    let condition = CGCondition(pos: "\(node.pos.startLine+1):\(node.pos.startCol+1)")
    condition.name = "Switch"
    
    if let initializer = node.initializer {
        condition.initialize = GenCallGraph_ast(cu: cu, node: initializer)
    }
    if let value = node.value {
        condition.initialize += GenCallGraph_ast(cu: cu, node: value)
    }
    
    var caseIdx = 1
    for child in node.children {
        switch child {
        case let expression_case as goast_expression_case:
            condition.branch["case \(caseIdx)"] = []
            for child in expression_case.children {
                let records = GenCallGraph_ast(cu: cu, node: child)
                condition.branch["case \(caseIdx)"]! += records
            }
            caseIdx += 1
        case let default_case as goast_default_case:
            condition.branch["default"] = []
            for child in default_case.children {
                let records = GenCallGraph_ast(cu: cu, node: child)
                condition.branch["default"]! += records
            }
        default:
            break
        }
    }
    
    return condition
}

func GenCallGraph_goast_type_switch_statement(cu: CompilationUnion, node: goast_type_switch_statement) -> CGCondition? {
    let condition = CGCondition(pos: "\(node.pos.startLine+1):\(node.pos.startCol+1)")
    condition.name = "Type Switch"
    
    if let initializer = node.initializer {
        condition.initialize = GenCallGraph_ast(cu: cu, node: initializer)
    }
    if let value = node.value {
        condition.initialize += GenCallGraph_ast(cu: cu, node: value)
    }
    
    var caseIdx = 1
    for child in node.children {
        switch child {
        case let type_case as goast_type_case:
            condition.branch["case \(caseIdx)"] = []
            for child in type_case.children {
                let records = GenCallGraph_ast(cu: cu, node: child)
                condition.branch["case \(caseIdx)"]! += records
            }
            caseIdx += 1
        case let default_case as goast_default_case:
            condition.branch["default"] = []
            for child in default_case.children {
                let records = GenCallGraph_ast(cu: cu, node: child)
                condition.branch["default"]! += records
            }
        default:
            break
        }
    }
    
    return condition
}



