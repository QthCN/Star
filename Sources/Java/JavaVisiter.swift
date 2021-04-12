// This file is auto-generated from ts2st_JavaAST_20210411145127

import Foundation
import Common

class JavaVisiter {

    var handleError: Bool = false

    init() {
    }

    // 所有node都会被调用
    func visit_node(_ node: JavaAST) {

    }

    func visit_ast(_ node: JavaAST) {
        switch node {
            case let ast as javaast_annotated_type:
                self.visit_annotated_type(ast)
            case let ast as javaast_annotation:
                self.visit_annotation(ast)
            case let ast as javaast_annotation_argument_list:
                self.visit_annotation_argument_list(ast)
            case let ast as javaast_annotation_type_body:
                self.visit_annotation_type_body(ast)
            case let ast as javaast_annotation_type_declaration:
                self.visit_annotation_type_declaration(ast)
            case let ast as javaast_annotation_type_element_declaration:
                self.visit_annotation_type_element_declaration(ast)
            case let ast as javaast_argument_list:
                self.visit_argument_list(ast)
            case let ast as javaast_array_access:
                self.visit_array_access(ast)
            case let ast as javaast_array_creation_expression:
                self.visit_array_creation_expression(ast)
            case let ast as javaast_array_initializer:
                self.visit_array_initializer(ast)
            case let ast as javaast_array_type:
                self.visit_array_type(ast)
            case let ast as javaast_assert_statement:
                self.visit_assert_statement(ast)
            case let ast as javaast_assignment_expression:
                self.visit_assignment_expression(ast)
            case let ast as javaast_asterisk:
                self.visit_asterisk(ast)
            case let ast as javaast_binary_expression:
                self.visit_binary_expression(ast)
            case let ast as javaast_binary_integer_literal:
                self.visit_binary_integer_literal(ast)
            case let ast as javaast_block:
                self.visit_block(ast)
            case let ast as javaast_boolean_type:
                self.visit_boolean_type(ast)
            case let ast as javaast_break_statement:
                self.visit_break_statement(ast)
            case let ast as javaast_cast_expression:
                self.visit_cast_expression(ast)
            case let ast as javaast_catch_clause:
                self.visit_catch_clause(ast)
            case let ast as javaast_catch_formal_parameter:
                self.visit_catch_formal_parameter(ast)
            case let ast as javaast_catch_type:
                self.visit_catch_type(ast)
            case let ast as javaast_character_literal:
                self.visit_character_literal(ast)
            case let ast as javaast_class_body:
                self.visit_class_body(ast)
            case let ast as javaast_class_declaration:
                self.visit_class_declaration(ast)
            case let ast as javaast_class_literal:
                self.visit_class_literal(ast)
            case let ast as javaast_comment:
                self.visit_comment(ast)
            case let ast as javaast_constant_declaration:
                self.visit_constant_declaration(ast)
            case let ast as javaast_constructor_body:
                self.visit_constructor_body(ast)
            case let ast as javaast_constructor_declaration:
                self.visit_constructor_declaration(ast)
            case let ast as javaast_continue_statement:
                self.visit_continue_statement(ast)
            case let ast as javaast_decimal_floating_point_literal:
                self.visit_decimal_floating_point_literal(ast)
            case let ast as javaast_decimal_integer_literal:
                self.visit_decimal_integer_literal(ast)
            case let ast as javaast_dimensions:
                self.visit_dimensions(ast)
            case let ast as javaast_dimensions_expr:
                self.visit_dimensions_expr(ast)
            case let ast as javaast_do_statement:
                self.visit_do_statement(ast)
            case let ast as javaast_element_value_array_initializer:
                self.visit_element_value_array_initializer(ast)
            case let ast as javaast_element_value_pair:
                self.visit_element_value_pair(ast)
            case let ast as javaast_enhanced_for_statement:
                self.visit_enhanced_for_statement(ast)
            case let ast as javaast_enum_body:
                self.visit_enum_body(ast)
            case let ast as javaast_enum_body_declarations:
                self.visit_enum_body_declarations(ast)
            case let ast as javaast_enum_constant:
                self.visit_enum_constant(ast)
            case let ast as javaast_enum_declaration:
                self.visit_enum_declaration(ast)
            case let ast as javaast_explicit_constructor_invocation:
                self.visit_explicit_constructor_invocation(ast)
            case let ast as javaast_expression_statement:
                self.visit_expression_statement(ast)
            case let ast as javaast_extends_interfaces:
                self.visit_extends_interfaces(ast)
            case let ast as javaast_false:
                self.visit_false(ast)
            case let ast as javaast_field_access:
                self.visit_field_access(ast)
            case let ast as javaast_field_declaration:
                self.visit_field_declaration(ast)
            case let ast as javaast_finally_clause:
                self.visit_finally_clause(ast)
            case let ast as javaast_floating_point_type:
                self.visit_floating_point_type(ast)
            case let ast as javaast_for_statement:
                self.visit_for_statement(ast)
            case let ast as javaast_formal_parameter:
                self.visit_formal_parameter(ast)
            case let ast as javaast_formal_parameters:
                self.visit_formal_parameters(ast)
            case let ast as javaast_generic_type:
                self.visit_generic_type(ast)
            case let ast as javaast_hex_floating_point_literal:
                self.visit_hex_floating_point_literal(ast)
            case let ast as javaast_hex_integer_literal:
                self.visit_hex_integer_literal(ast)
            case let ast as javaast_identifier:
                self.visit_identifier(ast)
            case let ast as javaast_if_statement:
                self.visit_if_statement(ast)
            case let ast as javaast_import_declaration:
                self.visit_import_declaration(ast)
            case let ast as javaast_inferred_parameters:
                self.visit_inferred_parameters(ast)
            case let ast as javaast_instanceof_expression:
                self.visit_instanceof_expression(ast)
            case let ast as javaast_integral_type:
                self.visit_integral_type(ast)
            case let ast as javaast_interface_body:
                self.visit_interface_body(ast)
            case let ast as javaast_interface_declaration:
                self.visit_interface_declaration(ast)
            case let ast as javaast_interface_type_list:
                self.visit_interface_type_list(ast)
            case let ast as javaast_labeled_statement:
                self.visit_labeled_statement(ast)
            case let ast as javaast_lambda_expression:
                self.visit_lambda_expression(ast)
            case let ast as javaast_local_variable_declaration:
                self.visit_local_variable_declaration(ast)
            case let ast as javaast_marker_annotation:
                self.visit_marker_annotation(ast)
            case let ast as javaast_method_declaration:
                self.visit_method_declaration(ast)
            case let ast as javaast_method_invocation:
                self.visit_method_invocation(ast)
            case let ast as javaast_method_reference:
                self.visit_method_reference(ast)
            case let ast as javaast_modifiers:
                self.visit_modifiers(ast)
            case let ast as javaast_module_body:
                self.visit_module_body(ast)
            case let ast as javaast_module_declaration:
                self.visit_module_declaration(ast)
            case let ast as javaast_module_directive:
                self.visit_module_directive(ast)
            case let ast as javaast_null_literal:
                self.visit_null_literal(ast)
            case let ast as javaast_object_creation_expression:
                self.visit_object_creation_expression(ast)
            case let ast as javaast_octal_integer_literal:
                self.visit_octal_integer_literal(ast)
            case let ast as javaast_package_declaration:
                self.visit_package_declaration(ast)
            case let ast as javaast_parenthesized_expression:
                self.visit_parenthesized_expression(ast)
            case let ast as javaast_program:
                self.visit_program(ast)
            case let ast as javaast_receiver_parameter:
                self.visit_receiver_parameter(ast)
            case let ast as javaast_record_declaration:
                self.visit_record_declaration(ast)
            case let ast as javaast_requires_modifier:
                self.visit_requires_modifier(ast)
            case let ast as javaast_resource:
                self.visit_resource(ast)
            case let ast as javaast_resource_specification:
                self.visit_resource_specification(ast)
            case let ast as javaast_return_statement:
                self.visit_return_statement(ast)
            case let ast as javaast_scoped_identifier:
                self.visit_scoped_identifier(ast)
            case let ast as javaast_scoped_type_identifier:
                self.visit_scoped_type_identifier(ast)
            case let ast as javaast_spread_parameter:
                self.visit_spread_parameter(ast)
            case let ast as javaast_static_initializer:
                self.visit_static_initializer(ast)
            case let ast as javaast_string_literal:
                self.visit_string_literal(ast)
            case let ast as javaast_super:
                self.visit_super(ast)
            case let ast as javaast_super_interfaces:
                self.visit_super_interfaces(ast)
            case let ast as javaast_superclass:
                self.visit_superclass(ast)
            case let ast as javaast_switch_block:
                self.visit_switch_block(ast)
            case let ast as javaast_switch_label:
                self.visit_switch_label(ast)
            case let ast as javaast_switch_statement:
                self.visit_switch_statement(ast)
            case let ast as javaast_synchronized_statement:
                self.visit_synchronized_statement(ast)
            case let ast as javaast_ternary_expression:
                self.visit_ternary_expression(ast)
            case let ast as javaast_this:
                self.visit_this(ast)
            case let ast as javaast_throw_statement:
                self.visit_throw_statement(ast)
            case let ast as javaast_throws:
                self.visit_throws(ast)
            case let ast as javaast_true:
                self.visit_true(ast)
            case let ast as javaast_try_statement:
                self.visit_try_statement(ast)
            case let ast as javaast_try_with_resources_statement:
                self.visit_try_with_resources_statement(ast)
            case let ast as javaast_type_arguments:
                self.visit_type_arguments(ast)
            case let ast as javaast_type_bound:
                self.visit_type_bound(ast)
            case let ast as javaast_type_identifier:
                self.visit_type_identifier(ast)
            case let ast as javaast_type_parameter:
                self.visit_type_parameter(ast)
            case let ast as javaast_type_parameters:
                self.visit_type_parameters(ast)
            case let ast as javaast_unary_expression:
                self.visit_unary_expression(ast)
            case let ast as javaast_update_expression:
                self.visit_update_expression(ast)
            case let ast as javaast_variable_declarator:
                self.visit_variable_declarator(ast)
            case let ast as javaast_void_type:
                self.visit_void_type(ast)
            case let ast as javaast_while_statement:
                self.visit_while_statement(ast)
            case let ast as javaast_wildcard:
                self.visit_wildcard(ast)
            default:
                break
        }
    }

