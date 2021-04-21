// This file is auto-generated from ts2st_JavaAST_20210411145127

import Foundation
import Common

class JavaAST: Common.AST {
    var errors: [JavaAST] = []
    var comments: [javaast_comment] = []

    override init(pos: Common.Position, parent: AST? = nil) {
        super.init(pos: pos, parent: parent)
    }
}

class javaast_comment: JavaAST {

}

class javaast__literal: javaast_primary_expression {
    // subtype: javaast_binary_integer_literal
    // subtype: javaast_character_literal
    // subtype: javaast_decimal_floating_point_literal
    // subtype: javaast_decimal_integer_literal
    // subtype: javaast_false
    // subtype: javaast_hex_floating_point_literal
    // subtype: javaast_hex_integer_literal
    // subtype: javaast_null_literal
    // subtype: javaast_octal_integer_literal
    // subtype: javaast_string_literal
    // subtype: javaast_true
}

class javaast__simple_type: javaast__unannotated_type {
    // subtype: javaast_boolean_type
    // subtype: javaast_floating_point_type
    // subtype: javaast_generic_type
    // subtype: javaast_integral_type
    // subtype: javaast_scoped_type_identifier
    // subtype: javaast_type_identifier
    // subtype: javaast_void_type
}

class javaast__type: JavaAST, UASTExpr {
    // subtype: javaast__unannotated_type
    // subtype: javaast_annotated_type
    
    var _type: JavaType? = nil
    
    func getType() -> Type? {
        return self._type
    }
    
    func setType(type: JavaType) {
        self._type = type
    }
}

class javaast__unannotated_type: javaast__type {
    // subtype: javaast__simple_type
    // subtype: javaast_array_type
}

class javaast_annotated_type: javaast__type {
    // subtypes:  _unannotated_type annotation marker_annotation
    var children: [JavaAST] = []
}

class javaast_annotation: JavaAST {
    var arguments: javaast_annotation_argument_list? = nil
    // subtypes:  identifier scoped_identifier
    var name: JavaAST? = nil
}

class javaast_annotation_argument_list: JavaAST {
    // subtypes:  annotation element_value_array_initializer element_value_pair expression marker_annotation
    var children: [JavaAST] = []
}

class javaast_annotation_type_body: JavaAST {
    // subtypes:  annotation_type_declaration annotation_type_element_declaration class_declaration constant_declaration interface_declaration
    var children: [JavaAST] = []
}

class javaast_annotation_type_declaration: javaast_declaration {
    var body: javaast_annotation_type_body? = nil
    var name: javaast_identifier? = nil
    var children: javaast_modifiers? = nil
}

class javaast_annotation_type_element_declaration: JavaAST {
    var dimensions: javaast_dimensions? = nil
    var name: javaast_identifier? = nil
    var type: javaast__unannotated_type? = nil
    // subtypes:  annotation element_value_array_initializer expression marker_annotation
    var value: JavaAST? = nil
    var children: javaast_modifiers? = nil
}

class javaast_argument_list: JavaAST {
    var children: [javaast_expression] = []
}

class javaast_array_access: javaast_primary_expression {
    var array: javaast_primary_expression? = nil
    var index: javaast_expression? = nil
}

class javaast_array_creation_expression: javaast_primary_expression {
    // subtypes:  dimensions dimensions_expr
    var dimensions: [JavaAST] = []
    var type: javaast__simple_type? = nil
    var value: javaast_array_initializer? = nil
}

class javaast_array_initializer: JavaAST {
    // subtypes:  array_initializer expression
    var children: [JavaAST] = []
}

class javaast_array_type: javaast__unannotated_type {
    var dimensions: javaast_dimensions? = nil
    var element: javaast__unannotated_type? = nil
}

class javaast_assert_statement: javaast_statement {
    var children: [javaast_expression] = []
}

class javaast_assignment_expression: javaast_expression {
    // subtypes:  array_access field_access identifier
    var left: JavaAST? = nil
    var right: javaast_expression? = nil
}

class javaast_asterisk: JavaAST {
}

class javaast_binary_expression: javaast_expression {
    var left: javaast_expression? = nil
    var right: javaast_expression? = nil
}

class javaast_binary_integer_literal: javaast__literal {
}

class javaast_block: javaast_statement {
    var children: [javaast_statement] = []
}

class javaast_boolean_type: javaast__simple_type {
}

