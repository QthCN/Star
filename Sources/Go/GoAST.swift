// This file is auto-generated from ts2st_GoAST_20201211082351

import Foundation
import Star

class GoAST: Star.AST {
    var errors: [GoAST] = []
    var comments: [goast_comment] = []

    override init(pos: Star.Position, parent: AST? = nil) {
        super.init(pos: pos, parent: parent)
    }
}

class goast_comment: GoAST {

}

class goast__expression: goast__simple_statement {
    // subtype: goast_binary_expression
    // subtype: goast_call_expression
    // subtype: goast_composite_literal
    // subtype: goast_false
    // subtype: goast_float_literal
    // subtype: goast_func_literal
    // subtype: goast_identifier
    // subtype: goast_imaginary_literal
    // subtype: goast_index_expression
    // subtype: goast_int_literal
    // subtype: goast_interpreted_string_literal
    // subtype: goast_nil
    // subtype: goast_parenthesized_expression
    // subtype: goast_raw_string_literal
    // subtype: goast_rune_literal
    // subtype: goast_selector_expression
    // subtype: goast_slice_expression
    // subtype: goast_true
    // subtype: goast_type_assertion_expression
    // subtype: goast_type_conversion_expression
    // subtype: goast_unary_expression
}

class goast__simple_statement: goast__statement {
    // subtype: goast__expression
    // subtype: goast_assignment_statement
    // subtype: goast_dec_statement
    // subtype: goast_inc_statement
    // subtype: goast_send_statement
    // subtype: goast_short_var_declaration
}

class goast__simple_type: goast__type {
    // subtype: goast_array_type
    // subtype: goast_channel_type
    // subtype: goast_function_type
    // subtype: goast_interface_type
    // subtype: goast_map_type
    // subtype: goast_pointer_type
    // subtype: goast_qualified_type
    // subtype: goast_slice_type
    // subtype: goast_struct_type
    // subtype: goast_type_identifier
}

class goast__statement: GoAST {
    // subtype: goast__simple_statement
    // subtype: goast_block
    // subtype: goast_break_statement
    // subtype: goast_const_declaration
    // subtype: goast_continue_statement
    // subtype: goast_defer_statement
    // subtype: goast_empty_statement
    // subtype: goast_expression_switch_statement
    // subtype: goast_fallthrough_statement
    // subtype: goast_for_statement
    // subtype: goast_go_statement
    // subtype: goast_goto_statement
    // subtype: goast_if_statement
    // subtype: goast_labeled_statement
    // subtype: goast_return_statement
    // subtype: goast_select_statement
    // subtype: goast_type_declaration
    // subtype: goast_type_switch_statement
    // subtype: goast_var_declaration
}

class goast__type: GoAST {
    // subtype: goast__simple_type
    // subtype: goast_parenthesized_type
}

class goast_argument_list: GoAST {
    // subtypes:  _expression _type variadic_argument
    var children: [GoAST] = []
}

class goast_array_type: goast__simple_type {
    var element: goast__type? = nil
    var length: goast__expression? = nil
}

class goast_assignment_statement: goast__simple_statement {
    var left: goast_expression_list? = nil
    var right: goast_expression_list? = nil
}

class goast_binary_expression: goast__expression {
    var left: goast__expression? = nil
    var right: goast__expression? = nil
}

class goast_block: goast__statement {
    var children: [goast__statement] = []
}

class goast_break_statement: goast__statement {
    var children: goast_label_name? = nil
}

class goast_call_expression: goast__expression {
    var arguments: goast_argument_list? = nil
    var function: goast__expression? = nil
}

class goast_channel_type: goast__simple_type {
    var value: goast__type? = nil
}

class goast_communication_case: GoAST {
    // subtypes:  receive_statement send_statement
    var communication: GoAST? = nil
    var children: [goast__statement] = []
}

class goast_composite_literal: goast__expression {
    var body: goast_literal_value? = nil
    // subtypes:  array_type implicit_length_array_type map_type qualified_type slice_type struct_type type_identifier
    var type: GoAST? = nil
}

class goast_const_declaration: goast__statement {
    var children: [goast_const_spec] = []
}

class goast_const_spec: GoAST {
    var name: [goast_identifier] = []
    var type: goast__type? = nil
    var value: goast_expression_list? = nil
}

class goast_continue_statement: goast__statement {
    var children: goast_label_name? = nil
}

class goast_dec_statement: goast__simple_statement {
    var children: goast__expression? = nil
}