    func visit__literal(_ node: javaast__literal) {
        switch node {
            case let ast as javaast_binary_integer_literal:
                self.visit_binary_integer_literal(ast)
            case let ast as javaast_character_literal:
                self.visit_character_literal(ast)
            case let ast as javaast_decimal_floating_point_literal:
                self.visit_decimal_floating_point_literal(ast)
            case let ast as javaast_decimal_integer_literal:
                self.visit_decimal_integer_literal(ast)
            case let ast as javaast_false:
                self.visit_false(ast)
            case let ast as javaast_hex_floating_point_literal:
                self.visit_hex_floating_point_literal(ast)
            case let ast as javaast_hex_integer_literal:
                self.visit_hex_integer_literal(ast)
            case let ast as javaast_null_literal:
                self.visit_null_literal(ast)
            case let ast as javaast_octal_integer_literal:
                self.visit_octal_integer_literal(ast)
            case let ast as javaast_string_literal:
                self.visit_string_literal(ast)
            case let ast as javaast_true:
                self.visit_true(ast)
            default:
                break
        }
    }

    func visit__simple_type(_ node: javaast__simple_type) {
        switch node {
            case let ast as javaast_boolean_type:
                self.visit_boolean_type(ast)
            case let ast as javaast_floating_point_type:
                self.visit_floating_point_type(ast)
            case let ast as javaast_generic_type:
                self.visit_generic_type(ast)
            case let ast as javaast_integral_type:
                self.visit_integral_type(ast)
            case let ast as javaast_scoped_type_identifier:
                self.visit_scoped_type_identifier(ast)
            case let ast as javaast_type_identifier:
                self.visit_type_identifier(ast)
            case let ast as javaast_void_type:
                self.visit_void_type(ast)
            default:
                break
        }
    }