class javaast_break_statement: javaast_statement {
    var children: javaast_identifier? = nil
}

class javaast_cast_expression: javaast_expression {
    var type: [javaast__type] = []
    var value: javaast_expression? = nil
}

class javaast_catch_clause: JavaAST {
    var body: javaast_block? = nil
    var children: javaast_catch_formal_parameter? = nil
}

class javaast_catch_formal_parameter: JavaAST {
    var dimensions: javaast_dimensions? = nil
    var name: javaast_identifier? = nil
    // subtypes:  catch_type modifiers
    var children: [JavaAST] = []
}

class javaast_catch_type: JavaAST {
    var children: [javaast__unannotated_type] = []
}

class javaast_character_literal: javaast__literal {
}

class javaast_class_body: JavaAST {
    // subtypes:  annotation_type_declaration block class_declaration constructor_declaration enum_declaration field_declaration interface_declaration method_declaration record_declaration static_initializer
    var children: [JavaAST] = []
}

class javaast_class_declaration: javaast_declaration {
    var body: javaast_class_body? = nil
    var interfaces: javaast_super_interfaces? = nil
    var name: javaast_identifier? = nil
    var superclass: javaast_superclass? = nil
    var type_parameters: javaast_type_parameters? = nil
    var children: javaast_modifiers? = nil
}

class javaast_class_literal: javaast_primary_expression {
    var children: javaast__unannotated_type? = nil
}

class javaast_constant_declaration: JavaAST {
    var declarator: [javaast_variable_declarator] = []
    var type: javaast__unannotated_type? = nil
    var children: javaast_modifiers? = nil
}

class javaast_constructor_body: JavaAST {
    // subtypes:  explicit_constructor_invocation statement
    var children: [JavaAST] = []
}

class javaast_constructor_declaration: JavaAST {
    var body: javaast_constructor_body? = nil
    var name: javaast_identifier? = nil
    var parameters: javaast_formal_parameters? = nil
    var type_parameters: javaast_type_parameters? = nil
    // subtypes:  modifiers throws
    var children: [JavaAST] = []
}

class javaast_continue_statement: javaast_statement {
    var children: javaast_identifier? = nil
}

class javaast_decimal_floating_point_literal: javaast__literal {
}

class javaast_decimal_integer_literal: javaast__literal {
}

class javaast_declaration: javaast_statement {
    // subtype: javaast_annotation_type_declaration
    // subtype: javaast_class_declaration
    // subtype: javaast_enum_declaration
    // subtype: javaast_import_declaration
    // subtype: javaast_interface_declaration
    // subtype: javaast_module_declaration
    // subtype: javaast_package_declaration
}

class javaast_dimensions: JavaAST {
    // subtypes:  annotation marker_annotation
    var children: [JavaAST] = []
}

class javaast_dimensions_expr: JavaAST {
    // subtypes:  annotation expression marker_annotation
    var children: [JavaAST] = []
}

class javaast_do_statement: javaast_statement {
    var body: javaast_statement? = nil
    var condition: javaast_parenthesized_expression? = nil
}

class javaast_element_value_array_initializer: JavaAST {
    // subtypes:  annotation element_value_array_initializer expression marker_annotation
    var children: [JavaAST] = []
}

class javaast_element_value_pair: JavaAST {
    var key: javaast_identifier? = nil
    // subtypes:  annotation element_value_array_initializer expression marker_annotation
    var value: JavaAST? = nil
}

class javaast_enhanced_for_statement: javaast_statement {
    var body: javaast_statement? = nil
    var dimensions: javaast_dimensions? = nil
    var name: javaast_identifier? = nil
    var type: javaast__unannotated_type? = nil
    var value: javaast_expression? = nil
    var children: javaast_modifiers? = nil
}

class javaast_enum_body: JavaAST {
    // subtypes:  enum_body_declarations enum_constant
    var children: [JavaAST] = []
}

class javaast_enum_body_declarations: JavaAST {
    // subtypes:  annotation_type_declaration block class_declaration constructor_declaration enum_declaration field_declaration interface_declaration method_declaration record_declaration static_initializer
    var children: [JavaAST] = []
}

class javaast_enum_constant: JavaAST {
    var arguments: javaast_argument_list? = nil
    var body: javaast_class_body? = nil
    var name: javaast_identifier? = nil
    var children: javaast_modifiers? = nil
}

