// This file is auto-generated from ts2st_GoAST_20201217224850

import Foundation
import Common

class GoVisiter {

    var handleError: Bool = false

    init() {
    }

    func visit_ast(_ node: GoAST) {
        switch node {
            case let ast as goast_argument_list:
                self.visit_argument_list(ast)
            case let ast as goast_array_type:
                self.visit_array_type(ast)
            case let ast as goast_assignment_statement:
                self.visit_assignment_statement(ast)
            case let ast as goast_binary_expression:
                self.visit_binary_expression(ast)
            case let ast as goast_blank_identifier:
                self.visit_blank_identifier(ast)
            case let ast as goast_block:
                self.visit_block(ast)
            case let ast as goast_break_statement:
                self.visit_break_statement(ast)
            case let ast as goast_call_expression:
                self.visit_call_expression(ast)
            case let ast as goast_channel_type:
                self.visit_channel_type(ast)
            case let ast as goast_communication_case:
                self.visit_communication_case(ast)
            case let ast as goast_composite_literal:
                self.visit_composite_literal(ast)
            case let ast as goast_const_declaration:
                self.visit_const_declaration(ast)
            case let ast as goast_const_spec:
                self.visit_const_spec(ast)
            case let ast as goast_continue_statement:
                self.visit_continue_statement(ast)
            case let ast as goast_dec_statement:
                self.visit_dec_statement(ast)
            case let ast as goast_default_case:
                self.visit_default_case(ast)
            case let ast as goast_defer_statement:
                self.visit_defer_statement(ast)
            case let ast as goast_dot:
                self.visit_dot(ast)
            case let ast as goast_element:
                self.visit_element(ast)
            case let ast as goast_empty_statement:
                self.visit_empty_statement(ast)
            case let ast as goast_escape_sequence:
                self.visit_escape_sequence(ast)
            case let ast as goast_expression_case:
                self.visit_expression_case(ast)
            case let ast as goast_expression_list:
                self.visit_expression_list(ast)
            case let ast as goast_expression_switch_statement:
                self.visit_expression_switch_statement(ast)
            case let ast as goast_fallthrough_statement:
                self.visit_fallthrough_statement(ast)
            case let ast as goast_false:
                self.visit_false(ast)
            case let ast as goast_field_declaration:
                self.visit_field_declaration(ast)
            case let ast as goast_field_declaration_list:
                self.visit_field_declaration_list(ast)
            case let ast as goast_field_identifier:
                self.visit_field_identifier(ast)
            case let ast as goast_float_literal:
                self.visit_float_literal(ast)
            case let ast as goast_for_clause:
                self.visit_for_clause(ast)
            case let ast as goast_for_statement:
                self.visit_for_statement(ast)
            case let ast as goast_func_literal:
                self.visit_func_literal(ast)
            case let ast as goast_function_declaration:
                self.visit_function_declaration(ast)
            case let ast as goast_function_type:
                self.visit_function_type(ast)
            case let ast as goast_go_statement:
                self.visit_go_statement(ast)
            case let ast as goast_goto_statement:
                self.visit_goto_statement(ast)
            case let ast as goast_identifier:
                self.visit_identifier(ast)
            case let ast as goast_if_statement:
                self.visit_if_statement(ast)
            case let ast as goast_imaginary_literal:
                self.visit_imaginary_literal(ast)
            case let ast as goast_implicit_length_array_type:
                self.visit_implicit_length_array_type(ast)
            case let ast as goast_import_declaration:
                self.visit_import_declaration(ast)
            case let ast as goast_import_spec:
                self.visit_import_spec(ast)
            case let ast as goast_import_spec_list:
                self.visit_import_spec_list(ast)
            case let ast as goast_inc_statement:
                self.visit_inc_statement(ast)
            case let ast as goast_index_expression:
                self.visit_index_expression(ast)
            case let ast as goast_int_literal:
                self.visit_int_literal(ast)
            case let ast as goast_interface_type:
                self.visit_interface_type(ast)
            case let ast as goast_interpreted_string_literal:
                self.visit_interpreted_string_literal(ast)
            case let ast as goast_keyed_element:
                self.visit_keyed_element(ast)
            case let ast as goast_label_name:
                self.visit_label_name(ast)
            case let ast as goast_labeled_statement:
                self.visit_labeled_statement(ast)
            case let ast as goast_literal_value:
                self.visit_literal_value(ast)
            case let ast as goast_map_type:
                self.visit_map_type(ast)
            case let ast as goast_method_declaration:
                self.visit_method_declaration(ast)
            case let ast as goast_method_spec:
                self.visit_method_spec(ast)
            case let ast as goast_method_spec_list:
                self.visit_method_spec_list(ast)
            case let ast as goast_nil:
                self.visit_nil(ast)
            case let ast as goast_package_clause:
                self.visit_package_clause(ast)
            case let ast as goast_package_identifier:
                self.visit_package_identifier(ast)
            case let ast as goast_parameter_declaration:
                self.visit_parameter_declaration(ast)
            case let ast as goast_parameter_list:
                self.visit_parameter_list(ast)
            case let ast as goast_parenthesized_expression:
                self.visit_parenthesized_expression(ast)
            case let ast as goast_parenthesized_type:
                self.visit_parenthesized_type(ast)
            case let ast as goast_pointer_type:
                self.visit_pointer_type(ast)
            case let ast as goast_qualified_type:
                self.visit_qualified_type(ast)
            case let ast as goast_range_clause:
                self.visit_range_clause(ast)
            case let ast as goast_raw_string_literal:
                self.visit_raw_string_literal(ast)
            case let ast as goast_receive_statement:
                self.visit_receive_statement(ast)
            case let ast as goast_return_statement:
                self.visit_return_statement(ast)
            case let ast as goast_rune_literal:
                self.visit_rune_literal(ast)
            case let ast as goast_select_statement:
                self.visit_select_statement(ast)
            case let ast as goast_selector_expression:
                self.visit_selector_expression(ast)
            case let ast as goast_send_statement:
                self.visit_send_statement(ast)
            case let ast as goast_short_var_declaration:
                self.visit_short_var_declaration(ast)
            case let ast as goast_slice_expression:
                self.visit_slice_expression(ast)
            case let ast as goast_slice_type:
                self.visit_slice_type(ast)
            case let ast as goast_source_file:
                self.visit_source_file(ast)
            case let ast as goast_struct_type:
                self.visit_struct_type(ast)
            case let ast as goast_true:
                self.visit_true(ast)
            case let ast as goast_type_alias:
                self.visit_type_alias(ast)
            case let ast as goast_type_assertion_expression:
                self.visit_type_assertion_expression(ast)
            case let ast as goast_type_case:
                self.visit_type_case(ast)
            case let ast as goast_type_conversion_expression:
                self.visit_type_conversion_expression(ast)
            case let ast as goast_type_declaration:
                self.visit_type_declaration(ast)
            case let ast as goast_type_identifier:
                self.visit_type_identifier(ast)
            case let ast as goast_type_spec:
                self.visit_type_spec(ast)
            case let ast as goast_type_switch_statement:
                self.visit_type_switch_statement(ast)
            case let ast as goast_unary_expression:
                self.visit_unary_expression(ast)
            case let ast as goast_var_declaration:
                self.visit_var_declaration(ast)
            case let ast as goast_var_spec:
                self.visit_var_spec(ast)
            case let ast as goast_variadic_argument:
                self.visit_variadic_argument(ast)
            case let ast as goast_variadic_parameter_declaration:
                self.visit_variadic_parameter_declaration(ast)
            default:
                break
        }
    }