    func visit__type(_ node: javaast__type) {
        switch node {
            case let ast as javaast__unannotated_type:
                self.visit__unannotated_type(ast)
            case let ast as javaast_annotated_type:
                self.visit_annotated_type(ast)
            default:
                break
        }
    }

    func visit__unannotated_type(_ node: javaast__unannotated_type) {
        switch node {
            case let ast as javaast__simple_type:
                self.visit__simple_type(ast)
            case let ast as javaast_array_type:
                self.visit_array_type(ast)
            default:
                break
        }
    }

    func visit_declaration(_ node: javaast_declaration) {
        switch node {
            case let ast as javaast_annotation_type_declaration:
                self.visit_annotation_type_declaration(ast)
            case let ast as javaast_class_declaration:
                self.visit_class_declaration(ast)
            case let ast as javaast_enum_declaration:
                self.visit_enum_declaration(ast)
            case let ast as javaast_import_declaration:
                self.visit_import_declaration(ast)
            case let ast as javaast_interface_declaration:
                self.visit_interface_declaration(ast)
            case let ast as javaast_module_declaration:
                self.visit_module_declaration(ast)
            case let ast as javaast_package_declaration:
                self.visit_package_declaration(ast)
            default:
                break
        }
    }

    func visit_expression(_ node: javaast_expression) {
        switch node {
            case let ast as javaast_assignment_expression:
                self.visit_assignment_expression(ast)
            case let ast as javaast_binary_expression:
                self.visit_binary_expression(ast)
            case let ast as javaast_cast_expression:
                self.visit_cast_expression(ast)
            case let ast as javaast_instanceof_expression:
                self.visit_instanceof_expression(ast)
            case let ast as javaast_lambda_expression:
                self.visit_lambda_expression(ast)
            case let ast as javaast_primary_expression:
                self.visit_primary_expression(ast)
            case let ast as javaast_ternary_expression:
                self.visit_ternary_expression(ast)
            case let ast as javaast_unary_expression:
                self.visit_unary_expression(ast)
            case let ast as javaast_update_expression:
                self.visit_update_expression(ast)
            default:
                break
        }
    }