class goast_default_case: GoAST {
    var children: [goast__statement] = []
}

class goast_defer_statement: goast__statement {
    var children: goast__expression? = nil
}

class goast_dot: GoAST {
}

class goast_element: GoAST {
    // subtypes:  _expression literal_value
    var children: GoAST? = nil
}

class goast_empty_statement: goast__statement {
}

class goast_expression_case: GoAST {
    var value: goast_expression_list? = nil
    var children: [goast__statement] = []
}

class goast_expression_list: GoAST {
    var children: [goast__expression] = []
}

class goast_expression_switch_statement: goast__statement {
    var initializer: goast__simple_statement? = nil
    var value: goast__expression? = nil
    // subtypes:  default_case expression_case
    var children: [GoAST] = []
}

class goast_fallthrough_statement: goast__statement {
}

class goast_field_declaration: GoAST {
    var name: [goast_field_identifier] = []
    // subtypes:  interpreted_string_literal raw_string_literal
    var tag: GoAST? = nil
    // subtypes:  _type qualified_type type_identifier
    var type: GoAST? = nil
}

class goast_field_declaration_list: GoAST {
    var children: [goast_field_declaration] = []
}

class goast_for_clause: GoAST {
    var condition: goast__expression? = nil
    var initializer: goast__simple_statement? = nil
    var update: goast__simple_statement? = nil
}

class goast_for_statement: goast__statement {
    var body: goast_block? = nil
    // subtypes:  _expression for_clause range_clause
    var children: GoAST? = nil
}

class goast_func_literal: goast__expression {
    var body: goast_block? = nil
    var parameters: goast_parameter_list? = nil
    // subtypes:  _simple_type parameter_list
    var result: GoAST? = nil
}

class goast_function_declaration: GoAST {
    var body: goast_block? = nil
    var name: goast_identifier? = nil
    var parameters: goast_parameter_list? = nil
    // subtypes:  _simple_type parameter_list
    var result: GoAST? = nil
}

class goast_function_type: goast__simple_type {
    var parameters: goast_parameter_list? = nil
    // subtypes:  _simple_type parameter_list
    var result: GoAST? = nil
}

class goast_go_statement: goast__statement {
    var children: goast__expression? = nil
}

class goast_goto_statement: goast__statement {
    var children: goast_label_name? = nil
}

class goast_if_statement: goast__statement {
    // subtypes:  block if_statement
    var alternative: GoAST? = nil
    var condition: goast__expression? = nil
    var consequence: goast_block? = nil
    var initializer: goast__simple_statement? = nil
}

class goast_implicit_length_array_type: GoAST {
    var element: goast__type? = nil
}

class goast_import_declaration: GoAST {
    // subtypes:  import_spec import_spec_list
    var children: GoAST? = nil
}

class goast_import_spec: GoAST {
    // subtypes:  blank_identifier dot package_identifier
    var name: GoAST? = nil
    // subtypes:  interpreted_string_literal raw_string_literal
    var path: GoAST? = nil
}

class goast_import_spec_list: GoAST {
    var children: [goast_import_spec] = []
}

class goast_inc_statement: goast__simple_statement {
    var children: goast__expression? = nil
}

class goast_index_expression: goast__expression {
    var index: goast__expression? = nil
    var operand: goast__expression? = nil
}

class goast_interface_type: goast__simple_type {
    var children: goast_method_spec_list? = nil
}

class goast_interpreted_string_literal: goast__expression {
    var children: [goast_escape_sequence] = []
}

class goast_keyed_element: GoAST {
    // subtypes:  _expression field_identifier literal_value
    var children: [GoAST] = []
}

class goast_labeled_statement: goast__statement {
    var label: goast_label_name? = nil
    var children: goast__statement? = nil
}

class goast_literal_value: GoAST {
    // subtypes:  element keyed_element
    var children: [GoAST] = []
}

class goast_map_type: goast__simple_type {
    var key: goast__type? = nil
    var value: goast__type? = nil
}

class goast_method_declaration: GoAST {
    var body: goast_block? = nil
    var name: goast_field_identifier? = nil
    var parameters: goast_parameter_list? = nil
    var receiver: goast_parameter_list? = nil
    // subtypes:  _simple_type parameter_list
    var result: GoAST? = nil
}

class goast_method_spec: GoAST {
    var name: goast_field_identifier? = nil
    var parameters: goast_parameter_list? = nil
    // subtypes:  _simple_type parameter_list
    var result: GoAST? = nil
}