    func visit__expression(_ node: goast__expression) {
        switch node {
            case let ast as goast_binary_expression:
                self.visit_binary_expression(ast)
            case let ast as goast_call_expression:
                self.visit_call_expression(ast)
            case let ast as goast_composite_literal:
                self.visit_composite_literal(ast)
            case let ast as goast_false:
                self.visit_false(ast)
            case let ast as goast_float_literal:
                self.visit_float_literal(ast)
            case let ast as goast_func_literal:
                self.visit_func_literal(ast)
            case let ast as goast_identifier:
                self.visit_identifier(ast)
            case let ast as goast_imaginary_literal:
                self.visit_imaginary_literal(ast)
            case let ast as goast_index_expression:
                self.visit_index_expression(ast)
            case let ast as goast_int_literal:
                self.visit_int_literal(ast)
            case let ast as goast_interpreted_string_literal:
                self.visit_interpreted_string_literal(ast)
            case let ast as goast_nil:
                self.visit_nil(ast)
            case let ast as goast_parenthesized_expression:
                self.visit_parenthesized_expression(ast)
            case let ast as goast_raw_string_literal:
                self.visit_raw_string_literal(ast)
            case let ast as goast_rune_literal:
                self.visit_rune_literal(ast)
            case let ast as goast_selector_expression:
                self.visit_selector_expression(ast)
            case let ast as goast_slice_expression:
                self.visit_slice_expression(ast)
            case let ast as goast_true:
                self.visit_true(ast)
            case let ast as goast_type_assertion_expression:
                self.visit_type_assertion_expression(ast)
            case let ast as goast_type_conversion_expression:
                self.visit_type_conversion_expression(ast)
            case let ast as goast_unary_expression:
                self.visit_unary_expression(ast)
            default:
                break
        }
    }