    func visit_primary_expression(_ node: javaast_primary_expression) {
        switch node {
            case let ast as javaast__literal:
                self.visit__literal(ast)
            case let ast as javaast_array_access:
                self.visit_array_access(ast)
            case let ast as javaast_array_creation_expression:
                self.visit_array_creation_expression(ast)
            case let ast as javaast_class_literal:
                self.visit_class_literal(ast)
            case let ast as javaast_field_access:
                self.visit_field_access(ast)
            case let ast as javaast_identifier:
                self.visit_identifier(ast)
            case let ast as javaast_method_invocation:
                self.visit_method_invocation(ast)
            case let ast as javaast_method_reference:
                self.visit_method_reference(ast)
            case let ast as javaast_object_creation_expression:
                self.visit_object_creation_expression(ast)
            case let ast as javaast_parenthesized_expression:
                self.visit_parenthesized_expression(ast)
            case let ast as javaast_this:
                self.visit_this(ast)
            default:
                break
        }
    }

    func visit_statement(_ node: javaast_statement) {
        switch node {
            case let ast as javaast_assert_statement:
                self.visit_assert_statement(ast)
            case let ast as javaast_block:
                self.visit_block(ast)
            case let ast as javaast_break_statement:
                self.visit_break_statement(ast)
            case let ast as javaast_continue_statement:
                self.visit_continue_statement(ast)
            case let ast as javaast_declaration:
                self.visit_declaration(ast)
            case let ast as javaast_do_statement:
                self.visit_do_statement(ast)
            case let ast as javaast_enhanced_for_statement:
                self.visit_enhanced_for_statement(ast)
            case let ast as javaast_expression_statement:
                self.visit_expression_statement(ast)
            case let ast as javaast_for_statement:
                self.visit_for_statement(ast)
            case let ast as javaast_if_statement:
                self.visit_if_statement(ast)
            case let ast as javaast_labeled_statement:
                self.visit_labeled_statement(ast)
            case let ast as javaast_local_variable_declaration:
                self.visit_local_variable_declaration(ast)
            case let ast as javaast_return_statement:
                self.visit_return_statement(ast)
            case let ast as javaast_switch_statement:
                self.visit_switch_statement(ast)
            case let ast as javaast_synchronized_statement:
                self.visit_synchronized_statement(ast)
            case let ast as javaast_throw_statement:
                self.visit_throw_statement(ast)
            case let ast as javaast_try_statement:
                self.visit_try_statement(ast)
            case let ast as javaast_try_with_resources_statement:
                self.visit_try_with_resources_statement(ast)
            case let ast as javaast_while_statement:
                self.visit_while_statement(ast)
            default:
                break
        }
    }

