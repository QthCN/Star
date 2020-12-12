// This file is auto-generated from ts2st_GoAST_20201212144535

import Foundation
import SwiftTreeSitter
import Common

extension GoParser {

    func handle_common(_ node: GoAST, _ cursor: TreeCursor) -> Bool {
        if cursor.node.isMissing() {
            return true
        }

        if cursor.node.isError() {
            node.errors += self.transform_error(cursor, node)
            return true
        }

        if cursor.node.isExtra() {
            switch cursor.node.kind {
            case "comment":
                node.comments.append(goast_comment(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: node))
            default:
                break
            }
            return true
        }

        if !cursor.node.isNamed {
            return true
        }

        return false
    }

    func transform(_ tree: Tree) -> GoAST? {
        let cursor = tree.rootNode.walk()
        return transform_source_file(cursor, nil)
    }

    func transform_error(_ cursor: TreeCursor, _ parent: AST?) -> [GoAST] {
        var nodes: [GoAST] = []
        if cursor.gotoFirstChild() {
            repeat {
                switch cursor.node.kind {
                case "argument_list":
                    if let node = self.transform_argument_list(cursor, parent) {
                        nodes.append(node)
                    }
                case "array_type":
                    if let node = self.transform_array_type(cursor, parent) {
                        nodes.append(node)
                    }
                case "assignment_statement":
                    if let node = self.transform_assignment_statement(cursor, parent) {
                        nodes.append(node)
                    }
                case "binary_expression":
                    if let node = self.transform_binary_expression(cursor, parent) {
                        nodes.append(node)
                    }
                case "blank_identifier":
                    if let node = self.transform_blank_identifier(cursor, parent) {
                        nodes.append(node)
                    }
                case "block":
                    if let node = self.transform_block(cursor, parent) {
                        nodes.append(node)
                    }
                case "break_statement":
                    if let node = self.transform_break_statement(cursor, parent) {
                        nodes.append(node)
                    }
                case "call_expression":
                    if let node = self.transform_call_expression(cursor, parent) {
                        nodes.append(node)
                    }
                case "channel_type":
                    if let node = self.transform_channel_type(cursor, parent) {
                        nodes.append(node)
                    }
                case "communication_case":
                    if let node = self.transform_communication_case(cursor, parent) {
                        nodes.append(node)
                    }
                case "composite_literal":
                    if let node = self.transform_composite_literal(cursor, parent) {
                        nodes.append(node)
                    }
                case "const_declaration":
                    if let node = self.transform_const_declaration(cursor, parent) {
                        nodes.append(node)
                    }
                case "const_spec":
                    if let node = self.transform_const_spec(cursor, parent) {
                        nodes.append(node)
                    }
                case "continue_statement":
                    if let node = self.transform_continue_statement(cursor, parent) {
                        nodes.append(node)
                    }
                case "dec_statement":
                    if let node = self.transform_dec_statement(cursor, parent) {
                        nodes.append(node)
                    }
                case "default_case":
                    if let node = self.transform_default_case(cursor, parent) {
                        nodes.append(node)
                    }
                case "defer_statement":
                    if let node = self.transform_defer_statement(cursor, parent) {
                        nodes.append(node)
                    }
                case "dot":
                    if let node = self.transform_dot(cursor, parent) {
                        nodes.append(node)
                    }
                case "element":
                    if let node = self.transform_element(cursor, parent) {
                        nodes.append(node)
                    }
                case "empty_statement":
                    if let node = self.transform_empty_statement(cursor, parent) {
                        nodes.append(node)
                    }
                case "escape_sequence":
                    if let node = self.transform_escape_sequence(cursor, parent) {
                        nodes.append(node)
                    }
                case "expression_case":
                    if let node = self.transform_expression_case(cursor, parent) {
                        nodes.append(node)
                    }
                case "expression_list":
                    if let node = self.transform_expression_list(cursor, parent) {
                        nodes.append(node)
                    }
                case "expression_switch_statement":
                    if let node = self.transform_expression_switch_statement(cursor, parent) {
                        nodes.append(node)
                    }
                case "fallthrough_statement":
                    if let node = self.transform_fallthrough_statement(cursor, parent) {
                        nodes.append(node)
                    }
                case "false":
                    if let node = self.transform_false(cursor, parent) {
                        nodes.append(node)
                    }
                case "field_declaration":
                    if let node = self.transform_field_declaration(cursor, parent) {
                        nodes.append(node)
                    }
                case "field_declaration_list":
                    if let node = self.transform_field_declaration_list(cursor, parent) {
                        nodes.append(node)
                    }
                case "field_identifier":
                    if let node = self.transform_field_identifier(cursor, parent) {
                        nodes.append(node)
                    }
                case "float_literal":
                    if let node = self.transform_float_literal(cursor, parent) {
                        nodes.append(node)
                    }
                case "for_clause":
                    if let node = self.transform_for_clause(cursor, parent) {
                        nodes.append(node)
                    }
                case "for_statement":
                    if let node = self.transform_for_statement(cursor, parent) {
                        nodes.append(node)
                    }
                case "func_literal":
                    if let node = self.transform_func_literal(cursor, parent) {
                        nodes.append(node)
                    }
                case "function_declaration":
                    if let node = self.transform_function_declaration(cursor, parent) {
                        nodes.append(node)
                    }
                case "function_type":
                    if let node = self.transform_function_type(cursor, parent) {
                        nodes.append(node)
                    }
                case "go_statement":
                    if let node = self.transform_go_statement(cursor, parent) {
                        nodes.append(node)
                    }
                case "goto_statement":
                    if let node = self.transform_goto_statement(cursor, parent) {
                        nodes.append(node)
                    }
                case "identifier":
                    if let node = self.transform_identifier(cursor, parent) {
                        nodes.append(node)
                    }
                case "if_statement":
                    if let node = self.transform_if_statement(cursor, parent) {
                        nodes.append(node)
                    }
                case "imaginary_literal":
                    if let node = self.transform_imaginary_literal(cursor, parent) {
                        nodes.append(node)
                    }
                case "implicit_length_array_type":
                    if let node = self.transform_implicit_length_array_type(cursor, parent) {
                        nodes.append(node)
                    }
                case "import_declaration":
                    if let node = self.transform_import_declaration(cursor, parent) {
                        nodes.append(node)
                    }
                case "import_spec":
                    if let node = self.transform_import_spec(cursor, parent) {
                        nodes.append(node)
                    }
                case "import_spec_list":
                    if let node = self.transform_import_spec_list(cursor, parent) {
                        nodes.append(node)
                    }
                case "inc_statement":
                    if let node = self.transform_inc_statement(cursor, parent) {
                        nodes.append(node)
                    }
                case "index_expression":
                    if let node = self.transform_index_expression(cursor, parent) {
                        nodes.append(node)
                    }
                case "int_literal":
                    if let node = self.transform_int_literal(cursor, parent) {
                        nodes.append(node)
                    }
                case "interface_type":
                    if let node = self.transform_interface_type(cursor, parent) {
                        nodes.append(node)
                    }
                case "interpreted_string_literal":
                    if let node = self.transform_interpreted_string_literal(cursor, parent) {
                        nodes.append(node)
                    }
                case "keyed_element":
                    if let node = self.transform_keyed_element(cursor, parent) {
                        nodes.append(node)
                    }
                case "label_name":
                    if let node = self.transform_label_name(cursor, parent) {
                        nodes.append(node)
                    }
                case "labeled_statement":
                    if let node = self.transform_labeled_statement(cursor, parent) {
                        nodes.append(node)
                    }
                case "literal_value":
                    if let node = self.transform_literal_value(cursor, parent) {
                        nodes.append(node)
                    }
                case "map_type":
                    if let node = self.transform_map_type(cursor, parent) {
                        nodes.append(node)
                    }
                case "method_declaration":
                    if let node = self.transform_method_declaration(cursor, parent) {
                        nodes.append(node)
                    }
                case "method_spec":
                    if let node = self.transform_method_spec(cursor, parent) {
                        nodes.append(node)
                    }
                case "method_spec_list":
                    if let node = self.transform_method_spec_list(cursor, parent) {
                        nodes.append(node)
                    }
                case "nil":
                    if let node = self.transform_nil(cursor, parent) {
                        nodes.append(node)
                    }
                case "package_clause":
                    if let node = self.transform_package_clause(cursor, parent) {
                        nodes.append(node)
                    }
                case "package_identifier":
                    if let node = self.transform_package_identifier(cursor, parent) {
                        nodes.append(node)
                    }
                case "parameter_declaration":
                    if let node = self.transform_parameter_declaration(cursor, parent) {
                        nodes.append(node)
                    }
                case "parameter_list":
                    if let node = self.transform_parameter_list(cursor, parent) {
                        nodes.append(node)
                    }
                case "parenthesized_expression":
                    if let node = self.transform_parenthesized_expression(cursor, parent) {
                        nodes.append(node)
                    }
                case "parenthesized_type":
                    if let node = self.transform_parenthesized_type(cursor, parent) {
                        nodes.append(node)
                    }
                case "pointer_type":
                    if let node = self.transform_pointer_type(cursor, parent) {
                        nodes.append(node)
                    }
                case "qualified_type":
                    if let node = self.transform_qualified_type(cursor, parent) {
                        nodes.append(node)
                    }
                case "range_clause":
                    if let node = self.transform_range_clause(cursor, parent) {
                        nodes.append(node)
                    }
                case "raw_string_literal":
                    if let node = self.transform_raw_string_literal(cursor, parent) {
                        nodes.append(node)
                    }
                case "receive_statement":
                    if let node = self.transform_receive_statement(cursor, parent) {
                        nodes.append(node)
                    }
                case "return_statement":
                    if let node = self.transform_return_statement(cursor, parent) {
                        nodes.append(node)
                    }
                case "rune_literal":
                    if let node = self.transform_rune_literal(cursor, parent) {
                        nodes.append(node)
                    }
                case "select_statement":
                    if let node = self.transform_select_statement(cursor, parent) {
                        nodes.append(node)
                    }
                case "selector_expression":
                    if let node = self.transform_selector_expression(cursor, parent) {
                        nodes.append(node)
                    }
                case "send_statement":
                    if let node = self.transform_send_statement(cursor, parent) {
                        nodes.append(node)
                    }
                case "short_var_declaration":
                    if let node = self.transform_short_var_declaration(cursor, parent) {
                        nodes.append(node)
                    }
                case "slice_expression":
                    if let node = self.transform_slice_expression(cursor, parent) {
                        nodes.append(node)
                    }
                case "slice_type":
                    if let node = self.transform_slice_type(cursor, parent) {
                        nodes.append(node)
                    }
                case "source_file":
                    if let node = self.transform_source_file(cursor, parent) {
                        nodes.append(node)
                    }
                case "struct_type":
                    if let node = self.transform_struct_type(cursor, parent) {
                        nodes.append(node)
                    }
                case "true":
                    if let node = self.transform_true(cursor, parent) {
                        nodes.append(node)
                    }
                case "type_alias":
                    if let node = self.transform_type_alias(cursor, parent) {
                        nodes.append(node)
                    }
                case "type_assertion_expression":
                    if let node = self.transform_type_assertion_expression(cursor, parent) {
                        nodes.append(node)
                    }
                case "type_case":
                    if let node = self.transform_type_case(cursor, parent) {
                        nodes.append(node)
                    }
                case "type_conversion_expression":
                    if let node = self.transform_type_conversion_expression(cursor, parent) {
                        nodes.append(node)
                    }
                case "type_declaration":
                    if let node = self.transform_type_declaration(cursor, parent) {
                        nodes.append(node)
                    }
                case "type_identifier":
                    if let node = self.transform_type_identifier(cursor, parent) {
                        nodes.append(node)
                    }
                case "type_spec":
                    if let node = self.transform_type_spec(cursor, parent) {
                        nodes.append(node)
                    }
                case "type_switch_statement":
                    if let node = self.transform_type_switch_statement(cursor, parent) {
                        nodes.append(node)
                    }
                case "unary_expression":
                    if let node = self.transform_unary_expression(cursor, parent) {
                        nodes.append(node)
                    }
                case "var_declaration":
                    if let node = self.transform_var_declaration(cursor, parent) {
                        nodes.append(node)
                    }
                case "var_spec":
                    if let node = self.transform_var_spec(cursor, parent) {
                        nodes.append(node)
                    }
                case "variadic_argument":
                    if let node = self.transform_variadic_argument(cursor, parent) {
                        nodes.append(node)
                    }
                case "variadic_parameter_declaration":
                    if let node = self.transform_variadic_parameter_declaration(cursor, parent) {
                        nodes.append(node)
                    }
                default:
                    print("unhandled Error node: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
            return nodes
        } else {
            return nodes
        }
    }

    func transform__expression(_ cursor: TreeCursor, _ parent: AST?) -> goast__expression? {
        var node: goast__expression? = nil
        switch cursor.node.kind {
        case "binary_expression":
            node = self.transform_binary_expression(cursor, parent)
        case "call_expression":
            node = self.transform_call_expression(cursor, parent)
        case "composite_literal":
            node = self.transform_composite_literal(cursor, parent)
        case "false":
            node = self.transform_false(cursor, parent)
        case "float_literal":
            node = self.transform_float_literal(cursor, parent)
        case "func_literal":
            node = self.transform_func_literal(cursor, parent)
        case "identifier":
            node = self.transform_identifier(cursor, parent)
        case "imaginary_literal":
            node = self.transform_imaginary_literal(cursor, parent)
        case "index_expression":
            node = self.transform_index_expression(cursor, parent)
        case "int_literal":
            node = self.transform_int_literal(cursor, parent)
        case "interpreted_string_literal":
            node = self.transform_interpreted_string_literal(cursor, parent)
        case "nil":
            node = self.transform_nil(cursor, parent)
        case "parenthesized_expression":
            node = self.transform_parenthesized_expression(cursor, parent)
        case "raw_string_literal":
            node = self.transform_raw_string_literal(cursor, parent)
        case "rune_literal":
            node = self.transform_rune_literal(cursor, parent)
        case "selector_expression":
            node = self.transform_selector_expression(cursor, parent)
        case "slice_expression":
            node = self.transform_slice_expression(cursor, parent)
        case "true":
            node = self.transform_true(cursor, parent)
        case "type_assertion_expression":
            node = self.transform_type_assertion_expression(cursor, parent)
        case "type_conversion_expression":
            node = self.transform_type_conversion_expression(cursor, parent)
        case "unary_expression":
            node = self.transform_unary_expression(cursor, parent)
        default:
            print("invalid subtype in supertype: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
        }
        return node
    }

    func transform__simple_statement(_ cursor: TreeCursor, _ parent: AST?) -> goast__simple_statement? {
        var node: goast__simple_statement? = nil
        switch cursor.node.kind {
        case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
            node = self.transform__expression(cursor, parent)
        case "assignment_statement":
            node = self.transform_assignment_statement(cursor, parent)
        case "dec_statement":
            node = self.transform_dec_statement(cursor, parent)
        case "inc_statement":
            node = self.transform_inc_statement(cursor, parent)
        case "send_statement":
            node = self.transform_send_statement(cursor, parent)
        case "short_var_declaration":
            node = self.transform_short_var_declaration(cursor, parent)
        default:
            print("invalid subtype in supertype: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
        }
        return node
    }

    func transform__simple_type(_ cursor: TreeCursor, _ parent: AST?) -> goast__simple_type? {
        var node: goast__simple_type? = nil
        switch cursor.node.kind {
        case "array_type":
            node = self.transform_array_type(cursor, parent)
        case "channel_type":
            node = self.transform_channel_type(cursor, parent)
        case "function_type":
            node = self.transform_function_type(cursor, parent)
        case "interface_type":
            node = self.transform_interface_type(cursor, parent)
        case "map_type":
            node = self.transform_map_type(cursor, parent)
        case "pointer_type":
            node = self.transform_pointer_type(cursor, parent)
        case "qualified_type":
            node = self.transform_qualified_type(cursor, parent)
        case "slice_type":
            node = self.transform_slice_type(cursor, parent)
        case "struct_type":
            node = self.transform_struct_type(cursor, parent)
        case "type_identifier":
            node = self.transform_type_identifier(cursor, parent)
        default:
            print("invalid subtype in supertype: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
        }
        return node
    }

    func transform__statement(_ cursor: TreeCursor, _ parent: AST?) -> goast__statement? {
        var node: goast__statement? = nil
        switch cursor.node.kind {
        case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
            node = self.transform__expression(cursor, parent)
        case "assignment_statement", "dec_statement", "inc_statement", "send_statement", "short_var_declaration":
            node = self.transform__simple_statement(cursor, parent)
        case "block":
            node = self.transform_block(cursor, parent)
        case "break_statement":
            node = self.transform_break_statement(cursor, parent)
        case "const_declaration":
            node = self.transform_const_declaration(cursor, parent)
        case "continue_statement":
            node = self.transform_continue_statement(cursor, parent)
        case "defer_statement":
            node = self.transform_defer_statement(cursor, parent)
        case "empty_statement":
            node = self.transform_empty_statement(cursor, parent)
        case "expression_switch_statement":
            node = self.transform_expression_switch_statement(cursor, parent)
        case "fallthrough_statement":
            node = self.transform_fallthrough_statement(cursor, parent)
        case "for_statement":
            node = self.transform_for_statement(cursor, parent)
        case "go_statement":
            node = self.transform_go_statement(cursor, parent)
        case "goto_statement":
            node = self.transform_goto_statement(cursor, parent)
        case "if_statement":
            node = self.transform_if_statement(cursor, parent)
        case "labeled_statement":
            node = self.transform_labeled_statement(cursor, parent)
        case "return_statement":
            node = self.transform_return_statement(cursor, parent)
        case "select_statement":
            node = self.transform_select_statement(cursor, parent)
        case "type_declaration":
            node = self.transform_type_declaration(cursor, parent)
        case "type_switch_statement":
            node = self.transform_type_switch_statement(cursor, parent)
        case "var_declaration":
            node = self.transform_var_declaration(cursor, parent)
        default:
            print("invalid subtype in supertype: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
        }
        return node
    }

    func transform__type(_ cursor: TreeCursor, _ parent: AST?) -> goast__type? {
        var node: goast__type? = nil
        switch cursor.node.kind {
        case "array_type", "channel_type", "function_type", "interface_type", "map_type", "pointer_type", "qualified_type", "slice_type", "struct_type", "type_identifier":
            node = self.transform__simple_type(cursor, parent)
        case "parenthesized_type":
            node = self.transform_parenthesized_type(cursor, parent)
        default:
            print("invalid subtype in supertype: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
        }
        return node
    }

    func transform_argument_list(_ cursor: TreeCursor, _ parent: AST?) -> goast_argument_list? {
        self.enter_argument_list()
        let node = goast_argument_list(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        if let child = self.transform__expression(cursor, node) {
                            node.children.append(child)
                        }
                    case "array_type", "channel_type", "function_type", "interface_type", "map_type", "pointer_type", "qualified_type", "slice_type", "struct_type", "type_identifier":
                        if let child = self.transform__simple_type(cursor, node) {
                            node.children.append(child)
                        }
                    case "parenthesized_type":
                        if let child = self.transform__type(cursor, node) {
                            node.children.append(child)
                        }
                    case "variadic_argument":
                        if let child = self.transform_variadic_argument(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_argument_list(node)
        return node
    }

    func transform_array_type(_ cursor: TreeCursor, _ parent: AST?) -> goast_array_type? {
        self.enter_array_type()
        let node = goast_array_type(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "element":
                    switch cursor.node.kind {
                    case "array_type", "channel_type", "function_type", "interface_type", "map_type", "pointer_type", "qualified_type", "slice_type", "struct_type", "type_identifier":
                        node.element = self.transform__simple_type(cursor, node)
                    case "parenthesized_type":
                        node.element = self.transform__type(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "length":
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        node.length = self.transform__expression(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_array_type(node)
        return node
    }

    func transform_assignment_statement(_ cursor: TreeCursor, _ parent: AST?) -> goast_assignment_statement? {
        self.enter_assignment_statement()
        let node = goast_assignment_statement(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "left":
                    switch cursor.node.kind {
                    case "expression_list":
                        node.left = self.transform_expression_list(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "operator":
                    switch cursor.node.kind {
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "right":
                    switch cursor.node.kind {
                    case "expression_list":
                        node.right = self.transform_expression_list(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_assignment_statement(node)
        return node
    }

    func transform_binary_expression(_ cursor: TreeCursor, _ parent: AST?) -> goast_binary_expression? {
        self.enter_binary_expression()
        let node = goast_binary_expression(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "left":
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        node.left = self.transform__expression(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "operator":
                    switch cursor.node.kind {
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "right":
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        node.right = self.transform__expression(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_binary_expression(node)
        return node
    }

    func transform_blank_identifier(_ cursor: TreeCursor, _ parent: AST?) -> goast_blank_identifier? {
        self.enter_blank_identifier()
        let node = goast_blank_identifier(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_blank_identifier(node)
        return node
    }

    func transform_block(_ cursor: TreeCursor, _ parent: AST?) -> goast_block? {
        self.enter_block()
        let node = goast_block(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        if let child = self.transform__expression(cursor, node) {
                            node.children.append(child)
                        }
                    case "assignment_statement", "dec_statement", "inc_statement", "send_statement", "short_var_declaration":
                        if let child = self.transform__simple_statement(cursor, node) {
                            node.children.append(child)
                        }
                    case "block", "break_statement", "const_declaration", "continue_statement", "defer_statement", "empty_statement", "expression_switch_statement", "fallthrough_statement", "for_statement", "go_statement", "goto_statement", "if_statement", "labeled_statement", "return_statement", "select_statement", "type_declaration", "type_switch_statement", "var_declaration":
                        if let child = self.transform__statement(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_block(node)
        return node
    }

    func transform_break_statement(_ cursor: TreeCursor, _ parent: AST?) -> goast_break_statement? {
        self.enter_break_statement()
        let node = goast_break_statement(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "label_name":
                        if let child = self.transform_label_name(cursor, node) {
                            node.children = child
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_break_statement(node)
        return node
    }

    func transform_call_expression(_ cursor: TreeCursor, _ parent: AST?) -> goast_call_expression? {
        self.enter_call_expression()
        let node = goast_call_expression(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "arguments":
                    switch cursor.node.kind {
                    case "argument_list":
                        node.arguments = self.transform_argument_list(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "function":
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        node.function = self.transform__expression(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_call_expression(node)
        return node
    }

    func transform_channel_type(_ cursor: TreeCursor, _ parent: AST?) -> goast_channel_type? {
        self.enter_channel_type()
        let node = goast_channel_type(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "value":
                    switch cursor.node.kind {
                    case "array_type", "channel_type", "function_type", "interface_type", "map_type", "pointer_type", "qualified_type", "slice_type", "struct_type", "type_identifier":
                        node.value = self.transform__simple_type(cursor, node)
                    case "parenthesized_type":
                        node.value = self.transform__type(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_channel_type(node)
        return node
    }

    func transform_communication_case(_ cursor: TreeCursor, _ parent: AST?) -> goast_communication_case? {
        self.enter_communication_case()
        let node = goast_communication_case(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "communication":
                    switch cursor.node.kind {
                    case "receive_statement":
                        node.communication = self.transform_receive_statement(cursor, node)
                    case "send_statement":
                        node.communication = self.transform_send_statement(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        if let child = self.transform__expression(cursor, node) {
                            node.children.append(child)
                        }
                    case "assignment_statement", "dec_statement", "inc_statement", "send_statement", "short_var_declaration":
                        if let child = self.transform__simple_statement(cursor, node) {
                            node.children.append(child)
                        }
                    case "block", "break_statement", "const_declaration", "continue_statement", "defer_statement", "empty_statement", "expression_switch_statement", "fallthrough_statement", "for_statement", "go_statement", "goto_statement", "if_statement", "labeled_statement", "return_statement", "select_statement", "type_declaration", "type_switch_statement", "var_declaration":
                        if let child = self.transform__statement(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_communication_case(node)
        return node
    }

    func transform_composite_literal(_ cursor: TreeCursor, _ parent: AST?) -> goast_composite_literal? {
        self.enter_composite_literal()
        let node = goast_composite_literal(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "body":
                    switch cursor.node.kind {
                    case "literal_value":
                        node.body = self.transform_literal_value(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "type":
                    switch cursor.node.kind {
                    case "array_type":
                        node.type = self.transform_array_type(cursor, node)
                    case "implicit_length_array_type":
                        node.type = self.transform_implicit_length_array_type(cursor, node)
                    case "map_type":
                        node.type = self.transform_map_type(cursor, node)
                    case "qualified_type":
                        node.type = self.transform_qualified_type(cursor, node)
                    case "slice_type":
                        node.type = self.transform_slice_type(cursor, node)
                    case "struct_type":
                        node.type = self.transform_struct_type(cursor, node)
                    case "type_identifier":
                        node.type = self.transform_type_identifier(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_composite_literal(node)
        return node
    }

    func transform_const_declaration(_ cursor: TreeCursor, _ parent: AST?) -> goast_const_declaration? {
        self.enter_const_declaration()
        let node = goast_const_declaration(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "const_spec":
                        if let child = self.transform_const_spec(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_const_declaration(node)
        return node
    }

    func transform_const_spec(_ cursor: TreeCursor, _ parent: AST?) -> goast_const_spec? {
        self.enter_const_spec()
        let node = goast_const_spec(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "name":
                    switch cursor.node.kind {
                    case "identifier":
                        if let child = self.transform_identifier(cursor, node) {
                            node.name.append(child)
                        }
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "type":
                    switch cursor.node.kind {
                    case "array_type", "channel_type", "function_type", "interface_type", "map_type", "pointer_type", "qualified_type", "slice_type", "struct_type", "type_identifier":
                        node.type = self.transform__simple_type(cursor, node)
                    case "parenthesized_type":
                        node.type = self.transform__type(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "value":
                    switch cursor.node.kind {
                    case "expression_list":
                        node.value = self.transform_expression_list(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_const_spec(node)
        return node
    }

    func transform_continue_statement(_ cursor: TreeCursor, _ parent: AST?) -> goast_continue_statement? {
        self.enter_continue_statement()
        let node = goast_continue_statement(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "label_name":
                        if let child = self.transform_label_name(cursor, node) {
                            node.children = child
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_continue_statement(node)
        return node
    }

    func transform_dec_statement(_ cursor: TreeCursor, _ parent: AST?) -> goast_dec_statement? {
        self.enter_dec_statement()
        let node = goast_dec_statement(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        if let child = self.transform__expression(cursor, node) {
                            node.children = child
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_dec_statement(node)
        return node
    }

    func transform_default_case(_ cursor: TreeCursor, _ parent: AST?) -> goast_default_case? {
        self.enter_default_case()
        let node = goast_default_case(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        if let child = self.transform__expression(cursor, node) {
                            node.children.append(child)
                        }
                    case "assignment_statement", "dec_statement", "inc_statement", "send_statement", "short_var_declaration":
                        if let child = self.transform__simple_statement(cursor, node) {
                            node.children.append(child)
                        }
                    case "block", "break_statement", "const_declaration", "continue_statement", "defer_statement", "empty_statement", "expression_switch_statement", "fallthrough_statement", "for_statement", "go_statement", "goto_statement", "if_statement", "labeled_statement", "return_statement", "select_statement", "type_declaration", "type_switch_statement", "var_declaration":
                        if let child = self.transform__statement(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_default_case(node)
        return node
    }

    func transform_defer_statement(_ cursor: TreeCursor, _ parent: AST?) -> goast_defer_statement? {
        self.enter_defer_statement()
        let node = goast_defer_statement(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        if let child = self.transform__expression(cursor, node) {
                            node.children = child
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_defer_statement(node)
        return node
    }

    func transform_dot(_ cursor: TreeCursor, _ parent: AST?) -> goast_dot? {
        self.enter_dot()
        let node = goast_dot(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_dot(node)
        return node
    }

    func transform_element(_ cursor: TreeCursor, _ parent: AST?) -> goast_element? {
        self.enter_element()
        let node = goast_element(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        if let child = self.transform__expression(cursor, node) {
                            node.children = child
                        }
                    case "literal_value":
                        if let child = self.transform_literal_value(cursor, node) {
                            node.children = child
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_element(node)
        return node
    }

    func transform_empty_statement(_ cursor: TreeCursor, _ parent: AST?) -> goast_empty_statement? {
        self.enter_empty_statement()
        let node = goast_empty_statement(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_empty_statement(node)
        return node
    }

    func transform_escape_sequence(_ cursor: TreeCursor, _ parent: AST?) -> goast_escape_sequence? {
        self.enter_escape_sequence()
        let node = goast_escape_sequence(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_escape_sequence(node)
        return node
    }

    func transform_expression_case(_ cursor: TreeCursor, _ parent: AST?) -> goast_expression_case? {
        self.enter_expression_case()
        let node = goast_expression_case(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "value":
                    switch cursor.node.kind {
                    case "expression_list":
                        node.value = self.transform_expression_list(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        if let child = self.transform__expression(cursor, node) {
                            node.children.append(child)
                        }
                    case "assignment_statement", "dec_statement", "inc_statement", "send_statement", "short_var_declaration":
                        if let child = self.transform__simple_statement(cursor, node) {
                            node.children.append(child)
                        }
                    case "block", "break_statement", "const_declaration", "continue_statement", "defer_statement", "empty_statement", "expression_switch_statement", "fallthrough_statement", "for_statement", "go_statement", "goto_statement", "if_statement", "labeled_statement", "return_statement", "select_statement", "type_declaration", "type_switch_statement", "var_declaration":
                        if let child = self.transform__statement(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_expression_case(node)
        return node
    }

    func transform_expression_list(_ cursor: TreeCursor, _ parent: AST?) -> goast_expression_list? {
        self.enter_expression_list()
        let node = goast_expression_list(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        if let child = self.transform__expression(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_expression_list(node)
        return node
    }

    func transform_expression_switch_statement(_ cursor: TreeCursor, _ parent: AST?) -> goast_expression_switch_statement? {
        self.enter_expression_switch_statement()
        let node = goast_expression_switch_statement(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "initializer":
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        node.initializer = self.transform__expression(cursor, node)
                    case "assignment_statement", "dec_statement", "inc_statement", "send_statement", "short_var_declaration":
                        node.initializer = self.transform__simple_statement(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "value":
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        node.value = self.transform__expression(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    case "default_case":
                        if let child = self.transform_default_case(cursor, node) {
                            node.children.append(child)
                        }
                    case "expression_case":
                        if let child = self.transform_expression_case(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_expression_switch_statement(node)
        return node
    }

    func transform_fallthrough_statement(_ cursor: TreeCursor, _ parent: AST?) -> goast_fallthrough_statement? {
        self.enter_fallthrough_statement()
        let node = goast_fallthrough_statement(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_fallthrough_statement(node)
        return node
    }

    func transform_false(_ cursor: TreeCursor, _ parent: AST?) -> goast_false? {
        self.enter_false()
        let node = goast_false(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_false(node)
        return node
    }

    func transform_field_declaration(_ cursor: TreeCursor, _ parent: AST?) -> goast_field_declaration? {
        self.enter_field_declaration()
        let node = goast_field_declaration(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "name":
                    switch cursor.node.kind {
                    case "field_identifier":
                        if let child = self.transform_field_identifier(cursor, node) {
                            node.name.append(child)
                        }
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "tag":
                    switch cursor.node.kind {
                    case "interpreted_string_literal":
                        node.tag = self.transform_interpreted_string_literal(cursor, node)
                    case "raw_string_literal":
                        node.tag = self.transform_raw_string_literal(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "type":
                    switch cursor.node.kind {
                    case "array_type", "channel_type", "function_type", "interface_type", "map_type", "pointer_type", "qualified_type", "slice_type", "struct_type", "type_identifier":
                        node.type = self.transform__simple_type(cursor, node)
                    case "parenthesized_type":
                        node.type = self.transform__type(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_field_declaration(node)
        return node
    }

    func transform_field_declaration_list(_ cursor: TreeCursor, _ parent: AST?) -> goast_field_declaration_list? {
        self.enter_field_declaration_list()
        let node = goast_field_declaration_list(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "field_declaration":
                        if let child = self.transform_field_declaration(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_field_declaration_list(node)
        return node
    }

    func transform_field_identifier(_ cursor: TreeCursor, _ parent: AST?) -> goast_field_identifier? {
        self.enter_field_identifier()
        let node = goast_field_identifier(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_field_identifier(node)
        return node
    }

    func transform_float_literal(_ cursor: TreeCursor, _ parent: AST?) -> goast_float_literal? {
        self.enter_float_literal()
        let node = goast_float_literal(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_float_literal(node)
        return node
    }

    func transform_for_clause(_ cursor: TreeCursor, _ parent: AST?) -> goast_for_clause? {
        self.enter_for_clause()
        let node = goast_for_clause(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "condition":
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        node.condition = self.transform__expression(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "initializer":
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        node.initializer = self.transform__expression(cursor, node)
                    case "assignment_statement", "dec_statement", "inc_statement", "send_statement", "short_var_declaration":
                        node.initializer = self.transform__simple_statement(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "update":
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        node.update = self.transform__expression(cursor, node)
                    case "assignment_statement", "dec_statement", "inc_statement", "send_statement", "short_var_declaration":
                        node.update = self.transform__simple_statement(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_for_clause(node)
        return node
    }

    func transform_for_statement(_ cursor: TreeCursor, _ parent: AST?) -> goast_for_statement? {
        self.enter_for_statement()
        let node = goast_for_statement(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "body":
                    switch cursor.node.kind {
                    case "block":
                        node.body = self.transform_block(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        if let child = self.transform__expression(cursor, node) {
                            node.children = child
                        }
                    case "for_clause":
                        if let child = self.transform_for_clause(cursor, node) {
                            node.children = child
                        }
                    case "range_clause":
                        if let child = self.transform_range_clause(cursor, node) {
                            node.children = child
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_for_statement(node)
        return node
    }

    func transform_func_literal(_ cursor: TreeCursor, _ parent: AST?) -> goast_func_literal? {
        self.enter_func_literal()
        let node = goast_func_literal(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "body":
                    switch cursor.node.kind {
                    case "block":
                        node.body = self.transform_block(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "parameters":
                    switch cursor.node.kind {
                    case "parameter_list":
                        node.parameters = self.transform_parameter_list(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "result":
                    switch cursor.node.kind {
                    case "array_type", "channel_type", "function_type", "interface_type", "map_type", "pointer_type", "qualified_type", "slice_type", "struct_type", "type_identifier":
                        node.result = self.transform__simple_type(cursor, node)
                    case "parameter_list":
                        node.result = self.transform_parameter_list(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_func_literal(node)
        return node
    }

    func transform_function_declaration(_ cursor: TreeCursor, _ parent: AST?) -> goast_function_declaration? {
        self.enter_function_declaration()
        let node = goast_function_declaration(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "body":
                    switch cursor.node.kind {
                    case "block":
                        node.body = self.transform_block(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "name":
                    switch cursor.node.kind {
                    case "identifier":
                        node.name = self.transform_identifier(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "parameters":
                    switch cursor.node.kind {
                    case "parameter_list":
                        node.parameters = self.transform_parameter_list(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "result":
                    switch cursor.node.kind {
                    case "array_type", "channel_type", "function_type", "interface_type", "map_type", "pointer_type", "qualified_type", "slice_type", "struct_type", "type_identifier":
                        node.result = self.transform__simple_type(cursor, node)
                    case "parameter_list":
                        node.result = self.transform_parameter_list(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_function_declaration(node)
        return node
    }

    func transform_function_type(_ cursor: TreeCursor, _ parent: AST?) -> goast_function_type? {
        self.enter_function_type()
        let node = goast_function_type(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "parameters":
                    switch cursor.node.kind {
                    case "parameter_list":
                        node.parameters = self.transform_parameter_list(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "result":
                    switch cursor.node.kind {
                    case "array_type", "channel_type", "function_type", "interface_type", "map_type", "pointer_type", "qualified_type", "slice_type", "struct_type", "type_identifier":
                        node.result = self.transform__simple_type(cursor, node)
                    case "parameter_list":
                        node.result = self.transform_parameter_list(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_function_type(node)
        return node
    }

    func transform_go_statement(_ cursor: TreeCursor, _ parent: AST?) -> goast_go_statement? {
        self.enter_go_statement()
        let node = goast_go_statement(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        if let child = self.transform__expression(cursor, node) {
                            node.children = child
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_go_statement(node)
        return node
    }

    func transform_goto_statement(_ cursor: TreeCursor, _ parent: AST?) -> goast_goto_statement? {
        self.enter_goto_statement()
        let node = goast_goto_statement(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "label_name":
                        if let child = self.transform_label_name(cursor, node) {
                            node.children = child
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_goto_statement(node)
        return node
    }

    func transform_identifier(_ cursor: TreeCursor, _ parent: AST?) -> goast_identifier? {
        self.enter_identifier()
        let node = goast_identifier(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_identifier(node)
        return node
    }

    func transform_if_statement(_ cursor: TreeCursor, _ parent: AST?) -> goast_if_statement? {
        self.enter_if_statement()
        let node = goast_if_statement(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "alternative":
                    switch cursor.node.kind {
                    case "block":
                        node.alternative = self.transform_block(cursor, node)
                    case "if_statement":
                        node.alternative = self.transform_if_statement(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "condition":
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        node.condition = self.transform__expression(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "consequence":
                    switch cursor.node.kind {
                    case "block":
                        node.consequence = self.transform_block(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "initializer":
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        node.initializer = self.transform__expression(cursor, node)
                    case "assignment_statement", "dec_statement", "inc_statement", "send_statement", "short_var_declaration":
                        node.initializer = self.transform__simple_statement(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_if_statement(node)
        return node
    }

    func transform_imaginary_literal(_ cursor: TreeCursor, _ parent: AST?) -> goast_imaginary_literal? {
        self.enter_imaginary_literal()
        let node = goast_imaginary_literal(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_imaginary_literal(node)
        return node
    }

    func transform_implicit_length_array_type(_ cursor: TreeCursor, _ parent: AST?) -> goast_implicit_length_array_type? {
        self.enter_implicit_length_array_type()
        let node = goast_implicit_length_array_type(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "element":
                    switch cursor.node.kind {
                    case "array_type", "channel_type", "function_type", "interface_type", "map_type", "pointer_type", "qualified_type", "slice_type", "struct_type", "type_identifier":
                        node.element = self.transform__simple_type(cursor, node)
                    case "parenthesized_type":
                        node.element = self.transform__type(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_implicit_length_array_type(node)
        return node
    }

    func transform_import_declaration(_ cursor: TreeCursor, _ parent: AST?) -> goast_import_declaration? {
        self.enter_import_declaration()
        let node = goast_import_declaration(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "import_spec":
                        if let child = self.transform_import_spec(cursor, node) {
                            node.children = child
                        }
                    case "import_spec_list":
                        if let child = self.transform_import_spec_list(cursor, node) {
                            node.children = child
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_import_declaration(node)
        return node
    }

    func transform_import_spec(_ cursor: TreeCursor, _ parent: AST?) -> goast_import_spec? {
        self.enter_import_spec()
        let node = goast_import_spec(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "name":
                    switch cursor.node.kind {
                    case "blank_identifier":
                        node.name = self.transform_blank_identifier(cursor, node)
                    case "dot":
                        node.name = self.transform_dot(cursor, node)
                    case "package_identifier":
                        node.name = self.transform_package_identifier(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "path":
                    switch cursor.node.kind {
                    case "interpreted_string_literal":
                        node.path = self.transform_interpreted_string_literal(cursor, node)
                    case "raw_string_literal":
                        node.path = self.transform_raw_string_literal(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_import_spec(node)
        return node
    }

    func transform_import_spec_list(_ cursor: TreeCursor, _ parent: AST?) -> goast_import_spec_list? {
        self.enter_import_spec_list()
        let node = goast_import_spec_list(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "import_spec":
                        if let child = self.transform_import_spec(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_import_spec_list(node)
        return node
    }

    func transform_inc_statement(_ cursor: TreeCursor, _ parent: AST?) -> goast_inc_statement? {
        self.enter_inc_statement()
        let node = goast_inc_statement(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        if let child = self.transform__expression(cursor, node) {
                            node.children = child
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_inc_statement(node)
        return node
    }

    func transform_index_expression(_ cursor: TreeCursor, _ parent: AST?) -> goast_index_expression? {
        self.enter_index_expression()
        let node = goast_index_expression(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "index":
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        node.index = self.transform__expression(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "operand":
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        node.operand = self.transform__expression(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_index_expression(node)
        return node
    }

    func transform_int_literal(_ cursor: TreeCursor, _ parent: AST?) -> goast_int_literal? {
        self.enter_int_literal()
        let node = goast_int_literal(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_int_literal(node)
        return node
    }

    func transform_interface_type(_ cursor: TreeCursor, _ parent: AST?) -> goast_interface_type? {
        self.enter_interface_type()
        let node = goast_interface_type(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "method_spec_list":
                        if let child = self.transform_method_spec_list(cursor, node) {
                            node.children = child
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_interface_type(node)
        return node
    }

    func transform_interpreted_string_literal(_ cursor: TreeCursor, _ parent: AST?) -> goast_interpreted_string_literal? {
        self.enter_interpreted_string_literal()
        let node = goast_interpreted_string_literal(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "escape_sequence":
                        if let child = self.transform_escape_sequence(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_interpreted_string_literal(node)
        return node
    }

    func transform_keyed_element(_ cursor: TreeCursor, _ parent: AST?) -> goast_keyed_element? {
        self.enter_keyed_element()
        let node = goast_keyed_element(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        if let child = self.transform__expression(cursor, node) {
                            node.children.append(child)
                        }
                    case "field_identifier":
                        if let child = self.transform_field_identifier(cursor, node) {
                            node.children.append(child)
                        }
                    case "literal_value":
                        if let child = self.transform_literal_value(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_keyed_element(node)
        return node
    }

    func transform_label_name(_ cursor: TreeCursor, _ parent: AST?) -> goast_label_name? {
        self.enter_label_name()
        let node = goast_label_name(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_label_name(node)
        return node
    }

    func transform_labeled_statement(_ cursor: TreeCursor, _ parent: AST?) -> goast_labeled_statement? {
        self.enter_labeled_statement()
        let node = goast_labeled_statement(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "label":
                    switch cursor.node.kind {
                    case "label_name":
                        node.label = self.transform_label_name(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        if let child = self.transform__expression(cursor, node) {
                            node.children = child
                        }
                    case "assignment_statement", "dec_statement", "inc_statement", "send_statement", "short_var_declaration":
                        if let child = self.transform__simple_statement(cursor, node) {
                            node.children = child
                        }
                    case "block", "break_statement", "const_declaration", "continue_statement", "defer_statement", "empty_statement", "expression_switch_statement", "fallthrough_statement", "for_statement", "go_statement", "goto_statement", "if_statement", "labeled_statement", "return_statement", "select_statement", "type_declaration", "type_switch_statement", "var_declaration":
                        if let child = self.transform__statement(cursor, node) {
                            node.children = child
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_labeled_statement(node)
        return node
    }

    func transform_literal_value(_ cursor: TreeCursor, _ parent: AST?) -> goast_literal_value? {
        self.enter_literal_value()
        let node = goast_literal_value(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "element":
                        if let child = self.transform_element(cursor, node) {
                            node.children.append(child)
                        }
                    case "keyed_element":
                        if let child = self.transform_keyed_element(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_literal_value(node)
        return node
    }

    func transform_map_type(_ cursor: TreeCursor, _ parent: AST?) -> goast_map_type? {
        self.enter_map_type()
        let node = goast_map_type(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "key":
                    switch cursor.node.kind {
                    case "array_type", "channel_type", "function_type", "interface_type", "map_type", "pointer_type", "qualified_type", "slice_type", "struct_type", "type_identifier":
                        node.key = self.transform__simple_type(cursor, node)
                    case "parenthesized_type":
                        node.key = self.transform__type(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "value":
                    switch cursor.node.kind {
                    case "array_type", "channel_type", "function_type", "interface_type", "map_type", "pointer_type", "qualified_type", "slice_type", "struct_type", "type_identifier":
                        node.value = self.transform__simple_type(cursor, node)
                    case "parenthesized_type":
                        node.value = self.transform__type(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_map_type(node)
        return node
    }

    func transform_method_declaration(_ cursor: TreeCursor, _ parent: AST?) -> goast_method_declaration? {
        self.enter_method_declaration()
        let node = goast_method_declaration(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "body":
                    switch cursor.node.kind {
                    case "block":
                        node.body = self.transform_block(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "name":
                    switch cursor.node.kind {
                    case "field_identifier":
                        node.name = self.transform_field_identifier(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "parameters":
                    switch cursor.node.kind {
                    case "parameter_list":
                        node.parameters = self.transform_parameter_list(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "receiver":
                    switch cursor.node.kind {
                    case "parameter_list":
                        node.receiver = self.transform_parameter_list(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "result":
                    switch cursor.node.kind {
                    case "array_type", "channel_type", "function_type", "interface_type", "map_type", "pointer_type", "qualified_type", "slice_type", "struct_type", "type_identifier":
                        node.result = self.transform__simple_type(cursor, node)
                    case "parameter_list":
                        node.result = self.transform_parameter_list(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_method_declaration(node)
        return node
    }

    func transform_method_spec(_ cursor: TreeCursor, _ parent: AST?) -> goast_method_spec? {
        self.enter_method_spec()
        let node = goast_method_spec(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "name":
                    switch cursor.node.kind {
                    case "field_identifier":
                        node.name = self.transform_field_identifier(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "parameters":
                    switch cursor.node.kind {
                    case "parameter_list":
                        node.parameters = self.transform_parameter_list(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "result":
                    switch cursor.node.kind {
                    case "array_type", "channel_type", "function_type", "interface_type", "map_type", "pointer_type", "qualified_type", "slice_type", "struct_type", "type_identifier":
                        node.result = self.transform__simple_type(cursor, node)
                    case "parameter_list":
                        node.result = self.transform_parameter_list(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_method_spec(node)
        return node
    }

    func transform_method_spec_list(_ cursor: TreeCursor, _ parent: AST?) -> goast_method_spec_list? {
        self.enter_method_spec_list()
        let node = goast_method_spec_list(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "method_spec":
                        if let child = self.transform_method_spec(cursor, node) {
                            node.children.append(child)
                        }
                    case "qualified_type":
                        if let child = self.transform_qualified_type(cursor, node) {
                            node.children.append(child)
                        }
                    case "type_identifier":
                        if let child = self.transform_type_identifier(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_method_spec_list(node)
        return node
    }

    func transform_nil(_ cursor: TreeCursor, _ parent: AST?) -> goast_nil? {
        self.enter_nil()
        let node = goast_nil(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_nil(node)
        return node
    }

    func transform_package_clause(_ cursor: TreeCursor, _ parent: AST?) -> goast_package_clause? {
        self.enter_package_clause()
        let node = goast_package_clause(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "package_identifier":
                        if let child = self.transform_package_identifier(cursor, node) {
                            node.children = child
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_package_clause(node)
        return node
    }

    func transform_package_identifier(_ cursor: TreeCursor, _ parent: AST?) -> goast_package_identifier? {
        self.enter_package_identifier()
        let node = goast_package_identifier(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_package_identifier(node)
        return node
    }

    func transform_parameter_declaration(_ cursor: TreeCursor, _ parent: AST?) -> goast_parameter_declaration? {
        self.enter_parameter_declaration()
        let node = goast_parameter_declaration(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "name":
                    switch cursor.node.kind {
                    case "identifier":
                        if let child = self.transform_identifier(cursor, node) {
                            node.name.append(child)
                        }
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "type":
                    switch cursor.node.kind {
                    case "array_type", "channel_type", "function_type", "interface_type", "map_type", "pointer_type", "qualified_type", "slice_type", "struct_type", "type_identifier":
                        node.type = self.transform__simple_type(cursor, node)
                    case "parenthesized_type":
                        node.type = self.transform__type(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_parameter_declaration(node)
        return node
    }

    func transform_parameter_list(_ cursor: TreeCursor, _ parent: AST?) -> goast_parameter_list? {
        self.enter_parameter_list()
        let node = goast_parameter_list(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "parameter_declaration":
                        if let child = self.transform_parameter_declaration(cursor, node) {
                            node.children.append(child)
                        }
                    case "variadic_parameter_declaration":
                        if let child = self.transform_variadic_parameter_declaration(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_parameter_list(node)
        return node
    }

    func transform_parenthesized_expression(_ cursor: TreeCursor, _ parent: AST?) -> goast_parenthesized_expression? {
        self.enter_parenthesized_expression()
        let node = goast_parenthesized_expression(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        if let child = self.transform__expression(cursor, node) {
                            node.children = child
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_parenthesized_expression(node)
        return node
    }

    func transform_parenthesized_type(_ cursor: TreeCursor, _ parent: AST?) -> goast_parenthesized_type? {
        self.enter_parenthesized_type()
        let node = goast_parenthesized_type(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "array_type", "channel_type", "function_type", "interface_type", "map_type", "pointer_type", "qualified_type", "slice_type", "struct_type", "type_identifier":
                        if let child = self.transform__simple_type(cursor, node) {
                            node.children = child
                        }
                    case "parenthesized_type":
                        if let child = self.transform__type(cursor, node) {
                            node.children = child
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_parenthesized_type(node)
        return node
    }

    func transform_pointer_type(_ cursor: TreeCursor, _ parent: AST?) -> goast_pointer_type? {
        self.enter_pointer_type()
        let node = goast_pointer_type(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "array_type", "channel_type", "function_type", "interface_type", "map_type", "pointer_type", "qualified_type", "slice_type", "struct_type", "type_identifier":
                        if let child = self.transform__simple_type(cursor, node) {
                            node.children = child
                        }
                    case "parenthesized_type":
                        if let child = self.transform__type(cursor, node) {
                            node.children = child
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_pointer_type(node)
        return node
    }

    func transform_qualified_type(_ cursor: TreeCursor, _ parent: AST?) -> goast_qualified_type? {
        self.enter_qualified_type()
        let node = goast_qualified_type(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "name":
                    switch cursor.node.kind {
                    case "type_identifier":
                        node.name = self.transform_type_identifier(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "package":
                    switch cursor.node.kind {
                    case "package_identifier":
                        node.package = self.transform_package_identifier(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_qualified_type(node)
        return node
    }

    func transform_range_clause(_ cursor: TreeCursor, _ parent: AST?) -> goast_range_clause? {
        self.enter_range_clause()
        let node = goast_range_clause(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "left":
                    switch cursor.node.kind {
                    case "expression_list":
                        node.left = self.transform_expression_list(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "right":
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        node.right = self.transform__expression(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_range_clause(node)
        return node
    }

    func transform_raw_string_literal(_ cursor: TreeCursor, _ parent: AST?) -> goast_raw_string_literal? {
        self.enter_raw_string_literal()
        let node = goast_raw_string_literal(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_raw_string_literal(node)
        return node
    }

    func transform_receive_statement(_ cursor: TreeCursor, _ parent: AST?) -> goast_receive_statement? {
        self.enter_receive_statement()
        let node = goast_receive_statement(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "left":
                    switch cursor.node.kind {
                    case "expression_list":
                        node.left = self.transform_expression_list(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "right":
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        node.right = self.transform__expression(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_receive_statement(node)
        return node
    }

    func transform_return_statement(_ cursor: TreeCursor, _ parent: AST?) -> goast_return_statement? {
        self.enter_return_statement()
        let node = goast_return_statement(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "expression_list":
                        if let child = self.transform_expression_list(cursor, node) {
                            node.children = child
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_return_statement(node)
        return node
    }

    func transform_rune_literal(_ cursor: TreeCursor, _ parent: AST?) -> goast_rune_literal? {
        self.enter_rune_literal()
        let node = goast_rune_literal(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_rune_literal(node)
        return node
    }

    func transform_select_statement(_ cursor: TreeCursor, _ parent: AST?) -> goast_select_statement? {
        self.enter_select_statement()
        let node = goast_select_statement(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "communication_case":
                        if let child = self.transform_communication_case(cursor, node) {
                            node.children.append(child)
                        }
                    case "default_case":
                        if let child = self.transform_default_case(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_select_statement(node)
        return node
    }

    func transform_selector_expression(_ cursor: TreeCursor, _ parent: AST?) -> goast_selector_expression? {
        self.enter_selector_expression()
        let node = goast_selector_expression(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "field":
                    switch cursor.node.kind {
                    case "field_identifier":
                        node.field = self.transform_field_identifier(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "operand":
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        node.operand = self.transform__expression(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_selector_expression(node)
        return node
    }

    func transform_send_statement(_ cursor: TreeCursor, _ parent: AST?) -> goast_send_statement? {
        self.enter_send_statement()
        let node = goast_send_statement(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "channel":
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        node.channel = self.transform__expression(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "value":
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        node.value = self.transform__expression(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_send_statement(node)
        return node
    }

    func transform_short_var_declaration(_ cursor: TreeCursor, _ parent: AST?) -> goast_short_var_declaration? {
        self.enter_short_var_declaration()
        let node = goast_short_var_declaration(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "left":
                    switch cursor.node.kind {
                    case "expression_list":
                        node.left = self.transform_expression_list(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "right":
                    switch cursor.node.kind {
                    case "expression_list":
                        node.right = self.transform_expression_list(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_short_var_declaration(node)
        return node
    }

    func transform_slice_expression(_ cursor: TreeCursor, _ parent: AST?) -> goast_slice_expression? {
        self.enter_slice_expression()
        let node = goast_slice_expression(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "capacity":
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        node.capacity = self.transform__expression(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "end":
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        node.end = self.transform__expression(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "operand":
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        node.operand = self.transform__expression(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "start":
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        node.start = self.transform__expression(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_slice_expression(node)
        return node
    }

    func transform_slice_type(_ cursor: TreeCursor, _ parent: AST?) -> goast_slice_type? {
        self.enter_slice_type()
        let node = goast_slice_type(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "element":
                    switch cursor.node.kind {
                    case "array_type", "channel_type", "function_type", "interface_type", "map_type", "pointer_type", "qualified_type", "slice_type", "struct_type", "type_identifier":
                        node.element = self.transform__simple_type(cursor, node)
                    case "parenthesized_type":
                        node.element = self.transform__type(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_slice_type(node)
        return node
    }

    func transform_source_file(_ cursor: TreeCursor, _ parent: AST?) -> goast_source_file? {
        self.enter_source_file()
        let node = goast_source_file(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        if let child = self.transform__expression(cursor, node) {
                            node.children.append(child)
                        }
                    case "assignment_statement", "dec_statement", "inc_statement", "send_statement", "short_var_declaration":
                        if let child = self.transform__simple_statement(cursor, node) {
                            node.children.append(child)
                        }
                    case "block", "break_statement", "const_declaration", "continue_statement", "defer_statement", "empty_statement", "expression_switch_statement", "fallthrough_statement", "for_statement", "go_statement", "goto_statement", "if_statement", "labeled_statement", "return_statement", "select_statement", "type_declaration", "type_switch_statement", "var_declaration":
                        if let child = self.transform__statement(cursor, node) {
                            node.children.append(child)
                        }
                    case "function_declaration":
                        if let child = self.transform_function_declaration(cursor, node) {
                            node.children.append(child)
                        }
                    case "import_declaration":
                        if let child = self.transform_import_declaration(cursor, node) {
                            node.children.append(child)
                        }
                    case "method_declaration":
                        if let child = self.transform_method_declaration(cursor, node) {
                            node.children.append(child)
                        }
                    case "package_clause":
                        if let child = self.transform_package_clause(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_source_file(node)
        return node
    }

    func transform_struct_type(_ cursor: TreeCursor, _ parent: AST?) -> goast_struct_type? {
        self.enter_struct_type()
        let node = goast_struct_type(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "field_declaration_list":
                        if let child = self.transform_field_declaration_list(cursor, node) {
                            node.children = child
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_struct_type(node)
        return node
    }

    func transform_true(_ cursor: TreeCursor, _ parent: AST?) -> goast_true? {
        self.enter_true()
        let node = goast_true(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_true(node)
        return node
    }

    func transform_type_alias(_ cursor: TreeCursor, _ parent: AST?) -> goast_type_alias? {
        self.enter_type_alias()
        let node = goast_type_alias(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "name":
                    switch cursor.node.kind {
                    case "type_identifier":
                        node.name = self.transform_type_identifier(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "type":
                    switch cursor.node.kind {
                    case "array_type", "channel_type", "function_type", "interface_type", "map_type", "pointer_type", "qualified_type", "slice_type", "struct_type", "type_identifier":
                        node.type = self.transform__simple_type(cursor, node)
                    case "parenthesized_type":
                        node.type = self.transform__type(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_type_alias(node)
        return node
    }

    func transform_type_assertion_expression(_ cursor: TreeCursor, _ parent: AST?) -> goast_type_assertion_expression? {
        self.enter_type_assertion_expression()
        let node = goast_type_assertion_expression(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "operand":
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        node.operand = self.transform__expression(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "type":
                    switch cursor.node.kind {
                    case "array_type", "channel_type", "function_type", "interface_type", "map_type", "pointer_type", "qualified_type", "slice_type", "struct_type", "type_identifier":
                        node.type = self.transform__simple_type(cursor, node)
                    case "parenthesized_type":
                        node.type = self.transform__type(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_type_assertion_expression(node)
        return node
    }

    func transform_type_case(_ cursor: TreeCursor, _ parent: AST?) -> goast_type_case? {
        self.enter_type_case()
        let node = goast_type_case(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "type":
                    switch cursor.node.kind {
                    case "array_type", "channel_type", "function_type", "interface_type", "map_type", "pointer_type", "qualified_type", "slice_type", "struct_type", "type_identifier":
                        if let child = self.transform__simple_type(cursor, node) {
                            node.type.append(child)
                        }
                    case "parenthesized_type":
                        if let child = self.transform__type(cursor, node) {
                            node.type.append(child)
                        }
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        if let child = self.transform__expression(cursor, node) {
                            node.children.append(child)
                        }
                    case "assignment_statement", "dec_statement", "inc_statement", "send_statement", "short_var_declaration":
                        if let child = self.transform__simple_statement(cursor, node) {
                            node.children.append(child)
                        }
                    case "block", "break_statement", "const_declaration", "continue_statement", "defer_statement", "empty_statement", "expression_switch_statement", "fallthrough_statement", "for_statement", "go_statement", "goto_statement", "if_statement", "labeled_statement", "return_statement", "select_statement", "type_declaration", "type_switch_statement", "var_declaration":
                        if let child = self.transform__statement(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_type_case(node)
        return node
    }

    func transform_type_conversion_expression(_ cursor: TreeCursor, _ parent: AST?) -> goast_type_conversion_expression? {
        self.enter_type_conversion_expression()
        let node = goast_type_conversion_expression(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "operand":
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        node.operand = self.transform__expression(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "type":
                    switch cursor.node.kind {
                    case "array_type", "channel_type", "function_type", "interface_type", "map_type", "pointer_type", "qualified_type", "slice_type", "struct_type", "type_identifier":
                        node.type = self.transform__simple_type(cursor, node)
                    case "parenthesized_type":
                        node.type = self.transform__type(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_type_conversion_expression(node)
        return node
    }

    func transform_type_declaration(_ cursor: TreeCursor, _ parent: AST?) -> goast_type_declaration? {
        self.enter_type_declaration()
        let node = goast_type_declaration(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "type_alias":
                        if let child = self.transform_type_alias(cursor, node) {
                            node.children.append(child)
                        }
                    case "type_spec":
                        if let child = self.transform_type_spec(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_type_declaration(node)
        return node
    }

    func transform_type_identifier(_ cursor: TreeCursor, _ parent: AST?) -> goast_type_identifier? {
        self.enter_type_identifier()
        let node = goast_type_identifier(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_type_identifier(node)
        return node
    }

    func transform_type_spec(_ cursor: TreeCursor, _ parent: AST?) -> goast_type_spec? {
        self.enter_type_spec()
        let node = goast_type_spec(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "name":
                    switch cursor.node.kind {
                    case "type_identifier":
                        node.name = self.transform_type_identifier(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "type":
                    switch cursor.node.kind {
                    case "array_type", "channel_type", "function_type", "interface_type", "map_type", "pointer_type", "qualified_type", "slice_type", "struct_type", "type_identifier":
                        node.type = self.transform__simple_type(cursor, node)
                    case "parenthesized_type":
                        node.type = self.transform__type(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_type_spec(node)
        return node
    }

    func transform_type_switch_statement(_ cursor: TreeCursor, _ parent: AST?) -> goast_type_switch_statement? {
        self.enter_type_switch_statement()
        let node = goast_type_switch_statement(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "alias":
                    switch cursor.node.kind {
                    case "expression_list":
                        node.alias = self.transform_expression_list(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "initializer":
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        node.initializer = self.transform__expression(cursor, node)
                    case "assignment_statement", "dec_statement", "inc_statement", "send_statement", "short_var_declaration":
                        node.initializer = self.transform__simple_statement(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "value":
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        node.value = self.transform__expression(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    case "default_case":
                        if let child = self.transform_default_case(cursor, node) {
                            node.children.append(child)
                        }
                    case "type_case":
                        if let child = self.transform_type_case(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_type_switch_statement(node)
        return node
    }

    func transform_unary_expression(_ cursor: TreeCursor, _ parent: AST?) -> goast_unary_expression? {
        self.enter_unary_expression()
        let node = goast_unary_expression(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "operand":
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        node.operand = self.transform__expression(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "operator":
                    switch cursor.node.kind {
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_unary_expression(node)
        return node
    }

    func transform_var_declaration(_ cursor: TreeCursor, _ parent: AST?) -> goast_var_declaration? {
        self.enter_var_declaration()
        let node = goast_var_declaration(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "var_spec":
                        if let child = self.transform_var_spec(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_var_declaration(node)
        return node
    }

    func transform_var_spec(_ cursor: TreeCursor, _ parent: AST?) -> goast_var_spec? {
        self.enter_var_spec()
        let node = goast_var_spec(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "name":
                    switch cursor.node.kind {
                    case "identifier":
                        if let child = self.transform_identifier(cursor, node) {
                            node.name.append(child)
                        }
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "type":
                    switch cursor.node.kind {
                    case "array_type", "channel_type", "function_type", "interface_type", "map_type", "pointer_type", "qualified_type", "slice_type", "struct_type", "type_identifier":
                        node.type = self.transform__simple_type(cursor, node)
                    case "parenthesized_type":
                        node.type = self.transform__type(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "value":
                    switch cursor.node.kind {
                    case "expression_list":
                        node.value = self.transform_expression_list(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_var_spec(node)
        return node
    }

    func transform_variadic_argument(_ cursor: TreeCursor, _ parent: AST?) -> goast_variadic_argument? {
        self.enter_variadic_argument()
        let node = goast_variadic_argument(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "binary_expression", "call_expression", "composite_literal", "false", "float_literal", "func_literal", "identifier", "imaginary_literal", "index_expression", "int_literal", "interpreted_string_literal", "nil", "parenthesized_expression", "raw_string_literal", "rune_literal", "selector_expression", "slice_expression", "true", "type_assertion_expression", "type_conversion_expression", "unary_expression":
                        if let child = self.transform__expression(cursor, node) {
                            node.children = child
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_variadic_argument(node)
        return node
    }

    func transform_variadic_parameter_declaration(_ cursor: TreeCursor, _ parent: AST?) -> goast_variadic_parameter_declaration? {
        self.enter_variadic_parameter_declaration()
        let node = goast_variadic_parameter_declaration(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "name":
                    switch cursor.node.kind {
                    case "identifier":
                        node.name = self.transform_identifier(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "type":
                    switch cursor.node.kind {
                    case "array_type", "channel_type", "function_type", "interface_type", "map_type", "pointer_type", "qualified_type", "slice_type", "struct_type", "type_identifier":
                        node.type = self.transform__simple_type(cursor, node)
                    case "parenthesized_type":
                        node.type = self.transform__type(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_variadic_parameter_declaration(node)
        return node
    }


}