    func visit__simple_statement(_ node: goast__simple_statement) {
        switch node {
            case let ast as goast__expression:
                self.visit__expression(ast)
            case let ast as goast_assignment_statement:
                self.visit_assignment_statement(ast)
            case let ast as goast_dec_statement:
                self.visit_dec_statement(ast)
            case let ast as goast_inc_statement:
                self.visit_inc_statement(ast)
            case let ast as goast_send_statement:
                self.visit_send_statement(ast)
            case let ast as goast_short_var_declaration:
                self.visit_short_var_declaration(ast)
            default:
                break
        }
    }

    func visit__simple_type(_ node: goast__simple_type) {
        switch node {
            case let ast as goast_array_type:
                self.visit_array_type(ast)
            case let ast as goast_channel_type:
                self.visit_channel_type(ast)
            case let ast as goast_function_type:
                self.visit_function_type(ast)
            case let ast as goast_interface_type:
                self.visit_interface_type(ast)
            case let ast as goast_map_type:
                self.visit_map_type(ast)
            case let ast as goast_pointer_type:
                self.visit_pointer_type(ast)
            case let ast as goast_qualified_type:
                self.visit_qualified_type(ast)
            case let ast as goast_slice_type:
                self.visit_slice_type(ast)
            case let ast as goast_struct_type:
                self.visit_struct_type(ast)
            case let ast as goast_type_identifier:
                self.visit_type_identifier(ast)
            default:
                break
        }
    }

    func visit__statement(_ node: goast__statement) {
        switch node {
            case let ast as goast__simple_statement:
                self.visit__simple_statement(ast)
            case let ast as goast_block:
                self.visit_block(ast)
            case let ast as goast_break_statement:
                self.visit_break_statement(ast)
            case let ast as goast_const_declaration:
                self.visit_const_declaration(ast)
            case let ast as goast_continue_statement:
                self.visit_continue_statement(ast)
            case let ast as goast_defer_statement:
                self.visit_defer_statement(ast)
            case let ast as goast_empty_statement:
                self.visit_empty_statement(ast)
            case let ast as goast_expression_switch_statement:
                self.visit_expression_switch_statement(ast)
            case let ast as goast_fallthrough_statement:
                self.visit_fallthrough_statement(ast)
            case let ast as goast_for_statement:
                self.visit_for_statement(ast)
            case let ast as goast_go_statement:
                self.visit_go_statement(ast)
            case let ast as goast_goto_statement:
                self.visit_goto_statement(ast)
            case let ast as goast_if_statement:
                self.visit_if_statement(ast)
            case let ast as goast_labeled_statement:
                self.visit_labeled_statement(ast)
            case let ast as goast_return_statement:
                self.visit_return_statement(ast)
            case let ast as goast_select_statement:
                self.visit_select_statement(ast)
            case let ast as goast_type_declaration:
                self.visit_type_declaration(ast)
            case let ast as goast_type_switch_statement:
                self.visit_type_switch_statement(ast)
            case let ast as goast_var_declaration:
                self.visit_var_declaration(ast)
            default:
                break
        }
    }

    func visit__type(_ node: goast__type) {
        switch node {
            case let ast as goast__simple_type:
                self.visit__simple_type(ast)
            case let ast as goast_parenthesized_type:
                self.visit_parenthesized_type(ast)
            default:
                break
        }
    }