    func visit_annotated_type(_ node: javaast_annotated_type) {
        self.visit_node(node)

        for ast in node.children {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_annotation(_ node: javaast_annotation) {
        self.visit_node(node)

        if let ast = node.arguments {
            self.visit_annotation_argument_list(ast)
        }

        if let ast = node.name {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_annotation_argument_list(_ node: javaast_annotation_argument_list) {
        self.visit_node(node)

        for ast in node.children {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_annotation_type_body(_ node: javaast_annotation_type_body) {
        self.visit_node(node)

        for ast in node.children {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_annotation_type_declaration(_ node: javaast_annotation_type_declaration) {
        self.visit_node(node)

        if let ast = node.body {
            self.visit_annotation_type_body(ast)
        }

        if let ast = node.name {
            self.visit_identifier(ast)
        }

        if let ast = node.children {
            self.visit_modifiers(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_annotation_type_element_declaration(_ node: javaast_annotation_type_element_declaration) {
        self.visit_node(node)

        if let ast = node.dimensions {
            self.visit_dimensions(ast)
        }

        if let ast = node.name {
            self.visit_identifier(ast)
        }

        if let ast = node.type {
            self.visit__unannotated_type(ast)
        }

        if let ast = node.value {
            self.visit_ast(ast)
        }

        if let ast = node.children {
            self.visit_modifiers(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_argument_list(_ node: javaast_argument_list) {
        self.visit_node(node)

        for ast in node.children {
            self.visit_expression(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_array_access(_ node: javaast_array_access) {
        self.visit_node(node)

        if let ast = node.array {
            self.visit_primary_expression(ast)
        }

        if let ast = node.index {
            self.visit_expression(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_array_creation_expression(_ node: javaast_array_creation_expression) {
        self.visit_node(node)

        for ast in node.dimensions {
            self.visit_ast(ast)
        }

        if let ast = node.type {
            self.visit__simple_type(ast)
        }

        if let ast = node.value {
            self.visit_array_initializer(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_array_initializer(_ node: javaast_array_initializer) {
        self.visit_node(node)

        for ast in node.children {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_array_type(_ node: javaast_array_type) {
        self.visit_node(node)

        if let ast = node.dimensions {
            self.visit_dimensions(ast)
        }

        if let ast = node.element {
            self.visit__unannotated_type(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_assert_statement(_ node: javaast_assert_statement) {
        self.visit_node(node)

        for ast in node.children {
            self.visit_expression(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_assignment_expression(_ node: javaast_assignment_expression) {
        self.visit_node(node)

        if let ast = node.left {
            self.visit_ast(ast)
        }

        if let ast = node.right {
            self.visit_expression(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_asterisk(_ node: javaast_asterisk) {
        self.visit_node(node)

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_binary_expression(_ node: javaast_binary_expression) {
        self.visit_node(node)

        if let ast = node.left {
            self.visit_expression(ast)
        }

        if let ast = node.right {
            self.visit_expression(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_binary_integer_literal(_ node: javaast_binary_integer_literal) {
        self.visit_node(node)

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_block(_ node: javaast_block) {
        self.visit_node(node)

        for ast in node.children {
            self.visit_statement(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_boolean_type(_ node: javaast_boolean_type) {
        self.visit_node(node)

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_break_statement(_ node: javaast_break_statement) {
        self.visit_node(node)

        if let ast = node.children {
            self.visit_identifier(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_cast_expression(_ node: javaast_cast_expression) {
        self.visit_node(node)

        for ast in node.type {
            self.visit__type(ast)
        }

        if let ast = node.value {
            self.visit_expression(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_catch_clause(_ node: javaast_catch_clause) {
        self.visit_node(node)

        if let ast = node.body {
            self.visit_block(ast)
        }

        if let ast = node.children {
            self.visit_catch_formal_parameter(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_catch_formal_parameter(_ node: javaast_catch_formal_parameter) {
        self.visit_node(node)

        if let ast = node.dimensions {
            self.visit_dimensions(ast)
        }

        if let ast = node.name {
            self.visit_identifier(ast)
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

    func visit_catch_type(_ node: javaast_catch_type) {
        self.visit_node(node)

        for ast in node.children {
            self.visit__unannotated_type(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_character_literal(_ node: javaast_character_literal) {
        self.visit_node(node)

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_class_body(_ node: javaast_class_body) {
        self.visit_node(node)

        for ast in node.children {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_class_declaration(_ node: javaast_class_declaration) {
        self.visit_node(node)

        if let ast = node.body {
            self.visit_class_body(ast)
        }

        if let ast = node.interfaces {
            self.visit_super_interfaces(ast)
        }

        if let ast = node.name {
            self.visit_identifier(ast)
        }

        if let ast = node.superclass {
            self.visit_superclass(ast)
        }

        if let ast = node.type_parameters {
            self.visit_type_parameters(ast)
        }

        if let ast = node.children {
            self.visit_modifiers(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_class_literal(_ node: javaast_class_literal) {
        self.visit_node(node)

        if let ast = node.children {
            self.visit__unannotated_type(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_comment(_ node: javaast_comment) {
        self.visit_node(node)

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_constant_declaration(_ node: javaast_constant_declaration) {
        self.visit_node(node)

        for ast in node.declarator {
            self.visit_variable_declarator(ast)
        }

        if let ast = node.type {
            self.visit__unannotated_type(ast)
        }

        if let ast = node.children {
            self.visit_modifiers(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_constructor_body(_ node: javaast_constructor_body) {
        self.visit_node(node)

        for ast in node.children {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_constructor_declaration(_ node: javaast_constructor_declaration) {
        self.visit_node(node)

        if let ast = node.body {
            self.visit_constructor_body(ast)
        }

        if let ast = node.name {
            self.visit_identifier(ast)
        }

        if let ast = node.parameters {
            self.visit_formal_parameters(ast)
        }

        if let ast = node.type_parameters {
            self.visit_type_parameters(ast)
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

    func visit_continue_statement(_ node: javaast_continue_statement) {
        self.visit_node(node)

        if let ast = node.children {
            self.visit_identifier(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_decimal_floating_point_literal(_ node: javaast_decimal_floating_point_literal) {
        self.visit_node(node)

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_decimal_integer_literal(_ node: javaast_decimal_integer_literal) {
        self.visit_node(node)

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_dimensions(_ node: javaast_dimensions) {
        self.visit_node(node)

        for ast in node.children {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_dimensions_expr(_ node: javaast_dimensions_expr) {
        self.visit_node(node)

        for ast in node.children {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_do_statement(_ node: javaast_do_statement) {
        self.visit_node(node)

        if let ast = node.body {
            self.visit_statement(ast)
        }

        if let ast = node.condition {
            self.visit_parenthesized_expression(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_element_value_array_initializer(_ node: javaast_element_value_array_initializer) {
        self.visit_node(node)

        for ast in node.children {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_element_value_pair(_ node: javaast_element_value_pair) {
        self.visit_node(node)

        if let ast = node.key {
            self.visit_identifier(ast)
        }

        if let ast = node.value {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_enhanced_for_statement(_ node: javaast_enhanced_for_statement) {
        self.visit_node(node)

        if let ast = node.body {
            self.visit_statement(ast)
        }

        if let ast = node.dimensions {
            self.visit_dimensions(ast)
        }

        if let ast = node.name {
            self.visit_identifier(ast)
        }

        if let ast = node.type {
            self.visit__unannotated_type(ast)
        }

        if let ast = node.value {
            self.visit_expression(ast)
        }

        if let ast = node.children {
            self.visit_modifiers(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_enum_body(_ node: javaast_enum_body) {
        self.visit_node(node)

        for ast in node.children {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_enum_body_declarations(_ node: javaast_enum_body_declarations) {
        self.visit_node(node)

        for ast in node.children {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_enum_constant(_ node: javaast_enum_constant) {
        self.visit_node(node)

        if let ast = node.arguments {
            self.visit_argument_list(ast)
        }

        if let ast = node.body {
            self.visit_class_body(ast)
        }

        if let ast = node.name {
            self.visit_identifier(ast)
        }

        if let ast = node.children {
            self.visit_modifiers(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_enum_declaration(_ node: javaast_enum_declaration) {
        self.visit_node(node)

        if let ast = node.body {
            self.visit_enum_body(ast)
        }

        if let ast = node.interfaces {
            self.visit_super_interfaces(ast)
        }

        if let ast = node.name {
            self.visit_identifier(ast)
        }

        if let ast = node.children {
            self.visit_modifiers(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_explicit_constructor_invocation(_ node: javaast_explicit_constructor_invocation) {
        self.visit_node(node)

        if let ast = node.arguments {
            self.visit_argument_list(ast)
        }

        if let ast = node.constructor {
            self.visit_ast(ast)
        }

        if let ast = node.object {
            self.visit_primary_expression(ast)
        }

        if let ast = node.type_arguments {
            self.visit_type_arguments(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_expression_statement(_ node: javaast_expression_statement) {
        self.visit_node(node)

        if let ast = node.children {
            self.visit_expression(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_extends_interfaces(_ node: javaast_extends_interfaces) {
        self.visit_node(node)

        if let ast = node.children {
            self.visit_interface_type_list(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_false(_ node: javaast_false) {
        self.visit_node(node)

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_field_access(_ node: javaast_field_access) {
        self.visit_node(node)

        if let ast = node.field {
            self.visit_ast(ast)
        }

        if let ast = node.object {
            self.visit_ast(ast)
        }

        if let ast = node.children {
            self.visit_super(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_field_declaration(_ node: javaast_field_declaration) {
        self.visit_node(node)

        for ast in node.declarator {
            self.visit_variable_declarator(ast)
        }

        if let ast = node.type {
            self.visit__unannotated_type(ast)
        }

        if let ast = node.children {
            self.visit_modifiers(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_finally_clause(_ node: javaast_finally_clause) {
        self.visit_node(node)

        if let ast = node.children {
            self.visit_block(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_floating_point_type(_ node: javaast_floating_point_type) {
        self.visit_node(node)

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_for_statement(_ node: javaast_for_statement) {
        self.visit_node(node)

        if let ast = node.body {
            self.visit_statement(ast)
        }

        if let ast = node.condition {
            self.visit_expression(ast)
        }

        for ast in node.initial {
            self.visit_ast(ast)
        }

        for ast in node.update {
            self.visit_expression(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_formal_parameter(_ node: javaast_formal_parameter) {
        self.visit_node(node)

        if let ast = node.dimensions {
            self.visit_dimensions(ast)
        }

        if let ast = node.name {
            self.visit_identifier(ast)
        }

        if let ast = node.type {
            self.visit__unannotated_type(ast)
        }

        if let ast = node.children {
            self.visit_modifiers(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_formal_parameters(_ node: javaast_formal_parameters) {
        self.visit_node(node)

        for ast in node.children {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_generic_type(_ node: javaast_generic_type) {
        self.visit_node(node)

        for ast in node.children {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_hex_floating_point_literal(_ node: javaast_hex_floating_point_literal) {
        self.visit_node(node)

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_hex_integer_literal(_ node: javaast_hex_integer_literal) {
        self.visit_node(node)

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_identifier(_ node: javaast_identifier) {
        self.visit_node(node)

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_if_statement(_ node: javaast_if_statement) {
        self.visit_node(node)

        if let ast = node.alternative {
            self.visit_statement(ast)
        }

        if let ast = node.condition {
            self.visit_parenthesized_expression(ast)
        }

        if let ast = node.consequence {
            self.visit_statement(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_import_declaration(_ node: javaast_import_declaration) {
        self.visit_node(node)

        for ast in node.children {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_inferred_parameters(_ node: javaast_inferred_parameters) {
        self.visit_node(node)

        for ast in node.children {
            self.visit_identifier(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_instanceof_expression(_ node: javaast_instanceof_expression) {
        self.visit_node(node)

        if let ast = node.left {
            self.visit_expression(ast)
        }

        if let ast = node.right {
            self.visit__type(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_integral_type(_ node: javaast_integral_type) {
        self.visit_node(node)

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_interface_body(_ node: javaast_interface_body) {
        self.visit_node(node)

        for ast in node.children {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_interface_declaration(_ node: javaast_interface_declaration) {
        self.visit_node(node)

        if let ast = node.body {
            self.visit_interface_body(ast)
        }

        if let ast = node.name {
            self.visit_identifier(ast)
        }

        if let ast = node.type_parameters {
            self.visit_type_parameters(ast)
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

    func visit_interface_type_list(_ node: javaast_interface_type_list) {
        self.visit_node(node)

        for ast in node.children {
            self.visit__type(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_labeled_statement(_ node: javaast_labeled_statement) {
        self.visit_node(node)

        for ast in node.children {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_lambda_expression(_ node: javaast_lambda_expression) {
        self.visit_node(node)

        if let ast = node.body {
            self.visit_ast(ast)
        }

        if let ast = node.parameters {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_local_variable_declaration(_ node: javaast_local_variable_declaration) {
        self.visit_node(node)

        for ast in node.declarator {
            self.visit_variable_declarator(ast)
        }

        if let ast = node.type {
            self.visit__unannotated_type(ast)
        }

        if let ast = node.children {
            self.visit_modifiers(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_marker_annotation(_ node: javaast_marker_annotation) {
        self.visit_node(node)

        if let ast = node.name {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_method_declaration(_ node: javaast_method_declaration) {
        self.visit_node(node)

        if let ast = node.body {
            self.visit_block(ast)
        }

        if let ast = node.dimensions {
            self.visit_dimensions(ast)
        }

        if let ast = node.name {
            self.visit_identifier(ast)
        }

        if let ast = node.parameters {
            self.visit_formal_parameters(ast)
        }

        if let ast = node.type {
            self.visit__unannotated_type(ast)
        }

        if let ast = node.type_parameters {
            self.visit_type_parameters(ast)
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

    func visit_method_invocation(_ node: javaast_method_invocation) {
        self.visit_node(node)

        if let ast = node.arguments {
            self.visit_argument_list(ast)
        }

        if let ast = node.name {
            self.visit_identifier(ast)
        }

        if let ast = node.object {
            self.visit_ast(ast)
        }

        if let ast = node.type_arguments {
            self.visit_type_arguments(ast)
        }

        if let ast = node.children {
            self.visit_super(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_method_reference(_ node: javaast_method_reference) {
        self.visit_node(node)

        for ast in node.children {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_modifiers(_ node: javaast_modifiers) {
        self.visit_node(node)

        for ast in node.children {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_module_body(_ node: javaast_module_body) {
        self.visit_node(node)

        for ast in node.children {
            self.visit_module_directive(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_module_declaration(_ node: javaast_module_declaration) {
        self.visit_node(node)

        if let ast = node.body {
            self.visit_module_body(ast)
        }

        if let ast = node.name {
            self.visit_ast(ast)
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

    func visit_module_directive(_ node: javaast_module_directive) {
        self.visit_node(node)

        for ast in node.children {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_null_literal(_ node: javaast_null_literal) {
        self.visit_node(node)

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_object_creation_expression(_ node: javaast_object_creation_expression) {
        self.visit_node(node)

        if let ast = node.arguments {
            self.visit_argument_list(ast)
        }

        if let ast = node.type {
            self.visit__simple_type(ast)
        }

        if let ast = node.type_arguments {
            self.visit_type_arguments(ast)
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

    func visit_octal_integer_literal(_ node: javaast_octal_integer_literal) {
        self.visit_node(node)

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_package_declaration(_ node: javaast_package_declaration) {
        self.visit_node(node)

        for ast in node.children {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_parenthesized_expression(_ node: javaast_parenthesized_expression) {
        self.visit_node(node)

        if let ast = node.children {
            self.visit_expression(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_program(_ node: javaast_program) {
        self.visit_node(node)

        for ast in node.children {
            self.visit_statement(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_receiver_parameter(_ node: javaast_receiver_parameter) {
        self.visit_node(node)

        for ast in node.children {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_record_declaration(_ node: javaast_record_declaration) {
        self.visit_node(node)

        if let ast = node.body {
            self.visit_class_body(ast)
        }

        if let ast = node.name {
            self.visit_identifier(ast)
        }

        if let ast = node.parameters {
            self.visit_formal_parameters(ast)
        }

        if let ast = node.children {
            self.visit_modifiers(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_requires_modifier(_ node: javaast_requires_modifier) {
        self.visit_node(node)

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_resource(_ node: javaast_resource) {
        self.visit_node(node)

        if let ast = node.dimensions {
            self.visit_dimensions(ast)
        }

        if let ast = node.name {
            self.visit_identifier(ast)
        }

        if let ast = node.type {
            self.visit__unannotated_type(ast)
        }

        if let ast = node.value {
            self.visit_expression(ast)
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

    func visit_resource_specification(_ node: javaast_resource_specification) {
        self.visit_node(node)

        for ast in node.children {
            self.visit_resource(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_return_statement(_ node: javaast_return_statement) {
        self.visit_node(node)

        if let ast = node.children {
            self.visit_expression(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_scoped_identifier(_ node: javaast_scoped_identifier) {
        self.visit_node(node)

        if let ast = node.name {
            self.visit_identifier(ast)
        }

        if let ast = node.scope {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_scoped_type_identifier(_ node: javaast_scoped_type_identifier) {
        self.visit_node(node)

        for ast in node.children {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_spread_parameter(_ node: javaast_spread_parameter) {
        self.visit_node(node)

        for ast in node.children {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_static_initializer(_ node: javaast_static_initializer) {
        self.visit_node(node)

        if let ast = node.children {
            self.visit_block(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_string_literal(_ node: javaast_string_literal) {
        self.visit_node(node)

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_super(_ node: javaast_super) {
        self.visit_node(node)

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_super_interfaces(_ node: javaast_super_interfaces) {
        self.visit_node(node)

        if let ast = node.children {
            self.visit_interface_type_list(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_superclass(_ node: javaast_superclass) {
        self.visit_node(node)

        if let ast = node.children {
            self.visit__type(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_switch_block(_ node: javaast_switch_block) {
        self.visit_node(node)

        for ast in node.children {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_switch_label(_ node: javaast_switch_label) {
        self.visit_node(node)

        if let ast = node.children {
            self.visit_expression(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_switch_statement(_ node: javaast_switch_statement) {
        self.visit_node(node)

        if let ast = node.body {
            self.visit_switch_block(ast)
        }

        if let ast = node.condition {
            self.visit_parenthesized_expression(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_synchronized_statement(_ node: javaast_synchronized_statement) {
        self.visit_node(node)

        if let ast = node.body {
            self.visit_block(ast)
        }

        if let ast = node.children {
            self.visit_parenthesized_expression(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_ternary_expression(_ node: javaast_ternary_expression) {
        self.visit_node(node)

        if let ast = node.alternative {
            self.visit_expression(ast)
        }

        if let ast = node.condition {
            self.visit_expression(ast)
        }

        if let ast = node.consequence {
            self.visit_expression(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_this(_ node: javaast_this) {
        self.visit_node(node)

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_throw_statement(_ node: javaast_throw_statement) {
        self.visit_node(node)

        if let ast = node.children {
            self.visit_expression(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_throws(_ node: javaast_throws) {
        self.visit_node(node)

        for ast in node.children {
            self.visit__type(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_true(_ node: javaast_true) {
        self.visit_node(node)

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_try_statement(_ node: javaast_try_statement) {
        self.visit_node(node)

        if let ast = node.body {
            self.visit_block(ast)
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

    func visit_try_with_resources_statement(_ node: javaast_try_with_resources_statement) {
        self.visit_node(node)

        if let ast = node.body {
            self.visit_block(ast)
        }

        if let ast = node.resources {
            self.visit_resource_specification(ast)
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

    func visit_type_arguments(_ node: javaast_type_arguments) {
        self.visit_node(node)

        for ast in node.children {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_type_bound(_ node: javaast_type_bound) {
        self.visit_node(node)

        for ast in node.children {
            self.visit__type(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_type_identifier(_ node: javaast_type_identifier) {
        self.visit_node(node)

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_type_parameter(_ node: javaast_type_parameter) {
        self.visit_node(node)

        for ast in node.children {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_type_parameters(_ node: javaast_type_parameters) {
        self.visit_node(node)

        for ast in node.children {
            self.visit_type_parameter(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_unary_expression(_ node: javaast_unary_expression) {
        self.visit_node(node)

        if let ast = node.operand {
            self.visit_expression(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_update_expression(_ node: javaast_update_expression) {
        self.visit_node(node)

        if let ast = node.children {
            self.visit_expression(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_variable_declarator(_ node: javaast_variable_declarator) {
        self.visit_node(node)

        if let ast = node.dimensions {
            self.visit_dimensions(ast)
        }

        if let ast = node.name {
            self.visit_identifier(ast)
        }

        if let ast = node.value {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_void_type(_ node: javaast_void_type) {
        self.visit_node(node)

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_while_statement(_ node: javaast_while_statement) {
        self.visit_node(node)

        if let ast = node.body {
            self.visit_statement(ast)
        }

        if let ast = node.condition {
            self.visit_parenthesized_expression(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

    func visit_wildcard(_ node: javaast_wildcard) {
        self.visit_node(node)

        for ast in node.children {
            self.visit_ast(ast)
        }

        if self.handleError {
            for node in node.errors {
                self.visit_ast(node)
            }
        }
    }

}