class javaast_enum_declaration: javaast_declaration {
    var body: javaast_enum_body? = nil
    var interfaces: javaast_super_interfaces? = nil
    var name: javaast_identifier? = nil
    var children: javaast_modifiers? = nil
}

class javaast_explicit_constructor_invocation: JavaAST {
    var arguments: javaast_argument_list? = nil
    // subtypes:  super this
    var constructor: JavaAST? = nil
    var object: javaast_primary_expression? = nil
    var type_arguments: javaast_type_arguments? = nil
}

class javaast_expression: JavaAST, UASTExpr {
    // subtype: javaast_assignment_expression
    // subtype: javaast_binary_expression
    // subtype: javaast_cast_expression
    // subtype: javaast_instanceof_expression
    // subtype: javaast_lambda_expression
    // subtype: javaast_primary_expression
    // subtype: javaast_ternary_expression
    // subtype: javaast_unary_expression
    // subtype: javaast_update_expression
    
    var _type: JavaType? = nil
    
    func getType() -> Type? {
        return self._type
    }
    
    func setType(type: JavaType?) {
        self._type = type
    }
    
    func clearType() {
        self._type = nil
    }
}

class javaast_expression_statement: javaast_statement {
    var children: javaast_expression? = nil
}

class javaast_extends_interfaces: JavaAST {
    var children: javaast_interface_type_list? = nil
}

class javaast_false: javaast__literal {
}

class javaast_field_access: javaast_primary_expression {
    // subtypes:  identifier this
    var field: JavaAST? = nil
    // subtypes:  primary_expression super
    var object: JavaAST? = nil
    var children: javaast_super? = nil
}

class javaast_field_declaration: JavaAST {
    var declarator: [javaast_variable_declarator] = []
    var type: javaast__unannotated_type? = nil
    var children: javaast_modifiers? = nil
}

class javaast_finally_clause: JavaAST {
    var children: javaast_block? = nil
}

class javaast_floating_point_type: javaast__simple_type {
}

class javaast_for_statement: javaast_statement {
    var body: javaast_statement? = nil
    var condition: javaast_expression? = nil
    // subtypes:  expression local_variable_declaration
    var initial: [JavaAST] = []
    var update: [javaast_expression] = []
}

class javaast_formal_parameter: JavaAST {
    var dimensions: javaast_dimensions? = nil
    var name: javaast_identifier? = nil
    var type: javaast__unannotated_type? = nil
    var children: javaast_modifiers? = nil
}

class javaast_formal_parameters: JavaAST {
    // subtypes:  formal_parameter receiver_parameter spread_parameter
    var children: [JavaAST] = []
}

class javaast_generic_type: javaast__simple_type {
    // subtypes:  scoped_type_identifier type_arguments type_identifier
    var children: [JavaAST] = []
}

class javaast_hex_floating_point_literal: javaast__literal {
}

class javaast_hex_integer_literal: javaast__literal {
}

class javaast_identifier: javaast_primary_expression, UASTIdentifier {
    var _declarations: [SymbolPosition] = []
    
    var declarations: [SymbolPosition] {
        return self._declarations
    }
    
    func setDeclarations(_ decls: [SymbolPosition]) {
        self._declarations = decls
    }
}

class javaast_if_statement: javaast_statement {
    var alternative: javaast_statement? = nil
    var condition: javaast_parenthesized_expression? = nil
    var consequence: javaast_statement? = nil
}

class javaast_import_declaration: javaast_declaration {
    // subtypes:  asterisk identifier scoped_identifier
    var children: [JavaAST] = []
}

class javaast_inferred_parameters: JavaAST {
    var children: [javaast_identifier] = []
}

class javaast_instanceof_expression: javaast_expression {
    var left: javaast_expression? = nil
    var right: javaast__type? = nil
}

class javaast_integral_type: javaast__simple_type {
}

class javaast_interface_body: JavaAST {
    // subtypes:  annotation_type_declaration class_declaration constant_declaration enum_declaration interface_declaration method_declaration
    var children: [JavaAST] = []
}

class javaast_interface_declaration: javaast_declaration {
    var body: javaast_interface_body? = nil
    var name: javaast_identifier? = nil
    var type_parameters: javaast_type_parameters? = nil
    // subtypes:  extends_interfaces modifiers
    var children: [JavaAST] = []
}