    func visit_argument_list(_ node: goast_argument_list) {
        for ast in node.children {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_array_type(_ node: goast_array_type) {
        if let ast = node.element {
            self.visit__type(ast)
        }

        if let ast = node.length {
            self.visit__expression(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_assignment_statement(_ node: goast_assignment_statement) {
        if let ast = node.left {
            self.visit_expression_list(ast)
        }

        if let ast = node.right {
            self.visit_expression_list(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_binary_expression(_ node: goast_binary_expression) {
        if let ast = node.left {
            self.visit__expression(ast)
        }

        if let ast = node.right {
            self.visit__expression(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_blank_identifier(_ node: goast_blank_identifier) {
        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_block(_ node: goast_block) {
        for ast in node.children {
            self.visit__statement(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_break_statement(_ node: goast_break_statement) {
        if let ast = node.children {
            self.visit_label_name(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_call_expression(_ node: goast_call_expression) {
        if let ast = node.arguments {
            self.visit_argument_list(ast)
        }

        if let ast = node.function {
            self.visit__expression(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_channel_type(_ node: goast_channel_type) {
        if let ast = node.value {
            self.visit__type(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_communication_case(_ node: goast_communication_case) {
        if let ast = node.communication {
            self.visit_ast(ast)
        }

        for ast in node.children {
            self.visit__statement(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_composite_literal(_ node: goast_composite_literal) {
        if let ast = node.body {
            self.visit_literal_value(ast)
        }

        if let ast = node.type {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_const_declaration(_ node: goast_const_declaration) {
        for ast in node.children {
            self.visit_const_spec(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_const_spec(_ node: goast_const_spec) {
        for ast in node.name {
            self.visit_identifier(ast)
        }

        if let ast = node.type {
            self.visit__type(ast)
        }

        if let ast = node.value {
            self.visit_expression_list(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_continue_statement(_ node: goast_continue_statement) {
        if let ast = node.children {
            self.visit_label_name(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_dec_statement(_ node: goast_dec_statement) {
        if let ast = node.children {
            self.visit__expression(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_default_case(_ node: goast_default_case) {
        for ast in node.children {
            self.visit__statement(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_defer_statement(_ node: goast_defer_statement) {
        if let ast = node.children {
            self.visit__expression(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_dot(_ node: goast_dot) {
        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_element(_ node: goast_element) {
        if let ast = node.children {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_empty_statement(_ node: goast_empty_statement) {
        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_escape_sequence(_ node: goast_escape_sequence) {
        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_expression_case(_ node: goast_expression_case) {
        if let ast = node.value {
            self.visit_expression_list(ast)
        }

        for ast in node.children {
            self.visit__statement(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_expression_list(_ node: goast_expression_list) {
        for ast in node.children {
            self.visit__expression(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_expression_switch_statement(_ node: goast_expression_switch_statement) {
        if let ast = node.initializer {
            self.visit__simple_statement(ast)
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
    }

    func visit_fallthrough_statement(_ node: goast_fallthrough_statement) {
        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_false(_ node: goast_false) {
        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_field_declaration(_ node: goast_field_declaration) {
        for ast in node.name {
            self.visit_field_identifier(ast)
        }

        if let ast = node.tag {
            self.visit_ast(ast)
        }

        if let ast = node.type {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_field_declaration_list(_ node: goast_field_declaration_list) {
        for ast in node.children {
            self.visit_field_declaration(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_field_identifier(_ node: goast_field_identifier) {
        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_float_literal(_ node: goast_float_literal) {
        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_for_clause(_ node: goast_for_clause) {
        if let ast = node.condition {
            self.visit__expression(ast)
        }

        if let ast = node.initializer {
            self.visit__simple_statement(ast)
        }

        if let ast = node.update {
            self.visit__simple_statement(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_for_statement(_ node: goast_for_statement) {
        if let ast = node.body {
            self.visit_block(ast)
        }

        if let ast = node.children {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_func_literal(_ node: goast_func_literal) {
        if let ast = node.body {
            self.visit_block(ast)
        }

        if let ast = node.parameters {
            self.visit_parameter_list(ast)
        }

        if let ast = node.result {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_function_declaration(_ node: goast_function_declaration) {
        if let ast = node.body {
            self.visit_block(ast)
        }

        if let ast = node.name {
            self.visit_identifier(ast)
        }

        if let ast = node.parameters {
            self.visit_parameter_list(ast)
        }

        if let ast = node.result {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_function_type(_ node: goast_function_type) {
        if let ast = node.parameters {
            self.visit_parameter_list(ast)
        }

        if let ast = node.result {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_go_statement(_ node: goast_go_statement) {
        if let ast = node.children {
            self.visit__expression(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_goto_statement(_ node: goast_goto_statement) {
        if let ast = node.children {
            self.visit_label_name(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_identifier(_ node: goast_identifier) {
        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_if_statement(_ node: goast_if_statement) {
        if let ast = node.alternative {
            self.visit_ast(ast)
        }

        if let ast = node.condition {
            self.visit__expression(ast)
        }

        if let ast = node.consequence {
            self.visit_block(ast)
        }

        if let ast = node.initializer {
            self.visit__simple_statement(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_imaginary_literal(_ node: goast_imaginary_literal) {
        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_implicit_length_array_type(_ node: goast_implicit_length_array_type) {
        if let ast = node.element {
            self.visit__type(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_import_declaration(_ node: goast_import_declaration) {
        if let ast = node.children {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_import_spec(_ node: goast_import_spec) {
        if let ast = node.name {
            self.visit_ast(ast)
        }

        if let ast = node.path {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_import_spec_list(_ node: goast_import_spec_list) {
        for ast in node.children {
            self.visit_import_spec(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_inc_statement(_ node: goast_inc_statement) {
        if let ast = node.children {
            self.visit__expression(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_index_expression(_ node: goast_index_expression) {
        if let ast = node.index {
            self.visit__expression(ast)
        }

        if let ast = node.operand {
            self.visit__expression(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_int_literal(_ node: goast_int_literal) {
        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_interface_type(_ node: goast_interface_type) {
        if let ast = node.children {
            self.visit_method_spec_list(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_interpreted_string_literal(_ node: goast_interpreted_string_literal) {
        for ast in node.children {
            self.visit_escape_sequence(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_keyed_element(_ node: goast_keyed_element) {
        for ast in node.children {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_label_name(_ node: goast_label_name) {
        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_labeled_statement(_ node: goast_labeled_statement) {
        if let ast = node.label {
            self.visit_label_name(ast)
        }

        if let ast = node.children {
            self.visit__statement(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_literal_value(_ node: goast_literal_value) {
        for ast in node.children {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_map_type(_ node: goast_map_type) {
        if let ast = node.key {
            self.visit__type(ast)
        }

        if let ast = node.value {
            self.visit__type(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_method_declaration(_ node: goast_method_declaration) {
        if let ast = node.body {
            self.visit_block(ast)
        }

        if let ast = node.name {
            self.visit_field_identifier(ast)
        }

        if let ast = node.parameters {
            self.visit_parameter_list(ast)
        }

        if let ast = node.receiver {
            self.visit_parameter_list(ast)
        }

        if let ast = node.result {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_method_spec(_ node: goast_method_spec) {
        if let ast = node.name {
            self.visit_field_identifier(ast)
        }

        if let ast = node.parameters {
            self.visit_parameter_list(ast)
        }

        if let ast = node.result {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_method_spec_list(_ node: goast_method_spec_list) {
        for ast in node.children {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_nil(_ node: goast_nil) {
        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_package_clause(_ node: goast_package_clause) {
        if let ast = node.children {
            self.visit_package_identifier(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_package_identifier(_ node: goast_package_identifier) {
        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_parameter_declaration(_ node: goast_parameter_declaration) {
        for ast in node.name {
            self.visit_identifier(ast)
        }

        if let ast = node.type {
            self.visit__type(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_parameter_list(_ node: goast_parameter_list) {
        for ast in node.children {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_parenthesized_expression(_ node: goast_parenthesized_expression) {
        if let ast = node.children {
            self.visit__expression(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_parenthesized_type(_ node: goast_parenthesized_type) {
        if let ast = node.children {
            self.visit__type(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_pointer_type(_ node: goast_pointer_type) {
        if let ast = node.children {
            self.visit__type(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_qualified_type(_ node: goast_qualified_type) {
        if let ast = node.name {
            self.visit_type_identifier(ast)
        }

        if let ast = node.package {
            self.visit_package_identifier(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_range_clause(_ node: goast_range_clause) {
        if let ast = node.left {
            self.visit_expression_list(ast)
        }

        if let ast = node.right {
            self.visit__expression(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_raw_string_literal(_ node: goast_raw_string_literal) {
        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_receive_statement(_ node: goast_receive_statement) {
        if let ast = node.left {
            self.visit_expression_list(ast)
        }

        if let ast = node.right {
            self.visit__expression(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_return_statement(_ node: goast_return_statement) {
        if let ast = node.children {
            self.visit_expression_list(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_rune_literal(_ node: goast_rune_literal) {
        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_select_statement(_ node: goast_select_statement) {
        for ast in node.children {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_selector_expression(_ node: goast_selector_expression) {
        if let ast = node.field {
            self.visit_field_identifier(ast)
        }

        if let ast = node.operand {
            self.visit__expression(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_send_statement(_ node: goast_send_statement) {
        if let ast = node.channel {
            self.visit__expression(ast)
        }

        if let ast = node.value {
            self.visit__expression(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_short_var_declaration(_ node: goast_short_var_declaration) {
        if let ast = node.left {
            self.visit_expression_list(ast)
        }

        if let ast = node.right {
            self.visit_expression_list(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_slice_expression(_ node: goast_slice_expression) {
        if let ast = node.capacity {
            self.visit__expression(ast)
        }

        if let ast = node.end {
            self.visit__expression(ast)
        }

        if let ast = node.operand {
            self.visit__expression(ast)
        }

        if let ast = node.start {
            self.visit__expression(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_slice_type(_ node: goast_slice_type) {
        if let ast = node.element {
            self.visit__type(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_source_file(_ node: goast_source_file) {
        for ast in node.children {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_struct_type(_ node: goast_struct_type) {
        if let ast = node.children {
            self.visit_field_declaration_list(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_true(_ node: goast_true) {
        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_type_alias(_ node: goast_type_alias) {
        if let ast = node.name {
            self.visit_type_identifier(ast)
        }

        if let ast = node.type {
            self.visit__type(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_type_assertion_expression(_ node: goast_type_assertion_expression) {
        if let ast = node.operand {
            self.visit__expression(ast)
        }

        if let ast = node.type {
            self.visit__type(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_type_case(_ node: goast_type_case) {
        for ast in node.type {
            self.visit__type(ast)
        }

        for ast in node.children {
            self.visit__statement(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_type_conversion_expression(_ node: goast_type_conversion_expression) {
        if let ast = node.operand {
            self.visit__expression(ast)
        }

        if let ast = node.type {
            self.visit__type(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_type_declaration(_ node: goast_type_declaration) {
        for ast in node.children {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_type_identifier(_ node: goast_type_identifier) {
        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_type_spec(_ node: goast_type_spec) {
        if let ast = node.name {
            self.visit_type_identifier(ast)
        }

        if let ast = node.type {
            self.visit__type(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_type_switch_statement(_ node: goast_type_switch_statement) {
        if let ast = node.alias {
            self.visit_expression_list(ast)
        }

        if let ast = node.initializer {
            self.visit__simple_statement(ast)
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
    }

    func visit_unary_expression(_ node: goast_unary_expression) {
        if let ast = node.operand {
            self.visit__expression(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_var_declaration(_ node: goast_var_declaration) {
        for ast in node.children {
            self.visit_var_spec(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_var_spec(_ node: goast_var_spec) {
        for ast in node.name {
            self.visit_identifier(ast)
        }

        if let ast = node.type {
            self.visit__type(ast)
        }

        if let ast = node.value {
            self.visit_expression_list(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_variadic_argument(_ node: goast_variadic_argument) {
        if let ast = node.children {
            self.visit__expression(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_variadic_parameter_declaration(_ node: goast_variadic_parameter_declaration) {
        if let ast = node.name {
            self.visit_identifier(ast)
        }

        if let ast = node.type {
            self.visit__type(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

}