class goast_method_spec_list: GoAST {
    // subtypes:  method_spec qualified_type type_identifier
    var children: [GoAST] = []
}

class goast_package_clause: GoAST {
    var children: goast_package_identifier? = nil
}

class goast_parameter_declaration: GoAST {
    var name: [goast_identifier] = []
    var type: goast__type? = nil
}

class goast_parameter_list: GoAST {
    // subtypes:  parameter_declaration variadic_parameter_declaration
    var children: [GoAST] = []
}

class goast_parenthesized_expression: goast__expression {
    var children: goast__expression? = nil
}

class goast_parenthesized_type: goast__type {
    var children: goast__type? = nil
}

class goast_pointer_type: goast__simple_type {
    var children: goast__type? = nil
}

class goast_qualified_type: goast__simple_type {
    var name: goast_type_identifier? = nil
    var package: goast_package_identifier? = nil
}

class goast_range_clause: GoAST {
    var left: goast_expression_list? = nil
    var right: goast__expression? = nil
}

class goast_receive_statement: GoAST {
    var left: goast_expression_list? = nil
    var right: goast__expression? = nil
}

class goast_return_statement: goast__statement {
    var children: goast_expression_list? = nil
}

class goast_select_statement: goast__statement {
    // subtypes:  communication_case default_case
    var children: [GoAST] = []
}

class goast_selector_expression: goast__expression {
    var field: goast_field_identifier? = nil
    var operand: goast__expression? = nil
}

class goast_send_statement: goast__simple_statement {
    var channel: goast__expression? = nil
    var value: goast__expression? = nil
}

class goast_short_var_declaration: goast__simple_statement {
    var left: goast_expression_list? = nil
    var right: goast_expression_list? = nil
}

class goast_slice_expression: goast__expression {
    var capacity: goast__expression? = nil
    var end: goast__expression? = nil
    var operand: goast__expression? = nil
    var start: goast__expression? = nil
}

class goast_slice_type: goast__simple_type {
    var element: goast__type? = nil
}

class goast_source_file: GoAST {
    // subtypes:  _statement function_declaration import_declaration method_declaration package_clause
    var children: [GoAST] = []
}

class goast_struct_type: goast__simple_type {
    var children: goast_field_declaration_list? = nil
}

class goast_type_alias: GoAST {
    var name: goast_type_identifier? = nil
    var type: goast__type? = nil
}

class goast_type_assertion_expression: goast__expression {
    var operand: goast__expression? = nil
    var type: goast__type? = nil
}

class goast_type_case: GoAST {
    var type: [goast__type] = []
    var children: [goast__statement] = []
}

class goast_type_conversion_expression: goast__expression {
    var operand: goast__expression? = nil
    var type: goast__type? = nil
}

class goast_type_declaration: goast__statement {
    // subtypes:  type_alias type_spec
    var children: [GoAST] = []
}

class goast_type_spec: GoAST {
    var name: goast_type_identifier? = nil
    var type: goast__type? = nil
}

class goast_type_switch_statement: goast__statement {
    var alias: goast_expression_list? = nil
    var initializer: goast__simple_statement? = nil
    var value: goast__expression? = nil
    // subtypes:  default_case type_case
    var children: [GoAST] = []
}

class goast_unary_expression: goast__expression {
    var operand: goast__expression? = nil
}

class goast_var_declaration: goast__statement {
    var children: [goast_var_spec] = []
}

class goast_var_spec: GoAST {
    var name: [goast_identifier] = []
    var type: goast__type? = nil
    var value: goast_expression_list? = nil
}

class goast_variadic_argument: GoAST {
    var children: goast__expression? = nil
}

class goast_variadic_parameter_declaration: GoAST {
    var name: goast_identifier? = nil
    var type: goast__type? = nil
}

class goast_blank_identifier: GoAST {
}

class goast_escape_sequence: GoAST {
}

class goast_false: goast__expression {
}

class goast_field_identifier: GoAST {
}

class goast_float_literal: goast__expression {
}

class goast_identifier: goast__expression {
}

class goast_imaginary_literal: goast__expression {
}

class goast_int_literal: goast__expression {
}

class goast_label_name: GoAST {
}

class goast_nil: goast__expression {
}

class goast_package_identifier: GoAST {
}

class goast_raw_string_literal: goast__expression {
}

class goast_rune_literal: goast__expression {
}

class goast_true: goast__expression {
}

class goast_type_identifier: goast__simple_type {
}