class javaast_interface_type_list: JavaAST {
    var children: [javaast__type] = []
}

class javaast_labeled_statement: javaast_statement {
    // subtypes:  identifier statement
    var children: [JavaAST] = []
}

class javaast_lambda_expression: javaast_expression {
    // subtypes:  block expression
    var body: JavaAST? = nil
    // subtypes:  formal_parameters identifier inferred_parameters
    var parameters: JavaAST? = nil
}

class javaast_local_variable_declaration: javaast_statement {
    var declarator: [javaast_variable_declarator] = []
    var type: javaast__unannotated_type? = nil
    var children: javaast_modifiers? = nil
}

class javaast_marker_annotation: JavaAST {
    // subtypes:  identifier scoped_identifier
    var name: JavaAST? = nil
}

class javaast_method_declaration: JavaAST {
    var body: javaast_block? = nil
    var dimensions: javaast_dimensions? = nil
    var name: javaast_identifier? = nil
    var parameters: javaast_formal_parameters? = nil
    var type: javaast__unannotated_type? = nil
    var type_parameters: javaast_type_parameters? = nil
    // subtypes:  annotation marker_annotation modifiers throws
    var children: [JavaAST] = []
}

class javaast_method_invocation: javaast_primary_expression {
    var arguments: javaast_argument_list? = nil
    var name: javaast_identifier? = nil
    // subtypes:  primary_expression super
    var object: JavaAST? = nil
    var type_arguments: javaast_type_arguments? = nil
    var children: javaast_super? = nil
}

class javaast_method_reference: javaast_primary_expression {
    // subtypes:  _type primary_expression super type_arguments
    var children: [JavaAST] = []
}

class javaast_modifiers: JavaAST {
    // subtypes:  annotation marker_annotation
    var children: [JavaAST] = []
}

class javaast_module_body: JavaAST {
    var children: [javaast_module_directive] = []
}

class javaast_module_declaration: javaast_declaration {
    var body: javaast_module_body? = nil
    // subtypes:  identifier scoped_identifier
    var name: JavaAST? = nil
    // subtypes:  annotation marker_annotation
    var children: [JavaAST] = []
}

class javaast_module_directive: JavaAST {
    // subtypes:  identifier requires_modifier scoped_identifier
    var children: [JavaAST] = []
}

class javaast_null_literal: javaast__literal {
}

class javaast_object_creation_expression: javaast_primary_expression {
    var arguments: javaast_argument_list? = nil
    var type: javaast__simple_type? = nil
    var type_arguments: javaast_type_arguments? = nil
    // subtypes:  class_body primary_expression
    var children: [JavaAST] = []
}

class javaast_octal_integer_literal: javaast__literal {
}

class javaast_package_declaration: javaast_declaration {
    // subtypes:  annotation identifier marker_annotation scoped_identifier
    var children: [JavaAST] = []
}

class javaast_parenthesized_expression: javaast_primary_expression {
    var children: javaast_expression? = nil
}

class javaast_primary_expression: javaast_expression {
    // subtype: javaast__literal
    // subtype: javaast_array_access
    // subtype: javaast_array_creation_expression
    // subtype: javaast_class_literal
    // subtype: javaast_field_access
    // subtype: javaast_identifier
    // subtype: javaast_method_invocation
    // subtype: javaast_method_reference
    // subtype: javaast_object_creation_expression
    // subtype: javaast_parenthesized_expression
    // subtype: javaast_this
}

class javaast_program: JavaAST {
    var children: [javaast_statement] = []
}

class javaast_receiver_parameter: JavaAST {
    // subtypes:  _unannotated_type annotation identifier marker_annotation this
    var children: [JavaAST] = []
}

class javaast_record_declaration: JavaAST {
    var body: javaast_class_body? = nil
    var name: javaast_identifier? = nil
    var parameters: javaast_formal_parameters? = nil
    var children: javaast_modifiers? = nil
}

class javaast_requires_modifier: JavaAST {
}

class javaast_resource: JavaAST {
    var dimensions: javaast_dimensions? = nil
    var name: javaast_identifier? = nil
    var type: javaast__unannotated_type? = nil
    var value: javaast_expression? = nil
    // subtypes:  field_access identifier modifiers
    var children: JavaAST? = nil
}

class javaast_resource_specification: JavaAST {
    var children: [javaast_resource] = []
}

class javaast_return_statement: javaast_statement {
    var children: javaast_expression? = nil
}

class javaast_scoped_identifier: JavaAST {
    var name: javaast_identifier? = nil
    // subtypes:  identifier scoped_identifier
    var scope: JavaAST? = nil
}

class javaast_scoped_type_identifier: javaast__simple_type {
    // subtypes:  annotation generic_type marker_annotation scoped_type_identifier type_identifier
    var children: [JavaAST] = []
}

class javaast_spread_parameter: JavaAST {
    // subtypes:  _unannotated_type modifiers variable_declarator
    var children: [JavaAST] = []
}

class javaast_statement: JavaAST {
    // subtype: javaast_assert_statement
    // subtype: javaast_block
    // subtype: javaast_break_statement
    // subtype: javaast_continue_statement
    // subtype: javaast_declaration
    // subtype: javaast_do_statement
    // subtype: javaast_enhanced_for_statement
    // subtype: javaast_expression_statement
    // subtype: javaast_for_statement
    // subtype: javaast_if_statement
    // subtype: javaast_labeled_statement
    // subtype: javaast_local_variable_declaration
    // subtype: javaast_return_statement
    // subtype: javaast_switch_statement
    // subtype: javaast_synchronized_statement
    // subtype: javaast_throw_statement
    // subtype: javaast_try_statement
    // subtype: javaast_try_with_resources_statement
    // subtype: javaast_while_statement
}

class javaast_static_initializer: JavaAST {
    var children: javaast_block? = nil
}

class javaast_string_literal: javaast__literal {
}

class javaast_super: JavaAST {
}

class javaast_super_interfaces: JavaAST {
    var children: javaast_interface_type_list? = nil
}

class javaast_superclass: JavaAST {
    var children: javaast__type? = nil
}

class javaast_switch_block: JavaAST {
    // subtypes:  statement switch_label
    var children: [JavaAST] = []
}

class javaast_switch_label: JavaAST {
    var children: javaast_expression? = nil
}

class javaast_switch_statement: javaast_statement {
    var body: javaast_switch_block? = nil
    var condition: javaast_parenthesized_expression? = nil
}

class javaast_synchronized_statement: javaast_statement {
    var body: javaast_block? = nil
    var children: javaast_parenthesized_expression? = nil
}

class javaast_ternary_expression: javaast_expression {
    var alternative: javaast_expression? = nil
    var condition: javaast_expression? = nil
    var consequence: javaast_expression? = nil
}

class javaast_this: javaast_primary_expression {
}

class javaast_throw_statement: javaast_statement {
    var children: javaast_expression? = nil
}

class javaast_throws: JavaAST {
    var children: [javaast__type] = []
}

class javaast_true: javaast__literal {
}

class javaast_try_statement: javaast_statement {
    var body: javaast_block? = nil
    // subtypes:  catch_clause finally_clause
    var children: [JavaAST] = []
}

class javaast_try_with_resources_statement: javaast_statement {
    var body: javaast_block? = nil
    var resources: javaast_resource_specification? = nil
    // subtypes:  catch_clause finally_clause
    var children: [JavaAST] = []
}

class javaast_type_arguments: JavaAST {
    // subtypes:  _type wildcard
    var children: [JavaAST] = []
}

class javaast_type_bound: JavaAST {
    var children: [javaast__type] = []
}

class javaast_type_identifier: javaast__simple_type {
}

class javaast_type_parameter: JavaAST {
    // subtypes:  annotation identifier marker_annotation type_bound
    var children: [JavaAST] = []
}

class javaast_type_parameters: JavaAST {
    var children: [javaast_type_parameter] = []
}

class javaast_unary_expression: javaast_expression {
    var operand: javaast_expression? = nil
}

class javaast_update_expression: javaast_expression {
    var children: javaast_expression? = nil
}

class javaast_variable_declarator: JavaAST {
    var dimensions: javaast_dimensions? = nil
    var name: javaast_identifier? = nil
    // subtypes:  array_initializer expression
    var value: JavaAST? = nil
}

class javaast_void_type: javaast__simple_type {
}

class javaast_while_statement: javaast_statement {
    var body: javaast_statement? = nil
    var condition: javaast_parenthesized_expression? = nil
}

class javaast_wildcard: JavaAST {
    // subtypes:  _type annotation marker_annotation super
    var children: [JavaAST] = []
}
