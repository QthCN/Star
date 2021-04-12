// This file is auto-generated from ts2st_JavaAST_20210411145127

import Foundation
import SwiftTreeSitter
import Common

extension JavaParser {

    func handle_common(_ node: JavaAST, _ cursor: TreeCursor) -> Bool {
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
                node.comments.append(javaast_comment(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: node))
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

    func transform(_ tree: Tree) -> JavaAST? {
        let cursor = tree.rootNode.walk()
        return transform_program(cursor, nil)
    }

    func transform_error(_ cursor: TreeCursor, _ parent: AST?) -> [JavaAST] {
        var nodes: [JavaAST] = []
        if cursor.gotoFirstChild() {
            repeat {
                switch cursor.node.kind {
                case "annotated_type":
                    if let node = self.transform_annotated_type(cursor, parent) {
                        nodes.append(node)
                    }
                case "annotation":
                    if let node = self.transform_annotation(cursor, parent) {
                        nodes.append(node)
                    }
                case "annotation_argument_list":
                    if let node = self.transform_annotation_argument_list(cursor, parent) {
                        nodes.append(node)
                    }
                case "annotation_type_body":
                    if let node = self.transform_annotation_type_body(cursor, parent) {
                        nodes.append(node)
                    }
                case "annotation_type_declaration":
                    if let node = self.transform_annotation_type_declaration(cursor, parent) {
                        nodes.append(node)
                    }
                case "annotation_type_element_declaration":
                    if let node = self.transform_annotation_type_element_declaration(cursor, parent) {
                        nodes.append(node)
                    }
                case "argument_list":
                    if let node = self.transform_argument_list(cursor, parent) {
                        nodes.append(node)
                    }
                case "array_access":
                    if let node = self.transform_array_access(cursor, parent) {
                        nodes.append(node)
                    }
                case "array_creation_expression":
                    if let node = self.transform_array_creation_expression(cursor, parent) {
                        nodes.append(node)
                    }
                case "array_initializer":
                    if let node = self.transform_array_initializer(cursor, parent) {
                        nodes.append(node)
                    }
                case "array_type":
                    if let node = self.transform_array_type(cursor, parent) {
                        nodes.append(node)
                    }
                case "assert_statement":
                    if let node = self.transform_assert_statement(cursor, parent) {
                        nodes.append(node)
                    }
                case "assignment_expression":
                    if let node = self.transform_assignment_expression(cursor, parent) {
                        nodes.append(node)
                    }
                case "asterisk":
                    if let node = self.transform_asterisk(cursor, parent) {
                        nodes.append(node)
                    }
                case "binary_expression":
                    if let node = self.transform_binary_expression(cursor, parent) {
                        nodes.append(node)
                    }
                case "binary_integer_literal":
                    if let node = self.transform_binary_integer_literal(cursor, parent) {
                        nodes.append(node)
                    }
                case "block":
                    if let node = self.transform_block(cursor, parent) {
                        nodes.append(node)
                    }
                case "boolean_type":
                    if let node = self.transform_boolean_type(cursor, parent) {
                        nodes.append(node)
                    }
                case "break_statement":
                    if let node = self.transform_break_statement(cursor, parent) {
                        nodes.append(node)
                    }
                case "cast_expression":
                    if let node = self.transform_cast_expression(cursor, parent) {
                        nodes.append(node)
                    }
                case "catch_clause":
                    if let node = self.transform_catch_clause(cursor, parent) {
                        nodes.append(node)
                    }
                case "catch_formal_parameter":
                    if let node = self.transform_catch_formal_parameter(cursor, parent) {
                        nodes.append(node)
                    }
                case "catch_type":
                    if let node = self.transform_catch_type(cursor, parent) {
                        nodes.append(node)
                    }
                case "character_literal":
                    if let node = self.transform_character_literal(cursor, parent) {
                        nodes.append(node)
                    }
                case "class_body":
                    if let node = self.transform_class_body(cursor, parent) {
                        nodes.append(node)
                    }
                case "class_declaration":
                    if let node = self.transform_class_declaration(cursor, parent) {
                        nodes.append(node)
                    }
                case "class_literal":
                    if let node = self.transform_class_literal(cursor, parent) {
                        nodes.append(node)
                    }
                case "comment":
                    if let node = self.transform_comment(cursor, parent) {
                        nodes.append(node)
                    }
                case "constant_declaration":
                    if let node = self.transform_constant_declaration(cursor, parent) {
                        nodes.append(node)
                    }
                case "constructor_body":
                    if let node = self.transform_constructor_body(cursor, parent) {
                        nodes.append(node)
                    }
                case "constructor_declaration":
                    if let node = self.transform_constructor_declaration(cursor, parent) {
                        nodes.append(node)
                    }
                case "continue_statement":
                    if let node = self.transform_continue_statement(cursor, parent) {
                        nodes.append(node)
                    }
                case "decimal_floating_point_literal":
                    if let node = self.transform_decimal_floating_point_literal(cursor, parent) {
                        nodes.append(node)
                    }
                case "decimal_integer_literal":
                    if let node = self.transform_decimal_integer_literal(cursor, parent) {
                        nodes.append(node)
                    }
                case "dimensions":
                    if let node = self.transform_dimensions(cursor, parent) {
                        nodes.append(node)
                    }
                case "dimensions_expr":
                    if let node = self.transform_dimensions_expr(cursor, parent) {
                        nodes.append(node)
                    }
                case "do_statement":
                    if let node = self.transform_do_statement(cursor, parent) {
                        nodes.append(node)
                    }
                case "element_value_array_initializer":
                    if let node = self.transform_element_value_array_initializer(cursor, parent) {
                        nodes.append(node)
                    }
                case "element_value_pair":
                    if let node = self.transform_element_value_pair(cursor, parent) {
                        nodes.append(node)
                    }
                case "enhanced_for_statement":
                    if let node = self.transform_enhanced_for_statement(cursor, parent) {
                        nodes.append(node)
                    }
                case "enum_body":
                    if let node = self.transform_enum_body(cursor, parent) {
                        nodes.append(node)
                    }
                case "enum_body_declarations":
                    if let node = self.transform_enum_body_declarations(cursor, parent) {
                        nodes.append(node)
                    }
                case "enum_constant":
                    if let node = self.transform_enum_constant(cursor, parent) {
                        nodes.append(node)
                    }
                case "enum_declaration":
                    if let node = self.transform_enum_declaration(cursor, parent) {
                        nodes.append(node)
                    }
                case "explicit_constructor_invocation":
                    if let node = self.transform_explicit_constructor_invocation(cursor, parent) {
                        nodes.append(node)
                    }
                case "expression_statement":
                    if let node = self.transform_expression_statement(cursor, parent) {
                        nodes.append(node)
                    }
                case "extends_interfaces":
                    if let node = self.transform_extends_interfaces(cursor, parent) {
                        nodes.append(node)
                    }
                case "false":
                    if let node = self.transform_false(cursor, parent) {
                        nodes.append(node)
                    }
                case "field_access":
                    if let node = self.transform_field_access(cursor, parent) {
                        nodes.append(node)
                    }
                case "field_declaration":
                    if let node = self.transform_field_declaration(cursor, parent) {
                        nodes.append(node)
                    }
                case "finally_clause":
                    if let node = self.transform_finally_clause(cursor, parent) {
                        nodes.append(node)
                    }
                case "floating_point_type":
                    if let node = self.transform_floating_point_type(cursor, parent) {
                        nodes.append(node)
                    }
                case "for_statement":
                    if let node = self.transform_for_statement(cursor, parent) {
                        nodes.append(node)
                    }
                case "formal_parameter":
                    if let node = self.transform_formal_parameter(cursor, parent) {
                        nodes.append(node)
                    }
                case "formal_parameters":
                    if let node = self.transform_formal_parameters(cursor, parent) {
                        nodes.append(node)
                    }
                case "generic_type":
                    if let node = self.transform_generic_type(cursor, parent) {
                        nodes.append(node)
                    }
                case "hex_floating_point_literal":
                    if let node = self.transform_hex_floating_point_literal(cursor, parent) {
                        nodes.append(node)
                    }
                case "hex_integer_literal":
                    if let node = self.transform_hex_integer_literal(cursor, parent) {
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
                case "import_declaration":
                    if let node = self.transform_import_declaration(cursor, parent) {
                        nodes.append(node)
                    }
                case "inferred_parameters":
                    if let node = self.transform_inferred_parameters(cursor, parent) {
                        nodes.append(node)
                    }
                case "instanceof_expression":
                    if let node = self.transform_instanceof_expression(cursor, parent) {
                        nodes.append(node)
                    }
                case "integral_type":
                    if let node = self.transform_integral_type(cursor, parent) {
                        nodes.append(node)
                    }
                case "interface_body":
                    if let node = self.transform_interface_body(cursor, parent) {
                        nodes.append(node)
                    }
                case "interface_declaration":
                    if let node = self.transform_interface_declaration(cursor, parent) {
                        nodes.append(node)
                    }
                case "interface_type_list":
                    if let node = self.transform_interface_type_list(cursor, parent) {
                        nodes.append(node)
                    }
                case "labeled_statement":
                    if let node = self.transform_labeled_statement(cursor, parent) {
                        nodes.append(node)
                    }
                case "lambda_expression":
                    if let node = self.transform_lambda_expression(cursor, parent) {
                        nodes.append(node)
                    }
                case "local_variable_declaration":
                    if let node = self.transform_local_variable_declaration(cursor, parent) {
                        nodes.append(node)
                    }
                case "marker_annotation":
                    if let node = self.transform_marker_annotation(cursor, parent) {
                        nodes.append(node)
                    }
                case "method_declaration":
                    if let node = self.transform_method_declaration(cursor, parent) {
                        nodes.append(node)
                    }
                case "method_invocation":
                    if let node = self.transform_method_invocation(cursor, parent) {
                        nodes.append(node)
                    }
                case "method_reference":
                    if let node = self.transform_method_reference(cursor, parent) {
                        nodes.append(node)
                    }
                case "modifiers":
                    if let node = self.transform_modifiers(cursor, parent) {
                        nodes.append(node)
                    }
                case "module_body":
                    if let node = self.transform_module_body(cursor, parent) {
                        nodes.append(node)
                    }
                case "module_declaration":
                    if let node = self.transform_module_declaration(cursor, parent) {
                        nodes.append(node)
                    }
                case "module_directive":
                    if let node = self.transform_module_directive(cursor, parent) {
                        nodes.append(node)
                    }
                case "null_literal":
                    if let node = self.transform_null_literal(cursor, parent) {
                        nodes.append(node)
                    }
                case "object_creation_expression":
                    if let node = self.transform_object_creation_expression(cursor, parent) {
                        nodes.append(node)
                    }
                case "octal_integer_literal":
                    if let node = self.transform_octal_integer_literal(cursor, parent) {
                        nodes.append(node)
                    }
                case "package_declaration":
                    if let node = self.transform_package_declaration(cursor, parent) {
                        nodes.append(node)
                    }
                case "parenthesized_expression":
                    if let node = self.transform_parenthesized_expression(cursor, parent) {
                        nodes.append(node)
                    }
                case "program":
                    if let node = self.transform_program(cursor, parent) {
                        nodes.append(node)
                    }
                case "receiver_parameter":
                    if let node = self.transform_receiver_parameter(cursor, parent) {
                        nodes.append(node)
                    }
                case "record_declaration":
                    if let node = self.transform_record_declaration(cursor, parent) {
                        nodes.append(node)
                    }
                case "requires_modifier":
                    if let node = self.transform_requires_modifier(cursor, parent) {
                        nodes.append(node)
                    }
                case "resource":
                    if let node = self.transform_resource(cursor, parent) {
                        nodes.append(node)
                    }
                case "resource_specification":
                    if let node = self.transform_resource_specification(cursor, parent) {
                        nodes.append(node)
                    }
                case "return_statement":
                    if let node = self.transform_return_statement(cursor, parent) {
                        nodes.append(node)
                    }
                case "scoped_identifier":
                    if let node = self.transform_scoped_identifier(cursor, parent) {
                        nodes.append(node)
                    }
                case "scoped_type_identifier":
                    if let node = self.transform_scoped_type_identifier(cursor, parent) {
                        nodes.append(node)
                    }
                case "spread_parameter":
                    if let node = self.transform_spread_parameter(cursor, parent) {
                        nodes.append(node)
                    }
                case "static_initializer":
                    if let node = self.transform_static_initializer(cursor, parent) {
                        nodes.append(node)
                    }
                case "string_literal":
                    if let node = self.transform_string_literal(cursor, parent) {
                        nodes.append(node)
                    }
                case "super":
                    if let node = self.transform_super(cursor, parent) {
                        nodes.append(node)
                    }
                case "super_interfaces":
                    if let node = self.transform_super_interfaces(cursor, parent) {
                        nodes.append(node)
                    }
                case "superclass":
                    if let node = self.transform_superclass(cursor, parent) {
                        nodes.append(node)
                    }
                case "switch_block":
                    if let node = self.transform_switch_block(cursor, parent) {
                        nodes.append(node)
                    }
                case "switch_label":
                    if let node = self.transform_switch_label(cursor, parent) {
                        nodes.append(node)
                    }
                case "switch_statement":
                    if let node = self.transform_switch_statement(cursor, parent) {
                        nodes.append(node)
                    }
                case "synchronized_statement":
                    if let node = self.transform_synchronized_statement(cursor, parent) {
                        nodes.append(node)
                    }
                case "ternary_expression":
                    if let node = self.transform_ternary_expression(cursor, parent) {
                        nodes.append(node)
                    }
                case "this":
                    if let node = self.transform_this(cursor, parent) {
                        nodes.append(node)
                    }
                case "throw_statement":
                    if let node = self.transform_throw_statement(cursor, parent) {
                        nodes.append(node)
                    }
                case "throws":
                    if let node = self.transform_throws(cursor, parent) {
                        nodes.append(node)
                    }
                case "true":
                    if let node = self.transform_true(cursor, parent) {
                        nodes.append(node)
                    }
                case "try_statement":
                    if let node = self.transform_try_statement(cursor, parent) {
                        nodes.append(node)
                    }
                case "try_with_resources_statement":
                    if let node = self.transform_try_with_resources_statement(cursor, parent) {
                        nodes.append(node)
                    }
                case "type_arguments":
                    if let node = self.transform_type_arguments(cursor, parent) {
                        nodes.append(node)
                    }
                case "type_bound":
                    if let node = self.transform_type_bound(cursor, parent) {
                        nodes.append(node)
                    }
                case "type_identifier":
                    if let node = self.transform_type_identifier(cursor, parent) {
                        nodes.append(node)
                    }
                case "type_parameter":
                    if let node = self.transform_type_parameter(cursor, parent) {
                        nodes.append(node)
                    }
                case "type_parameters":
                    if let node = self.transform_type_parameters(cursor, parent) {
                        nodes.append(node)
                    }
                case "unary_expression":
                    if let node = self.transform_unary_expression(cursor, parent) {
                        nodes.append(node)
                    }
                case "update_expression":
                    if let node = self.transform_update_expression(cursor, parent) {
                        nodes.append(node)
                    }
                case "variable_declarator":
                    if let node = self.transform_variable_declarator(cursor, parent) {
                        nodes.append(node)
                    }
                case "void_type":
                    if let node = self.transform_void_type(cursor, parent) {
                        nodes.append(node)
                    }
                case "while_statement":
                    if let node = self.transform_while_statement(cursor, parent) {
                        nodes.append(node)
                    }
                case "wildcard":
                    if let node = self.transform_wildcard(cursor, parent) {
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

    func transform__literal(_ cursor: TreeCursor, _ parent: AST?) -> javaast__literal? {
        var node: javaast__literal? = nil
        switch cursor.node.kind {
        case "binary_integer_literal":
            node = self.transform_binary_integer_literal(cursor, parent)
        case "character_literal":
            node = self.transform_character_literal(cursor, parent)
        case "decimal_floating_point_literal":
            node = self.transform_decimal_floating_point_literal(cursor, parent)
        case "decimal_integer_literal":
            node = self.transform_decimal_integer_literal(cursor, parent)
        case "false":
            node = self.transform_false(cursor, parent)
        case "hex_floating_point_literal":
            node = self.transform_hex_floating_point_literal(cursor, parent)
        case "hex_integer_literal":
            node = self.transform_hex_integer_literal(cursor, parent)
        case "null_literal":
            node = self.transform_null_literal(cursor, parent)
        case "octal_integer_literal":
            node = self.transform_octal_integer_literal(cursor, parent)
        case "string_literal":
            node = self.transform_string_literal(cursor, parent)
        case "true":
            node = self.transform_true(cursor, parent)
        default:
            print("invalid subtype in supertype: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
        }
        return node
    }

    func transform__simple_type(_ cursor: TreeCursor, _ parent: AST?) -> javaast__simple_type? {
        var node: javaast__simple_type? = nil
        switch cursor.node.kind {
        case "boolean_type":
            node = self.transform_boolean_type(cursor, parent)
        case "floating_point_type":
            node = self.transform_floating_point_type(cursor, parent)
        case "generic_type":
            node = self.transform_generic_type(cursor, parent)
        case "integral_type":
            node = self.transform_integral_type(cursor, parent)
        case "scoped_type_identifier":
            node = self.transform_scoped_type_identifier(cursor, parent)
        case "type_identifier":
            node = self.transform_type_identifier(cursor, parent)
        case "void_type":
            node = self.transform_void_type(cursor, parent)
        default:
            print("invalid subtype in supertype: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
        }
        return node
    }

    func transform__type(_ cursor: TreeCursor, _ parent: AST?) -> javaast__type? {
        var node: javaast__type? = nil
        switch cursor.node.kind {
        case "boolean_type", "floating_point_type", "generic_type", "integral_type", "scoped_type_identifier", "type_identifier", "void_type":
            node = self.transform__simple_type(cursor, parent)
        case "array_type":
            node = self.transform__unannotated_type(cursor, parent)
        case "annotated_type":
            node = self.transform_annotated_type(cursor, parent)
        default:
            print("invalid subtype in supertype: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
        }
        return node
    }

    func transform__unannotated_type(_ cursor: TreeCursor, _ parent: AST?) -> javaast__unannotated_type? {
        var node: javaast__unannotated_type? = nil
        switch cursor.node.kind {
        case "boolean_type", "floating_point_type", "generic_type", "integral_type", "scoped_type_identifier", "type_identifier", "void_type":
            node = self.transform__simple_type(cursor, parent)
        case "array_type":
            node = self.transform_array_type(cursor, parent)
        default:
            print("invalid subtype in supertype: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
        }
        return node
    }

    func transform_annotated_type(_ cursor: TreeCursor, _ parent: AST?) -> javaast_annotated_type? {
        self.enter_annotated_type()
        let node = javaast_annotated_type(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "boolean_type", "floating_point_type", "generic_type", "integral_type", "scoped_type_identifier", "type_identifier", "void_type":
                        if let child = self.transform__simple_type(cursor, node) {
                            node.children.append(child)
                        }
                    case "array_type":
                        if let child = self.transform__unannotated_type(cursor, node) {
                            node.children.append(child)
                        }
                    case "annotation":
                        if let child = self.transform_annotation(cursor, node) {
                            node.children.append(child)
                        }
                    case "marker_annotation":
                        if let child = self.transform_marker_annotation(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_annotated_type(node)
        return node
    }

    func transform_annotation(_ cursor: TreeCursor, _ parent: AST?) -> javaast_annotation? {
        self.enter_annotation()
        let node = javaast_annotation(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "arguments":
                    switch cursor.node.kind {
                    case "annotation_argument_list":
                        node.arguments = self.transform_annotation_argument_list(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "name":
                    switch cursor.node.kind {
                    case "identifier":
                        node.name = self.transform_identifier(cursor, node)
                    case "scoped_identifier":
                        node.name = self.transform_scoped_identifier(cursor, node)
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
        self.leave_annotation(node)
        return node
    }

    func transform_annotation_argument_list(_ cursor: TreeCursor, _ parent: AST?) -> javaast_annotation_argument_list? {
        self.enter_annotation_argument_list()
        let node = javaast_annotation_argument_list(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "annotation":
                        if let child = self.transform_annotation(cursor, node) {
                            node.children.append(child)
                        }
                    case "element_value_array_initializer":
                        if let child = self.transform_element_value_array_initializer(cursor, node) {
                            node.children.append(child)
                        }
                    case "element_value_pair":
                        if let child = self.transform_element_value_pair(cursor, node) {
                            node.children.append(child)
                        }
                    case "binary_integer_literal", "character_literal", "decimal_floating_point_literal", "decimal_integer_literal", "false", "hex_floating_point_literal", "hex_integer_literal", "null_literal", "octal_integer_literal", "string_literal", "true":
                        if let child = self.transform__literal(cursor, node) {
                            node.children.append(child)
                        }
                    case "array_access", "array_creation_expression", "class_literal", "field_access", "identifier", "method_invocation", "method_reference", "object_creation_expression", "parenthesized_expression", "this":
                        if let child = self.transform_primary_expression(cursor, node) {
                            node.children.append(child)
                        }
                    case "assignment_expression", "binary_expression", "cast_expression", "instanceof_expression", "lambda_expression", "ternary_expression", "unary_expression", "update_expression":
                        if let child = self.transform_expression(cursor, node) {
                            node.children.append(child)
                        }
                    case "marker_annotation":
                        if let child = self.transform_marker_annotation(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_annotation_argument_list(node)
        return node
    }

    func transform_annotation_type_body(_ cursor: TreeCursor, _ parent: AST?) -> javaast_annotation_type_body? {
        self.enter_annotation_type_body()
        let node = javaast_annotation_type_body(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "annotation_type_declaration":
                        if let child = self.transform_annotation_type_declaration(cursor, node) {
                            node.children.append(child)
                        }
                    case "annotation_type_element_declaration":
                        if let child = self.transform_annotation_type_element_declaration(cursor, node) {
                            node.children.append(child)
                        }
                    case "class_declaration":
                        if let child = self.transform_class_declaration(cursor, node) {
                            node.children.append(child)
                        }
                    case "constant_declaration":
                        if let child = self.transform_constant_declaration(cursor, node) {
                            node.children.append(child)
                        }
                    case "interface_declaration":
                        if let child = self.transform_interface_declaration(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_annotation_type_body(node)
        return node
    }

    func transform_annotation_type_declaration(_ cursor: TreeCursor, _ parent: AST?) -> javaast_annotation_type_declaration? {
        self.enter_annotation_type_declaration()
        let node = javaast_annotation_type_declaration(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "body":
                    switch cursor.node.kind {
                    case "annotation_type_body":
                        node.body = self.transform_annotation_type_body(cursor, node)
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
                default:
                    switch cursor.node.kind {
                    case "modifiers":
                        if let child = self.transform_modifiers(cursor, node) {
                            node.children = child
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_annotation_type_declaration(node)
        return node
    }

    func transform_annotation_type_element_declaration(_ cursor: TreeCursor, _ parent: AST?) -> javaast_annotation_type_element_declaration? {
        self.enter_annotation_type_element_declaration()
        let node = javaast_annotation_type_element_declaration(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "dimensions":
                    switch cursor.node.kind {
                    case "dimensions":
                        node.dimensions = self.transform_dimensions(cursor, node)
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
                case "type":
                    switch cursor.node.kind {
                    case "boolean_type", "floating_point_type", "generic_type", "integral_type", "scoped_type_identifier", "type_identifier", "void_type":
                        node.type = self.transform__simple_type(cursor, node)
                    case "array_type":
                        node.type = self.transform__unannotated_type(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "value":
                    switch cursor.node.kind {
                    case "annotation":
                        node.value = self.transform_annotation(cursor, node)
                    case "element_value_array_initializer":
                        node.value = self.transform_element_value_array_initializer(cursor, node)
                    case "binary_integer_literal", "character_literal", "decimal_floating_point_literal", "decimal_integer_literal", "false", "hex_floating_point_literal", "hex_integer_literal", "null_literal", "octal_integer_literal", "string_literal", "true":
                        node.value = self.transform__literal(cursor, node)
                    case "array_access", "array_creation_expression", "class_literal", "field_access", "identifier", "method_invocation", "method_reference", "object_creation_expression", "parenthesized_expression", "this":
                        node.value = self.transform_primary_expression(cursor, node)
                    case "assignment_expression", "binary_expression", "cast_expression", "instanceof_expression", "lambda_expression", "ternary_expression", "unary_expression", "update_expression":
                        node.value = self.transform_expression(cursor, node)
                    case "marker_annotation":
                        node.value = self.transform_marker_annotation(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    case "modifiers":
                        if let child = self.transform_modifiers(cursor, node) {
                            node.children = child
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_annotation_type_element_declaration(node)
        return node
    }

    func transform_argument_list(_ cursor: TreeCursor, _ parent: AST?) -> javaast_argument_list? {
        self.enter_argument_list()
        let node = javaast_argument_list(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "binary_integer_literal", "character_literal", "decimal_floating_point_literal", "decimal_integer_literal", "false", "hex_floating_point_literal", "hex_integer_literal", "null_literal", "octal_integer_literal", "string_literal", "true":
                        if let child = self.transform__literal(cursor, node) {
                            node.children.append(child)
                        }
                    case "array_access", "array_creation_expression", "class_literal", "field_access", "identifier", "method_invocation", "method_reference", "object_creation_expression", "parenthesized_expression", "this":
                        if let child = self.transform_primary_expression(cursor, node) {
                            node.children.append(child)
                        }
                    case "assignment_expression", "binary_expression", "cast_expression", "instanceof_expression", "lambda_expression", "ternary_expression", "unary_expression", "update_expression":
                        if let child = self.transform_expression(cursor, node) {
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

    func transform_array_access(_ cursor: TreeCursor, _ parent: AST?) -> javaast_array_access? {
        self.enter_array_access()
        let node = javaast_array_access(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "array":
                    switch cursor.node.kind {
                    case "binary_integer_literal", "character_literal", "decimal_floating_point_literal", "decimal_integer_literal", "false", "hex_floating_point_literal", "hex_integer_literal", "null_literal", "octal_integer_literal", "string_literal", "true":
                        node.array = self.transform__literal(cursor, node)
                    case "array_access", "array_creation_expression", "class_literal", "field_access", "identifier", "method_invocation", "method_reference", "object_creation_expression", "parenthesized_expression", "this":
                        node.array = self.transform_primary_expression(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "index":
                    switch cursor.node.kind {
                    case "binary_integer_literal", "character_literal", "decimal_floating_point_literal", "decimal_integer_literal", "false", "hex_floating_point_literal", "hex_integer_literal", "null_literal", "octal_integer_literal", "string_literal", "true":
                        node.index = self.transform__literal(cursor, node)
                    case "array_access", "array_creation_expression", "class_literal", "field_access", "identifier", "method_invocation", "method_reference", "object_creation_expression", "parenthesized_expression", "this":
                        node.index = self.transform_primary_expression(cursor, node)
                    case "assignment_expression", "binary_expression", "cast_expression", "instanceof_expression", "lambda_expression", "ternary_expression", "unary_expression", "update_expression":
                        node.index = self.transform_expression(cursor, node)
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
        self.leave_array_access(node)
        return node
    }

    func transform_array_creation_expression(_ cursor: TreeCursor, _ parent: AST?) -> javaast_array_creation_expression? {
        self.enter_array_creation_expression()
        let node = javaast_array_creation_expression(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "dimensions":
                    switch cursor.node.kind {
                    case "dimensions":
                        if let child = self.transform_dimensions(cursor, node) {
                            node.dimensions.append(child)
                        }
                    case "dimensions_expr":
                        if let child = self.transform_dimensions_expr(cursor, node) {
                            node.dimensions.append(child)
                        }
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "type":
                    switch cursor.node.kind {
                    case "boolean_type", "floating_point_type", "generic_type", "integral_type", "scoped_type_identifier", "type_identifier", "void_type":
                        node.type = self.transform__simple_type(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "value":
                    switch cursor.node.kind {
                    case "array_initializer":
                        node.value = self.transform_array_initializer(cursor, node)
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
        self.leave_array_creation_expression(node)
        return node
    }

    func transform_array_initializer(_ cursor: TreeCursor, _ parent: AST?) -> javaast_array_initializer? {
        self.enter_array_initializer()
        let node = javaast_array_initializer(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "array_initializer":
                        if let child = self.transform_array_initializer(cursor, node) {
                            node.children.append(child)
                        }
                    case "binary_integer_literal", "character_literal", "decimal_floating_point_literal", "decimal_integer_literal", "false", "hex_floating_point_literal", "hex_integer_literal", "null_literal", "octal_integer_literal", "string_literal", "true":
                        if let child = self.transform__literal(cursor, node) {
                            node.children.append(child)
                        }
                    case "array_access", "array_creation_expression", "class_literal", "field_access", "identifier", "method_invocation", "method_reference", "object_creation_expression", "parenthesized_expression", "this":
                        if let child = self.transform_primary_expression(cursor, node) {
                            node.children.append(child)
                        }
                    case "assignment_expression", "binary_expression", "cast_expression", "instanceof_expression", "lambda_expression", "ternary_expression", "unary_expression", "update_expression":
                        if let child = self.transform_expression(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_array_initializer(node)
        return node
    }

    func transform_array_type(_ cursor: TreeCursor, _ parent: AST?) -> javaast_array_type? {
        self.enter_array_type()
        let node = javaast_array_type(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "dimensions":
                    switch cursor.node.kind {
                    case "dimensions":
                        node.dimensions = self.transform_dimensions(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "element":
                    switch cursor.node.kind {
                    case "boolean_type", "floating_point_type", "generic_type", "integral_type", "scoped_type_identifier", "type_identifier", "void_type":
                        node.element = self.transform__simple_type(cursor, node)
                    case "array_type":
                        node.element = self.transform__unannotated_type(cursor, node)
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

    func transform_assert_statement(_ cursor: TreeCursor, _ parent: AST?) -> javaast_assert_statement? {
        self.enter_assert_statement()
        let node = javaast_assert_statement(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "binary_integer_literal", "character_literal", "decimal_floating_point_literal", "decimal_integer_literal", "false", "hex_floating_point_literal", "hex_integer_literal", "null_literal", "octal_integer_literal", "string_literal", "true":
                        if let child = self.transform__literal(cursor, node) {
                            node.children.append(child)
                        }
                    case "array_access", "array_creation_expression", "class_literal", "field_access", "identifier", "method_invocation", "method_reference", "object_creation_expression", "parenthesized_expression", "this":
                        if let child = self.transform_primary_expression(cursor, node) {
                            node.children.append(child)
                        }
                    case "assignment_expression", "binary_expression", "cast_expression", "instanceof_expression", "lambda_expression", "ternary_expression", "unary_expression", "update_expression":
                        if let child = self.transform_expression(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_assert_statement(node)
        return node
    }

    func transform_assignment_expression(_ cursor: TreeCursor, _ parent: AST?) -> javaast_assignment_expression? {
        self.enter_assignment_expression()
        let node = javaast_assignment_expression(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "left":
                    switch cursor.node.kind {
                    case "array_access":
                        node.left = self.transform_array_access(cursor, node)
                    case "field_access":
                        node.left = self.transform_field_access(cursor, node)
                    case "identifier":
                        node.left = self.transform_identifier(cursor, node)
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
                    case "binary_integer_literal", "character_literal", "decimal_floating_point_literal", "decimal_integer_literal", "false", "hex_floating_point_literal", "hex_integer_literal", "null_literal", "octal_integer_literal", "string_literal", "true":
                        node.right = self.transform__literal(cursor, node)
                    case "array_access", "array_creation_expression", "class_literal", "field_access", "identifier", "method_invocation", "method_reference", "object_creation_expression", "parenthesized_expression", "this":
                        node.right = self.transform_primary_expression(cursor, node)
                    case "assignment_expression", "binary_expression", "cast_expression", "instanceof_expression", "lambda_expression", "ternary_expression", "unary_expression", "update_expression":
                        node.right = self.transform_expression(cursor, node)
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
        self.leave_assignment_expression(node)
        return node
    }

    func transform_asterisk(_ cursor: TreeCursor, _ parent: AST?) -> javaast_asterisk? {
        self.enter_asterisk()
        let node = javaast_asterisk(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_asterisk(node)
        return node
    }

    func transform_binary_expression(_ cursor: TreeCursor, _ parent: AST?) -> javaast_binary_expression? {
        self.enter_binary_expression()
        let node = javaast_binary_expression(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "left":
                    switch cursor.node.kind {
                    case "binary_integer_literal", "character_literal", "decimal_floating_point_literal", "decimal_integer_literal", "false", "hex_floating_point_literal", "hex_integer_literal", "null_literal", "octal_integer_literal", "string_literal", "true":
                        node.left = self.transform__literal(cursor, node)
                    case "array_access", "array_creation_expression", "class_literal", "field_access", "identifier", "method_invocation", "method_reference", "object_creation_expression", "parenthesized_expression", "this":
                        node.left = self.transform_primary_expression(cursor, node)
                    case "assignment_expression", "binary_expression", "cast_expression", "instanceof_expression", "lambda_expression", "ternary_expression", "unary_expression", "update_expression":
                        node.left = self.transform_expression(cursor, node)
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
                    case "binary_integer_literal", "character_literal", "decimal_floating_point_literal", "decimal_integer_literal", "false", "hex_floating_point_literal", "hex_integer_literal", "null_literal", "octal_integer_literal", "string_literal", "true":
                        node.right = self.transform__literal(cursor, node)
                    case "array_access", "array_creation_expression", "class_literal", "field_access", "identifier", "method_invocation", "method_reference", "object_creation_expression", "parenthesized_expression", "this":
                        node.right = self.transform_primary_expression(cursor, node)
                    case "assignment_expression", "binary_expression", "cast_expression", "instanceof_expression", "lambda_expression", "ternary_expression", "unary_expression", "update_expression":
                        node.right = self.transform_expression(cursor, node)
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

    func transform_binary_integer_literal(_ cursor: TreeCursor, _ parent: AST?) -> javaast_binary_integer_literal? {
        self.enter_binary_integer_literal()
        let node = javaast_binary_integer_literal(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_binary_integer_literal(node)
        return node
    }

    func transform_block(_ cursor: TreeCursor, _ parent: AST?) -> javaast_block? {
        self.enter_block()
        let node = javaast_block(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "annotation_type_declaration", "class_declaration", "enum_declaration", "import_declaration", "interface_declaration", "module_declaration", "package_declaration":
                        if let child = self.transform_declaration(cursor, node) {
                            node.children.append(child)
                        }
                    case "assert_statement", "block", "break_statement", "continue_statement", "do_statement", "enhanced_for_statement", "expression_statement", "for_statement", "if_statement", "labeled_statement", "local_variable_declaration", "return_statement", "switch_statement", "synchronized_statement", "throw_statement", "try_statement", "try_with_resources_statement", "while_statement":
                        if let child = self.transform_statement(cursor, node) {
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

    func transform_boolean_type(_ cursor: TreeCursor, _ parent: AST?) -> javaast_boolean_type? {
        self.enter_boolean_type()
        let node = javaast_boolean_type(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_boolean_type(node)
        return node
    }

    func transform_break_statement(_ cursor: TreeCursor, _ parent: AST?) -> javaast_break_statement? {
        self.enter_break_statement()
        let node = javaast_break_statement(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "identifier":
                        if let child = self.transform_identifier(cursor, node) {
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

    func transform_cast_expression(_ cursor: TreeCursor, _ parent: AST?) -> javaast_cast_expression? {
        self.enter_cast_expression()
        let node = javaast_cast_expression(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "type":
                    switch cursor.node.kind {
                    case "boolean_type", "floating_point_type", "generic_type", "integral_type", "scoped_type_identifier", "type_identifier", "void_type":
                        if let child = self.transform__simple_type(cursor, node) {
                            node.type.append(child)
                        }
                    case "array_type":
                        if let child = self.transform__unannotated_type(cursor, node) {
                            node.type.append(child)
                        }
                    case "annotated_type":
                        if let child = self.transform__type(cursor, node) {
                            node.type.append(child)
                        }
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "value":
                    switch cursor.node.kind {
                    case "binary_integer_literal", "character_literal", "decimal_floating_point_literal", "decimal_integer_literal", "false", "hex_floating_point_literal", "hex_integer_literal", "null_literal", "octal_integer_literal", "string_literal", "true":
                        node.value = self.transform__literal(cursor, node)
                    case "array_access", "array_creation_expression", "class_literal", "field_access", "identifier", "method_invocation", "method_reference", "object_creation_expression", "parenthesized_expression", "this":
                        node.value = self.transform_primary_expression(cursor, node)
                    case "assignment_expression", "binary_expression", "cast_expression", "instanceof_expression", "lambda_expression", "ternary_expression", "unary_expression", "update_expression":
                        node.value = self.transform_expression(cursor, node)
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
        self.leave_cast_expression(node)
        return node
    }

    func transform_catch_clause(_ cursor: TreeCursor, _ parent: AST?) -> javaast_catch_clause? {
        self.enter_catch_clause()
        let node = javaast_catch_clause(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
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
                    case "catch_formal_parameter":
                        if let child = self.transform_catch_formal_parameter(cursor, node) {
                            node.children = child
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_catch_clause(node)
        return node
    }

    func transform_catch_formal_parameter(_ cursor: TreeCursor, _ parent: AST?) -> javaast_catch_formal_parameter? {
        self.enter_catch_formal_parameter()
        let node = javaast_catch_formal_parameter(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "dimensions":
                    switch cursor.node.kind {
                    case "dimensions":
                        node.dimensions = self.transform_dimensions(cursor, node)
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
                default:
                    switch cursor.node.kind {
                    case "catch_type":
                        if let child = self.transform_catch_type(cursor, node) {
                            node.children.append(child)
                        }
                    case "modifiers":
                        if let child = self.transform_modifiers(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_catch_formal_parameter(node)
        return node
    }

    func transform_catch_type(_ cursor: TreeCursor, _ parent: AST?) -> javaast_catch_type? {
        self.enter_catch_type()
        let node = javaast_catch_type(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "boolean_type", "floating_point_type", "generic_type", "integral_type", "scoped_type_identifier", "type_identifier", "void_type":
                        if let child = self.transform__simple_type(cursor, node) {
                            node.children.append(child)
                        }
                    case "array_type":
                        if let child = self.transform__unannotated_type(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_catch_type(node)
        return node
    }

    func transform_character_literal(_ cursor: TreeCursor, _ parent: AST?) -> javaast_character_literal? {
        self.enter_character_literal()
        let node = javaast_character_literal(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_character_literal(node)
        return node
    }

    func transform_class_body(_ cursor: TreeCursor, _ parent: AST?) -> javaast_class_body? {
        self.enter_class_body()
        let node = javaast_class_body(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "annotation_type_declaration":
                        if let child = self.transform_annotation_type_declaration(cursor, node) {
                            node.children.append(child)
                        }
                    case "block":
                        if let child = self.transform_block(cursor, node) {
                            node.children.append(child)
                        }
                    case "class_declaration":
                        if let child = self.transform_class_declaration(cursor, node) {
                            node.children.append(child)
                        }
                    case "constructor_declaration":
                        if let child = self.transform_constructor_declaration(cursor, node) {
                            node.children.append(child)
                        }
                    case "enum_declaration":
                        if let child = self.transform_enum_declaration(cursor, node) {
                            node.children.append(child)
                        }
                    case "field_declaration":
                        if let child = self.transform_field_declaration(cursor, node) {
                            node.children.append(child)
                        }
                    case "interface_declaration":
                        if let child = self.transform_interface_declaration(cursor, node) {
                            node.children.append(child)
                        }
                    case "method_declaration":
                        if let child = self.transform_method_declaration(cursor, node) {
                            node.children.append(child)
                        }
                    case "record_declaration":
                        if let child = self.transform_record_declaration(cursor, node) {
                            node.children.append(child)
                        }
                    case "static_initializer":
                        if let child = self.transform_static_initializer(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_class_body(node)
        return node
    }

    func transform_class_declaration(_ cursor: TreeCursor, _ parent: AST?) -> javaast_class_declaration? {
        self.enter_class_declaration()
        let node = javaast_class_declaration(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "body":
                    switch cursor.node.kind {
                    case "class_body":
                        node.body = self.transform_class_body(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "interfaces":
                    switch cursor.node.kind {
                    case "super_interfaces":
                        node.interfaces = self.transform_super_interfaces(cursor, node)
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
                case "superclass":
                    switch cursor.node.kind {
                    case "superclass":
                        node.superclass = self.transform_superclass(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "type_parameters":
                    switch cursor.node.kind {
                    case "type_parameters":
                        node.type_parameters = self.transform_type_parameters(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    case "modifiers":
                        if let child = self.transform_modifiers(cursor, node) {
                            node.children = child
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_class_declaration(node)
        return node
    }

    func transform_class_literal(_ cursor: TreeCursor, _ parent: AST?) -> javaast_class_literal? {
        self.enter_class_literal()
        let node = javaast_class_literal(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "boolean_type", "floating_point_type", "generic_type", "integral_type", "scoped_type_identifier", "type_identifier", "void_type":
                        if let child = self.transform__simple_type(cursor, node) {
                            node.children = child
                        }
                    case "array_type":
                        if let child = self.transform__unannotated_type(cursor, node) {
                            node.children = child
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_class_literal(node)
        return node
    }

    func transform_comment(_ cursor: TreeCursor, _ parent: AST?) -> javaast_comment? {
        self.enter_comment()
        let node = javaast_comment(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_comment(node)
        return node
    }

    func transform_constant_declaration(_ cursor: TreeCursor, _ parent: AST?) -> javaast_constant_declaration? {
        self.enter_constant_declaration()
        let node = javaast_constant_declaration(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "declarator":
                    switch cursor.node.kind {
                    case "variable_declarator":
                        if let child = self.transform_variable_declarator(cursor, node) {
                            node.declarator.append(child)
                        }
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "type":
                    switch cursor.node.kind {
                    case "boolean_type", "floating_point_type", "generic_type", "integral_type", "scoped_type_identifier", "type_identifier", "void_type":
                        node.type = self.transform__simple_type(cursor, node)
                    case "array_type":
                        node.type = self.transform__unannotated_type(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    case "modifiers":
                        if let child = self.transform_modifiers(cursor, node) {
                            node.children = child
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_constant_declaration(node)
        return node
    }

    func transform_constructor_body(_ cursor: TreeCursor, _ parent: AST?) -> javaast_constructor_body? {
        self.enter_constructor_body()
        let node = javaast_constructor_body(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "explicit_constructor_invocation":
                        if let child = self.transform_explicit_constructor_invocation(cursor, node) {
                            node.children.append(child)
                        }
                    case "annotation_type_declaration", "class_declaration", "enum_declaration", "import_declaration", "interface_declaration", "module_declaration", "package_declaration":
                        if let child = self.transform_declaration(cursor, node) {
                            node.children.append(child)
                        }
                    case "assert_statement", "block", "break_statement", "continue_statement", "do_statement", "enhanced_for_statement", "expression_statement", "for_statement", "if_statement", "labeled_statement", "local_variable_declaration", "return_statement", "switch_statement", "synchronized_statement", "throw_statement", "try_statement", "try_with_resources_statement", "while_statement":
                        if let child = self.transform_statement(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_constructor_body(node)
        return node
    }

    func transform_constructor_declaration(_ cursor: TreeCursor, _ parent: AST?) -> javaast_constructor_declaration? {
        self.enter_constructor_declaration()
        let node = javaast_constructor_declaration(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "body":
                    switch cursor.node.kind {
                    case "constructor_body":
                        node.body = self.transform_constructor_body(cursor, node)
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
                    case "formal_parameters":
                        node.parameters = self.transform_formal_parameters(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "type_parameters":
                    switch cursor.node.kind {
                    case "type_parameters":
                        node.type_parameters = self.transform_type_parameters(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    case "modifiers":
                        if let child = self.transform_modifiers(cursor, node) {
                            node.children.append(child)
                        }
                    case "throws":
                        if let child = self.transform_throws(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_constructor_declaration(node)
        return node
    }

    func transform_continue_statement(_ cursor: TreeCursor, _ parent: AST?) -> javaast_continue_statement? {
        self.enter_continue_statement()
        let node = javaast_continue_statement(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "identifier":
                        if let child = self.transform_identifier(cursor, node) {
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

    func transform_decimal_floating_point_literal(_ cursor: TreeCursor, _ parent: AST?) -> javaast_decimal_floating_point_literal? {
        self.enter_decimal_floating_point_literal()
        let node = javaast_decimal_floating_point_literal(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_decimal_floating_point_literal(node)
        return node
    }

    func transform_decimal_integer_literal(_ cursor: TreeCursor, _ parent: AST?) -> javaast_decimal_integer_literal? {
        self.enter_decimal_integer_literal()
        let node = javaast_decimal_integer_literal(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_decimal_integer_literal(node)
        return node
    }

    func transform_declaration(_ cursor: TreeCursor, _ parent: AST?) -> javaast_declaration? {
        var node: javaast_declaration? = nil
        switch cursor.node.kind {
        case "annotation_type_declaration":
            node = self.transform_annotation_type_declaration(cursor, parent)
        case "class_declaration":
            node = self.transform_class_declaration(cursor, parent)
        case "enum_declaration":
            node = self.transform_enum_declaration(cursor, parent)
        case "import_declaration":
            node = self.transform_import_declaration(cursor, parent)
        case "interface_declaration":
            node = self.transform_interface_declaration(cursor, parent)
        case "module_declaration":
            node = self.transform_module_declaration(cursor, parent)
        case "package_declaration":
            node = self.transform_package_declaration(cursor, parent)
        default:
            print("invalid subtype in supertype: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
        }
        return node
    }

    func transform_dimensions(_ cursor: TreeCursor, _ parent: AST?) -> javaast_dimensions? {
        self.enter_dimensions()
        let node = javaast_dimensions(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "annotation":
                        if let child = self.transform_annotation(cursor, node) {
                            node.children.append(child)
                        }
                    case "marker_annotation":
                        if let child = self.transform_marker_annotation(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_dimensions(node)
        return node
    }

    func transform_dimensions_expr(_ cursor: TreeCursor, _ parent: AST?) -> javaast_dimensions_expr? {
        self.enter_dimensions_expr()
        let node = javaast_dimensions_expr(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "annotation":
                        if let child = self.transform_annotation(cursor, node) {
                            node.children.append(child)
                        }
                    case "binary_integer_literal", "character_literal", "decimal_floating_point_literal", "decimal_integer_literal", "false", "hex_floating_point_literal", "hex_integer_literal", "null_literal", "octal_integer_literal", "string_literal", "true":
                        if let child = self.transform__literal(cursor, node) {
                            node.children.append(child)
                        }
                    case "array_access", "array_creation_expression", "class_literal", "field_access", "identifier", "method_invocation", "method_reference", "object_creation_expression", "parenthesized_expression", "this":
                        if let child = self.transform_primary_expression(cursor, node) {
                            node.children.append(child)
                        }
                    case "assignment_expression", "binary_expression", "cast_expression", "instanceof_expression", "lambda_expression", "ternary_expression", "unary_expression", "update_expression":
                        if let child = self.transform_expression(cursor, node) {
                            node.children.append(child)
                        }
                    case "marker_annotation":
                        if let child = self.transform_marker_annotation(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_dimensions_expr(node)
        return node
    }

    func transform_do_statement(_ cursor: TreeCursor, _ parent: AST?) -> javaast_do_statement? {
        self.enter_do_statement()
        let node = javaast_do_statement(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "body":
                    switch cursor.node.kind {
                    case "annotation_type_declaration", "class_declaration", "enum_declaration", "import_declaration", "interface_declaration", "module_declaration", "package_declaration":
                        node.body = self.transform_declaration(cursor, node)
                    case "assert_statement", "block", "break_statement", "continue_statement", "do_statement", "enhanced_for_statement", "expression_statement", "for_statement", "if_statement", "labeled_statement", "local_variable_declaration", "return_statement", "switch_statement", "synchronized_statement", "throw_statement", "try_statement", "try_with_resources_statement", "while_statement":
                        node.body = self.transform_statement(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "condition":
                    switch cursor.node.kind {
                    case "parenthesized_expression":
                        node.condition = self.transform_parenthesized_expression(cursor, node)
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
        self.leave_do_statement(node)
        return node
    }

    func transform_element_value_array_initializer(_ cursor: TreeCursor, _ parent: AST?) -> javaast_element_value_array_initializer? {
        self.enter_element_value_array_initializer()
        let node = javaast_element_value_array_initializer(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "annotation":
                        if let child = self.transform_annotation(cursor, node) {
                            node.children.append(child)
                        }
                    case "element_value_array_initializer":
                        if let child = self.transform_element_value_array_initializer(cursor, node) {
                            node.children.append(child)
                        }
                    case "binary_integer_literal", "character_literal", "decimal_floating_point_literal", "decimal_integer_literal", "false", "hex_floating_point_literal", "hex_integer_literal", "null_literal", "octal_integer_literal", "string_literal", "true":
                        if let child = self.transform__literal(cursor, node) {
                            node.children.append(child)
                        }
                    case "array_access", "array_creation_expression", "class_literal", "field_access", "identifier", "method_invocation", "method_reference", "object_creation_expression", "parenthesized_expression", "this":
                        if let child = self.transform_primary_expression(cursor, node) {
                            node.children.append(child)
                        }
                    case "assignment_expression", "binary_expression", "cast_expression", "instanceof_expression", "lambda_expression", "ternary_expression", "unary_expression", "update_expression":
                        if let child = self.transform_expression(cursor, node) {
                            node.children.append(child)
                        }
                    case "marker_annotation":
                        if let child = self.transform_marker_annotation(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_element_value_array_initializer(node)
        return node
    }

    func transform_element_value_pair(_ cursor: TreeCursor, _ parent: AST?) -> javaast_element_value_pair? {
        self.enter_element_value_pair()
        let node = javaast_element_value_pair(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "key":
                    switch cursor.node.kind {
                    case "identifier":
                        node.key = self.transform_identifier(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "value":
                    switch cursor.node.kind {
                    case "annotation":
                        node.value = self.transform_annotation(cursor, node)
                    case "element_value_array_initializer":
                        node.value = self.transform_element_value_array_initializer(cursor, node)
                    case "binary_integer_literal", "character_literal", "decimal_floating_point_literal", "decimal_integer_literal", "false", "hex_floating_point_literal", "hex_integer_literal", "null_literal", "octal_integer_literal", "string_literal", "true":
                        node.value = self.transform__literal(cursor, node)
                    case "array_access", "array_creation_expression", "class_literal", "field_access", "identifier", "method_invocation", "method_reference", "object_creation_expression", "parenthesized_expression", "this":
                        node.value = self.transform_primary_expression(cursor, node)
                    case "assignment_expression", "binary_expression", "cast_expression", "instanceof_expression", "lambda_expression", "ternary_expression", "unary_expression", "update_expression":
                        node.value = self.transform_expression(cursor, node)
                    case "marker_annotation":
                        node.value = self.transform_marker_annotation(cursor, node)
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
        self.leave_element_value_pair(node)
        return node
    }

    func transform_enhanced_for_statement(_ cursor: TreeCursor, _ parent: AST?) -> javaast_enhanced_for_statement? {
        self.enter_enhanced_for_statement()
        let node = javaast_enhanced_for_statement(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "body":
                    switch cursor.node.kind {
                    case "annotation_type_declaration", "class_declaration", "enum_declaration", "import_declaration", "interface_declaration", "module_declaration", "package_declaration":
                        node.body = self.transform_declaration(cursor, node)
                    case "assert_statement", "block", "break_statement", "continue_statement", "do_statement", "enhanced_for_statement", "expression_statement", "for_statement", "if_statement", "labeled_statement", "local_variable_declaration", "return_statement", "switch_statement", "synchronized_statement", "throw_statement", "try_statement", "try_with_resources_statement", "while_statement":
                        node.body = self.transform_statement(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "dimensions":
                    switch cursor.node.kind {
                    case "dimensions":
                        node.dimensions = self.transform_dimensions(cursor, node)
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
                case "type":
                    switch cursor.node.kind {
                    case "boolean_type", "floating_point_type", "generic_type", "integral_type", "scoped_type_identifier", "type_identifier", "void_type":
                        node.type = self.transform__simple_type(cursor, node)
                    case "array_type":
                        node.type = self.transform__unannotated_type(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "value":
                    switch cursor.node.kind {
                    case "binary_integer_literal", "character_literal", "decimal_floating_point_literal", "decimal_integer_literal", "false", "hex_floating_point_literal", "hex_integer_literal", "null_literal", "octal_integer_literal", "string_literal", "true":
                        node.value = self.transform__literal(cursor, node)
                    case "array_access", "array_creation_expression", "class_literal", "field_access", "identifier", "method_invocation", "method_reference", "object_creation_expression", "parenthesized_expression", "this":
                        node.value = self.transform_primary_expression(cursor, node)
                    case "assignment_expression", "binary_expression", "cast_expression", "instanceof_expression", "lambda_expression", "ternary_expression", "unary_expression", "update_expression":
                        node.value = self.transform_expression(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    case "modifiers":
                        if let child = self.transform_modifiers(cursor, node) {
                            node.children = child
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_enhanced_for_statement(node)
        return node
    }

    func transform_enum_body(_ cursor: TreeCursor, _ parent: AST?) -> javaast_enum_body? {
        self.enter_enum_body()
        let node = javaast_enum_body(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "enum_body_declarations":
                        if let child = self.transform_enum_body_declarations(cursor, node) {
                            node.children.append(child)
                        }
                    case "enum_constant":
                        if let child = self.transform_enum_constant(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_enum_body(node)
        return node
    }

    func transform_enum_body_declarations(_ cursor: TreeCursor, _ parent: AST?) -> javaast_enum_body_declarations? {
        self.enter_enum_body_declarations()
        let node = javaast_enum_body_declarations(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "annotation_type_declaration":
                        if let child = self.transform_annotation_type_declaration(cursor, node) {
                            node.children.append(child)
                        }
                    case "block":
                        if let child = self.transform_block(cursor, node) {
                            node.children.append(child)
                        }
                    case "class_declaration":
                        if let child = self.transform_class_declaration(cursor, node) {
                            node.children.append(child)
                        }
                    case "constructor_declaration":
                        if let child = self.transform_constructor_declaration(cursor, node) {
                            node.children.append(child)
                        }
                    case "enum_declaration":
                        if let child = self.transform_enum_declaration(cursor, node) {
                            node.children.append(child)
                        }
                    case "field_declaration":
                        if let child = self.transform_field_declaration(cursor, node) {
                            node.children.append(child)
                        }
                    case "interface_declaration":
                        if let child = self.transform_interface_declaration(cursor, node) {
                            node.children.append(child)
                        }
                    case "method_declaration":
                        if let child = self.transform_method_declaration(cursor, node) {
                            node.children.append(child)
                        }
                    case "record_declaration":
                        if let child = self.transform_record_declaration(cursor, node) {
                            node.children.append(child)
                        }
                    case "static_initializer":
                        if let child = self.transform_static_initializer(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_enum_body_declarations(node)
        return node
    }

    func transform_enum_constant(_ cursor: TreeCursor, _ parent: AST?) -> javaast_enum_constant? {
        self.enter_enum_constant()
        let node = javaast_enum_constant(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
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
                case "body":
                    switch cursor.node.kind {
                    case "class_body":
                        node.body = self.transform_class_body(cursor, node)
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
                default:
                    switch cursor.node.kind {
                    case "modifiers":
                        if let child = self.transform_modifiers(cursor, node) {
                            node.children = child
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_enum_constant(node)
        return node
    }

    func transform_enum_declaration(_ cursor: TreeCursor, _ parent: AST?) -> javaast_enum_declaration? {
        self.enter_enum_declaration()
        let node = javaast_enum_declaration(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "body":
                    switch cursor.node.kind {
                    case "enum_body":
                        node.body = self.transform_enum_body(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "interfaces":
                    switch cursor.node.kind {
                    case "super_interfaces":
                        node.interfaces = self.transform_super_interfaces(cursor, node)
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
                default:
                    switch cursor.node.kind {
                    case "modifiers":
                        if let child = self.transform_modifiers(cursor, node) {
                            node.children = child
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_enum_declaration(node)
        return node
    }

    func transform_explicit_constructor_invocation(_ cursor: TreeCursor, _ parent: AST?) -> javaast_explicit_constructor_invocation? {
        self.enter_explicit_constructor_invocation()
        let node = javaast_explicit_constructor_invocation(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
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
                case "constructor":
                    switch cursor.node.kind {
                    case "super":
                        node.constructor = self.transform_super(cursor, node)
                    case "this":
                        node.constructor = self.transform_this(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "object":
                    switch cursor.node.kind {
                    case "binary_integer_literal", "character_literal", "decimal_floating_point_literal", "decimal_integer_literal", "false", "hex_floating_point_literal", "hex_integer_literal", "null_literal", "octal_integer_literal", "string_literal", "true":
                        node.object = self.transform__literal(cursor, node)
                    case "array_access", "array_creation_expression", "class_literal", "field_access", "identifier", "method_invocation", "method_reference", "object_creation_expression", "parenthesized_expression", "this":
                        node.object = self.transform_primary_expression(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "type_arguments":
                    switch cursor.node.kind {
                    case "type_arguments":
                        node.type_arguments = self.transform_type_arguments(cursor, node)
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
        self.leave_explicit_constructor_invocation(node)
        return node
    }

    func transform_expression(_ cursor: TreeCursor, _ parent: AST?) -> javaast_expression? {
        var node: javaast_expression? = nil
        switch cursor.node.kind {
        case "assignment_expression":
            node = self.transform_assignment_expression(cursor, parent)
        case "binary_expression":
            node = self.transform_binary_expression(cursor, parent)
        case "cast_expression":
            node = self.transform_cast_expression(cursor, parent)
        case "instanceof_expression":
            node = self.transform_instanceof_expression(cursor, parent)
        case "lambda_expression":
            node = self.transform_lambda_expression(cursor, parent)
        case "binary_integer_literal", "character_literal", "decimal_floating_point_literal", "decimal_integer_literal", "false", "hex_floating_point_literal", "hex_integer_literal", "null_literal", "octal_integer_literal", "string_literal", "true":
            node = self.transform__literal(cursor, parent)
        case "array_access", "array_creation_expression", "class_literal", "field_access", "identifier", "method_invocation", "method_reference", "object_creation_expression", "parenthesized_expression", "this":
            node = self.transform_primary_expression(cursor, parent)
        case "ternary_expression":
            node = self.transform_ternary_expression(cursor, parent)
        case "unary_expression":
            node = self.transform_unary_expression(cursor, parent)
        case "update_expression":
            node = self.transform_update_expression(cursor, parent)
        default:
            print("invalid subtype in supertype: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
        }
        return node
    }

    func transform_expression_statement(_ cursor: TreeCursor, _ parent: AST?) -> javaast_expression_statement? {
        self.enter_expression_statement()
        let node = javaast_expression_statement(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "binary_integer_literal", "character_literal", "decimal_floating_point_literal", "decimal_integer_literal", "false", "hex_floating_point_literal", "hex_integer_literal", "null_literal", "octal_integer_literal", "string_literal", "true":
                        if let child = self.transform__literal(cursor, node) {
                            node.children = child
                        }
                    case "array_access", "array_creation_expression", "class_literal", "field_access", "identifier", "method_invocation", "method_reference", "object_creation_expression", "parenthesized_expression", "this":
                        if let child = self.transform_primary_expression(cursor, node) {
                            node.children = child
                        }
                    case "assignment_expression", "binary_expression", "cast_expression", "instanceof_expression", "lambda_expression", "ternary_expression", "unary_expression", "update_expression":
                        if let child = self.transform_expression(cursor, node) {
                            node.children = child
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_expression_statement(node)
        return node
    }

    func transform_extends_interfaces(_ cursor: TreeCursor, _ parent: AST?) -> javaast_extends_interfaces? {
        self.enter_extends_interfaces()
        let node = javaast_extends_interfaces(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "interface_type_list":
                        if let child = self.transform_interface_type_list(cursor, node) {
                            node.children = child
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_extends_interfaces(node)
        return node
    }

    func transform_false(_ cursor: TreeCursor, _ parent: AST?) -> javaast_false? {
        self.enter_false()
        let node = javaast_false(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_false(node)
        return node
    }

    func transform_field_access(_ cursor: TreeCursor, _ parent: AST?) -> javaast_field_access? {
        self.enter_field_access()
        let node = javaast_field_access(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "field":
                    switch cursor.node.kind {
                    case "identifier":
                        node.field = self.transform_identifier(cursor, node)
                    case "this":
                        node.field = self.transform_this(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "object":
                    switch cursor.node.kind {
                    case "binary_integer_literal", "character_literal", "decimal_floating_point_literal", "decimal_integer_literal", "false", "hex_floating_point_literal", "hex_integer_literal", "null_literal", "octal_integer_literal", "string_literal", "true":
                        node.object = self.transform__literal(cursor, node)
                    case "array_access", "array_creation_expression", "class_literal", "field_access", "identifier", "method_invocation", "method_reference", "object_creation_expression", "parenthesized_expression", "this":
                        node.object = self.transform_primary_expression(cursor, node)
                    case "super":
                        node.object = self.transform_super(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    case "super":
                        if let child = self.transform_super(cursor, node) {
                            node.children = child
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_field_access(node)
        return node
    }

    func transform_field_declaration(_ cursor: TreeCursor, _ parent: AST?) -> javaast_field_declaration? {
        self.enter_field_declaration()
        let node = javaast_field_declaration(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "declarator":
                    switch cursor.node.kind {
                    case "variable_declarator":
                        if let child = self.transform_variable_declarator(cursor, node) {
                            node.declarator.append(child)
                        }
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "type":
                    switch cursor.node.kind {
                    case "boolean_type", "floating_point_type", "generic_type", "integral_type", "scoped_type_identifier", "type_identifier", "void_type":
                        node.type = self.transform__simple_type(cursor, node)
                    case "array_type":
                        node.type = self.transform__unannotated_type(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    case "modifiers":
                        if let child = self.transform_modifiers(cursor, node) {
                            node.children = child
                        }
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

    func transform_finally_clause(_ cursor: TreeCursor, _ parent: AST?) -> javaast_finally_clause? {
        self.enter_finally_clause()
        let node = javaast_finally_clause(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "block":
                        if let child = self.transform_block(cursor, node) {
                            node.children = child
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_finally_clause(node)
        return node
    }

    func transform_floating_point_type(_ cursor: TreeCursor, _ parent: AST?) -> javaast_floating_point_type? {
        self.enter_floating_point_type()
        let node = javaast_floating_point_type(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_floating_point_type(node)
        return node
    }

    func transform_for_statement(_ cursor: TreeCursor, _ parent: AST?) -> javaast_for_statement? {
        self.enter_for_statement()
        let node = javaast_for_statement(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "body":
                    switch cursor.node.kind {
                    case "annotation_type_declaration", "class_declaration", "enum_declaration", "import_declaration", "interface_declaration", "module_declaration", "package_declaration":
                        node.body = self.transform_declaration(cursor, node)
                    case "assert_statement", "block", "break_statement", "continue_statement", "do_statement", "enhanced_for_statement", "expression_statement", "for_statement", "if_statement", "labeled_statement", "local_variable_declaration", "return_statement", "switch_statement", "synchronized_statement", "throw_statement", "try_statement", "try_with_resources_statement", "while_statement":
                        node.body = self.transform_statement(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "condition":
                    switch cursor.node.kind {
                    case "binary_integer_literal", "character_literal", "decimal_floating_point_literal", "decimal_integer_literal", "false", "hex_floating_point_literal", "hex_integer_literal", "null_literal", "octal_integer_literal", "string_literal", "true":
                        node.condition = self.transform__literal(cursor, node)
                    case "array_access", "array_creation_expression", "class_literal", "field_access", "identifier", "method_invocation", "method_reference", "object_creation_expression", "parenthesized_expression", "this":
                        node.condition = self.transform_primary_expression(cursor, node)
                    case "assignment_expression", "binary_expression", "cast_expression", "instanceof_expression", "lambda_expression", "ternary_expression", "unary_expression", "update_expression":
                        node.condition = self.transform_expression(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "init":
                    switch cursor.node.kind {
                    case "binary_integer_literal", "character_literal", "decimal_floating_point_literal", "decimal_integer_literal", "false", "hex_floating_point_literal", "hex_integer_literal", "null_literal", "octal_integer_literal", "string_literal", "true":
                        if let child = self.transform__literal(cursor, node) {
                            node.initial.append(child)
                        }
                    case "array_access", "array_creation_expression", "class_literal", "field_access", "identifier", "method_invocation", "method_reference", "object_creation_expression", "parenthesized_expression", "this":
                        if let child = self.transform_primary_expression(cursor, node) {
                            node.initial.append(child)
                        }
                    case "assignment_expression", "binary_expression", "cast_expression", "instanceof_expression", "lambda_expression", "ternary_expression", "unary_expression", "update_expression":
                        if let child = self.transform_expression(cursor, node) {
                            node.initial.append(child)
                        }
                    case "local_variable_declaration":
                        if let child = self.transform_local_variable_declaration(cursor, node) {
                            node.initial.append(child)
                        }
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "update":
                    switch cursor.node.kind {
                    case "binary_integer_literal", "character_literal", "decimal_floating_point_literal", "decimal_integer_literal", "false", "hex_floating_point_literal", "hex_integer_literal", "null_literal", "octal_integer_literal", "string_literal", "true":
                        if let child = self.transform__literal(cursor, node) {
                            node.update.append(child)
                        }
                    case "array_access", "array_creation_expression", "class_literal", "field_access", "identifier", "method_invocation", "method_reference", "object_creation_expression", "parenthesized_expression", "this":
                        if let child = self.transform_primary_expression(cursor, node) {
                            node.update.append(child)
                        }
                    case "assignment_expression", "binary_expression", "cast_expression", "instanceof_expression", "lambda_expression", "ternary_expression", "unary_expression", "update_expression":
                        if let child = self.transform_expression(cursor, node) {
                            node.update.append(child)
                        }
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
        self.leave_for_statement(node)
        return node
    }

    func transform_formal_parameter(_ cursor: TreeCursor, _ parent: AST?) -> javaast_formal_parameter? {
        self.enter_formal_parameter()
        let node = javaast_formal_parameter(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "dimensions":
                    switch cursor.node.kind {
                    case "dimensions":
                        node.dimensions = self.transform_dimensions(cursor, node)
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
                case "type":
                    switch cursor.node.kind {
                    case "boolean_type", "floating_point_type", "generic_type", "integral_type", "scoped_type_identifier", "type_identifier", "void_type":
                        node.type = self.transform__simple_type(cursor, node)
                    case "array_type":
                        node.type = self.transform__unannotated_type(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    case "modifiers":
                        if let child = self.transform_modifiers(cursor, node) {
                            node.children = child
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_formal_parameter(node)
        return node
    }

    func transform_formal_parameters(_ cursor: TreeCursor, _ parent: AST?) -> javaast_formal_parameters? {
        self.enter_formal_parameters()
        let node = javaast_formal_parameters(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "formal_parameter":
                        if let child = self.transform_formal_parameter(cursor, node) {
                            node.children.append(child)
                        }
                    case "receiver_parameter":
                        if let child = self.transform_receiver_parameter(cursor, node) {
                            node.children.append(child)
                        }
                    case "spread_parameter":
                        if let child = self.transform_spread_parameter(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_formal_parameters(node)
        return node
    }

    func transform_generic_type(_ cursor: TreeCursor, _ parent: AST?) -> javaast_generic_type? {
        self.enter_generic_type()
        let node = javaast_generic_type(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "scoped_type_identifier":
                        if let child = self.transform_scoped_type_identifier(cursor, node) {
                            node.children.append(child)
                        }
                    case "type_arguments":
                        if let child = self.transform_type_arguments(cursor, node) {
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
        self.leave_generic_type(node)
        return node
    }

    func transform_hex_floating_point_literal(_ cursor: TreeCursor, _ parent: AST?) -> javaast_hex_floating_point_literal? {
        self.enter_hex_floating_point_literal()
        let node = javaast_hex_floating_point_literal(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_hex_floating_point_literal(node)
        return node
    }

    func transform_hex_integer_literal(_ cursor: TreeCursor, _ parent: AST?) -> javaast_hex_integer_literal? {
        self.enter_hex_integer_literal()
        let node = javaast_hex_integer_literal(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_hex_integer_literal(node)
        return node
    }

    func transform_identifier(_ cursor: TreeCursor, _ parent: AST?) -> javaast_identifier? {
        self.enter_identifier()
        let node = javaast_identifier(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_identifier(node)
        return node
    }

    func transform_if_statement(_ cursor: TreeCursor, _ parent: AST?) -> javaast_if_statement? {
        self.enter_if_statement()
        let node = javaast_if_statement(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "alternative":
                    switch cursor.node.kind {
                    case "annotation_type_declaration", "class_declaration", "enum_declaration", "import_declaration", "interface_declaration", "module_declaration", "package_declaration":
                        node.alternative = self.transform_declaration(cursor, node)
                    case "assert_statement", "block", "break_statement", "continue_statement", "do_statement", "enhanced_for_statement", "expression_statement", "for_statement", "if_statement", "labeled_statement", "local_variable_declaration", "return_statement", "switch_statement", "synchronized_statement", "throw_statement", "try_statement", "try_with_resources_statement", "while_statement":
                        node.alternative = self.transform_statement(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "condition":
                    switch cursor.node.kind {
                    case "parenthesized_expression":
                        node.condition = self.transform_parenthesized_expression(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "consequence":
                    switch cursor.node.kind {
                    case "annotation_type_declaration", "class_declaration", "enum_declaration", "import_declaration", "interface_declaration", "module_declaration", "package_declaration":
                        node.consequence = self.transform_declaration(cursor, node)
                    case "assert_statement", "block", "break_statement", "continue_statement", "do_statement", "enhanced_for_statement", "expression_statement", "for_statement", "if_statement", "labeled_statement", "local_variable_declaration", "return_statement", "switch_statement", "synchronized_statement", "throw_statement", "try_statement", "try_with_resources_statement", "while_statement":
                        node.consequence = self.transform_statement(cursor, node)
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

    func transform_import_declaration(_ cursor: TreeCursor, _ parent: AST?) -> javaast_import_declaration? {
        self.enter_import_declaration()
        let node = javaast_import_declaration(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "asterisk":
                        if let child = self.transform_asterisk(cursor, node) {
                            node.children.append(child)
                        }
                    case "identifier":
                        if let child = self.transform_identifier(cursor, node) {
                            node.children.append(child)
                        }
                    case "scoped_identifier":
                        if let child = self.transform_scoped_identifier(cursor, node) {
                            node.children.append(child)
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

    func transform_inferred_parameters(_ cursor: TreeCursor, _ parent: AST?) -> javaast_inferred_parameters? {
        self.enter_inferred_parameters()
        let node = javaast_inferred_parameters(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "identifier":
                        if let child = self.transform_identifier(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_inferred_parameters(node)
        return node
    }

    func transform_instanceof_expression(_ cursor: TreeCursor, _ parent: AST?) -> javaast_instanceof_expression? {
        self.enter_instanceof_expression()
        let node = javaast_instanceof_expression(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "left":
                    switch cursor.node.kind {
                    case "binary_integer_literal", "character_literal", "decimal_floating_point_literal", "decimal_integer_literal", "false", "hex_floating_point_literal", "hex_integer_literal", "null_literal", "octal_integer_literal", "string_literal", "true":
                        node.left = self.transform__literal(cursor, node)
                    case "array_access", "array_creation_expression", "class_literal", "field_access", "identifier", "method_invocation", "method_reference", "object_creation_expression", "parenthesized_expression", "this":
                        node.left = self.transform_primary_expression(cursor, node)
                    case "assignment_expression", "binary_expression", "cast_expression", "instanceof_expression", "lambda_expression", "ternary_expression", "unary_expression", "update_expression":
                        node.left = self.transform_expression(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "right":
                    switch cursor.node.kind {
                    case "boolean_type", "floating_point_type", "generic_type", "integral_type", "scoped_type_identifier", "type_identifier", "void_type":
                        node.right = self.transform__simple_type(cursor, node)
                    case "array_type":
                        node.right = self.transform__unannotated_type(cursor, node)
                    case "annotated_type":
                        node.right = self.transform__type(cursor, node)
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
        self.leave_instanceof_expression(node)
        return node
    }

    func transform_integral_type(_ cursor: TreeCursor, _ parent: AST?) -> javaast_integral_type? {
        self.enter_integral_type()
        let node = javaast_integral_type(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_integral_type(node)
        return node
    }

    func transform_interface_body(_ cursor: TreeCursor, _ parent: AST?) -> javaast_interface_body? {
        self.enter_interface_body()
        let node = javaast_interface_body(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "annotation_type_declaration":
                        if let child = self.transform_annotation_type_declaration(cursor, node) {
                            node.children.append(child)
                        }
                    case "class_declaration":
                        if let child = self.transform_class_declaration(cursor, node) {
                            node.children.append(child)
                        }
                    case "constant_declaration":
                        if let child = self.transform_constant_declaration(cursor, node) {
                            node.children.append(child)
                        }
                    case "enum_declaration":
                        if let child = self.transform_enum_declaration(cursor, node) {
                            node.children.append(child)
                        }
                    case "interface_declaration":
                        if let child = self.transform_interface_declaration(cursor, node) {
                            node.children.append(child)
                        }
                    case "method_declaration":
                        if let child = self.transform_method_declaration(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_interface_body(node)
        return node
    }

    func transform_interface_declaration(_ cursor: TreeCursor, _ parent: AST?) -> javaast_interface_declaration? {
        self.enter_interface_declaration()
        let node = javaast_interface_declaration(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "body":
                    switch cursor.node.kind {
                    case "interface_body":
                        node.body = self.transform_interface_body(cursor, node)
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
                case "type_parameters":
                    switch cursor.node.kind {
                    case "type_parameters":
                        node.type_parameters = self.transform_type_parameters(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    case "extends_interfaces":
                        if let child = self.transform_extends_interfaces(cursor, node) {
                            node.children.append(child)
                        }
                    case "modifiers":
                        if let child = self.transform_modifiers(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_interface_declaration(node)
        return node
    }

    func transform_interface_type_list(_ cursor: TreeCursor, _ parent: AST?) -> javaast_interface_type_list? {
        self.enter_interface_type_list()
        let node = javaast_interface_type_list(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "boolean_type", "floating_point_type", "generic_type", "integral_type", "scoped_type_identifier", "type_identifier", "void_type":
                        if let child = self.transform__simple_type(cursor, node) {
                            node.children.append(child)
                        }
                    case "array_type":
                        if let child = self.transform__unannotated_type(cursor, node) {
                            node.children.append(child)
                        }
                    case "annotated_type":
                        if let child = self.transform__type(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_interface_type_list(node)
        return node
    }

    func transform_labeled_statement(_ cursor: TreeCursor, _ parent: AST?) -> javaast_labeled_statement? {
        self.enter_labeled_statement()
        let node = javaast_labeled_statement(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "identifier":
                        if let child = self.transform_identifier(cursor, node) {
                            node.children.append(child)
                        }
                    case "annotation_type_declaration", "class_declaration", "enum_declaration", "import_declaration", "interface_declaration", "module_declaration", "package_declaration":
                        if let child = self.transform_declaration(cursor, node) {
                            node.children.append(child)
                        }
                    case "assert_statement", "block", "break_statement", "continue_statement", "do_statement", "enhanced_for_statement", "expression_statement", "for_statement", "if_statement", "labeled_statement", "local_variable_declaration", "return_statement", "switch_statement", "synchronized_statement", "throw_statement", "try_statement", "try_with_resources_statement", "while_statement":
                        if let child = self.transform_statement(cursor, node) {
                            node.children.append(child)
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

    func transform_lambda_expression(_ cursor: TreeCursor, _ parent: AST?) -> javaast_lambda_expression? {
        self.enter_lambda_expression()
        let node = javaast_lambda_expression(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "body":
                    switch cursor.node.kind {
                    case "block":
                        node.body = self.transform_block(cursor, node)
                    case "binary_integer_literal", "character_literal", "decimal_floating_point_literal", "decimal_integer_literal", "false", "hex_floating_point_literal", "hex_integer_literal", "null_literal", "octal_integer_literal", "string_literal", "true":
                        node.body = self.transform__literal(cursor, node)
                    case "array_access", "array_creation_expression", "class_literal", "field_access", "identifier", "method_invocation", "method_reference", "object_creation_expression", "parenthesized_expression", "this":
                        node.body = self.transform_primary_expression(cursor, node)
                    case "assignment_expression", "binary_expression", "cast_expression", "instanceof_expression", "lambda_expression", "ternary_expression", "unary_expression", "update_expression":
                        node.body = self.transform_expression(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "parameters":
                    switch cursor.node.kind {
                    case "formal_parameters":
                        node.parameters = self.transform_formal_parameters(cursor, node)
                    case "identifier":
                        node.parameters = self.transform_identifier(cursor, node)
                    case "inferred_parameters":
                        node.parameters = self.transform_inferred_parameters(cursor, node)
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
        self.leave_lambda_expression(node)
        return node
    }

    func transform_local_variable_declaration(_ cursor: TreeCursor, _ parent: AST?) -> javaast_local_variable_declaration? {
        self.enter_local_variable_declaration()
        let node = javaast_local_variable_declaration(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "declarator":
                    switch cursor.node.kind {
                    case "variable_declarator":
                        if let child = self.transform_variable_declarator(cursor, node) {
                            node.declarator.append(child)
                        }
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "type":
                    switch cursor.node.kind {
                    case "boolean_type", "floating_point_type", "generic_type", "integral_type", "scoped_type_identifier", "type_identifier", "void_type":
                        node.type = self.transform__simple_type(cursor, node)
                    case "array_type":
                        node.type = self.transform__unannotated_type(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    case "modifiers":
                        if let child = self.transform_modifiers(cursor, node) {
                            node.children = child
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_local_variable_declaration(node)
        return node
    }

    func transform_marker_annotation(_ cursor: TreeCursor, _ parent: AST?) -> javaast_marker_annotation? {
        self.enter_marker_annotation()
        let node = javaast_marker_annotation(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "name":
                    switch cursor.node.kind {
                    case "identifier":
                        node.name = self.transform_identifier(cursor, node)
                    case "scoped_identifier":
                        node.name = self.transform_scoped_identifier(cursor, node)
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
        self.leave_marker_annotation(node)
        return node
    }

    func transform_method_declaration(_ cursor: TreeCursor, _ parent: AST?) -> javaast_method_declaration? {
        self.enter_method_declaration()
        let node = javaast_method_declaration(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
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
                case "dimensions":
                    switch cursor.node.kind {
                    case "dimensions":
                        node.dimensions = self.transform_dimensions(cursor, node)
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
                    case "formal_parameters":
                        node.parameters = self.transform_formal_parameters(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "type":
                    switch cursor.node.kind {
                    case "boolean_type", "floating_point_type", "generic_type", "integral_type", "scoped_type_identifier", "type_identifier", "void_type":
                        node.type = self.transform__simple_type(cursor, node)
                    case "array_type":
                        node.type = self.transform__unannotated_type(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "type_parameters":
                    switch cursor.node.kind {
                    case "type_parameters":
                        node.type_parameters = self.transform_type_parameters(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    case "annotation":
                        if let child = self.transform_annotation(cursor, node) {
                            node.children.append(child)
                        }
                    case "marker_annotation":
                        if let child = self.transform_marker_annotation(cursor, node) {
                            node.children.append(child)
                        }
                    case "modifiers":
                        if let child = self.transform_modifiers(cursor, node) {
                            node.children.append(child)
                        }
                    case "throws":
                        if let child = self.transform_throws(cursor, node) {
                            node.children.append(child)
                        }
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

    func transform_method_invocation(_ cursor: TreeCursor, _ parent: AST?) -> javaast_method_invocation? {
        self.enter_method_invocation()
        let node = javaast_method_invocation(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
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
                case "name":
                    switch cursor.node.kind {
                    case "identifier":
                        node.name = self.transform_identifier(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "object":
                    switch cursor.node.kind {
                    case "binary_integer_literal", "character_literal", "decimal_floating_point_literal", "decimal_integer_literal", "false", "hex_floating_point_literal", "hex_integer_literal", "null_literal", "octal_integer_literal", "string_literal", "true":
                        node.object = self.transform__literal(cursor, node)
                    case "array_access", "array_creation_expression", "class_literal", "field_access", "identifier", "method_invocation", "method_reference", "object_creation_expression", "parenthesized_expression", "this":
                        node.object = self.transform_primary_expression(cursor, node)
                    case "super":
                        node.object = self.transform_super(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "type_arguments":
                    switch cursor.node.kind {
                    case "type_arguments":
                        node.type_arguments = self.transform_type_arguments(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    case "super":
                        if let child = self.transform_super(cursor, node) {
                            node.children = child
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_method_invocation(node)
        return node
    }

    func transform_method_reference(_ cursor: TreeCursor, _ parent: AST?) -> javaast_method_reference? {
        self.enter_method_reference()
        let node = javaast_method_reference(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "boolean_type", "floating_point_type", "generic_type", "integral_type", "scoped_type_identifier", "type_identifier", "void_type":
                        if let child = self.transform__simple_type(cursor, node) {
                            node.children.append(child)
                        }
                    case "array_type":
                        if let child = self.transform__unannotated_type(cursor, node) {
                            node.children.append(child)
                        }
                    case "annotated_type":
                        if let child = self.transform__type(cursor, node) {
                            node.children.append(child)
                        }
                    case "binary_integer_literal", "character_literal", "decimal_floating_point_literal", "decimal_integer_literal", "false", "hex_floating_point_literal", "hex_integer_literal", "null_literal", "octal_integer_literal", "string_literal", "true":
                        if let child = self.transform__literal(cursor, node) {
                            node.children.append(child)
                        }
                    case "array_access", "array_creation_expression", "class_literal", "field_access", "identifier", "method_invocation", "method_reference", "object_creation_expression", "parenthesized_expression", "this":
                        if let child = self.transform_primary_expression(cursor, node) {
                            node.children.append(child)
                        }
                    case "super":
                        if let child = self.transform_super(cursor, node) {
                            node.children.append(child)
                        }
                    case "type_arguments":
                        if let child = self.transform_type_arguments(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_method_reference(node)
        return node
    }

    func transform_modifiers(_ cursor: TreeCursor, _ parent: AST?) -> javaast_modifiers? {
        self.enter_modifiers()
        let node = javaast_modifiers(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "annotation":
                        if let child = self.transform_annotation(cursor, node) {
                            node.children.append(child)
                        }
                    case "marker_annotation":
                        if let child = self.transform_marker_annotation(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_modifiers(node)
        return node
    }

    func transform_module_body(_ cursor: TreeCursor, _ parent: AST?) -> javaast_module_body? {
        self.enter_module_body()
        let node = javaast_module_body(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "module_directive":
                        if let child = self.transform_module_directive(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_module_body(node)
        return node
    }

    func transform_module_declaration(_ cursor: TreeCursor, _ parent: AST?) -> javaast_module_declaration? {
        self.enter_module_declaration()
        let node = javaast_module_declaration(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "body":
                    switch cursor.node.kind {
                    case "module_body":
                        node.body = self.transform_module_body(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "name":
                    switch cursor.node.kind {
                    case "identifier":
                        node.name = self.transform_identifier(cursor, node)
                    case "scoped_identifier":
                        node.name = self.transform_scoped_identifier(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    case "annotation":
                        if let child = self.transform_annotation(cursor, node) {
                            node.children.append(child)
                        }
                    case "marker_annotation":
                        if let child = self.transform_marker_annotation(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_module_declaration(node)
        return node
    }

    func transform_module_directive(_ cursor: TreeCursor, _ parent: AST?) -> javaast_module_directive? {
        self.enter_module_directive()
        let node = javaast_module_directive(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "identifier":
                        if let child = self.transform_identifier(cursor, node) {
                            node.children.append(child)
                        }
                    case "requires_modifier":
                        if let child = self.transform_requires_modifier(cursor, node) {
                            node.children.append(child)
                        }
                    case "scoped_identifier":
                        if let child = self.transform_scoped_identifier(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_module_directive(node)
        return node
    }

    func transform_null_literal(_ cursor: TreeCursor, _ parent: AST?) -> javaast_null_literal? {
        self.enter_null_literal()
        let node = javaast_null_literal(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_null_literal(node)
        return node
    }

    func transform_object_creation_expression(_ cursor: TreeCursor, _ parent: AST?) -> javaast_object_creation_expression? {
        self.enter_object_creation_expression()
        let node = javaast_object_creation_expression(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
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
                case "type":
                    switch cursor.node.kind {
                    case "boolean_type", "floating_point_type", "generic_type", "integral_type", "scoped_type_identifier", "type_identifier", "void_type":
                        node.type = self.transform__simple_type(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "type_arguments":
                    switch cursor.node.kind {
                    case "type_arguments":
                        node.type_arguments = self.transform_type_arguments(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    case "class_body":
                        if let child = self.transform_class_body(cursor, node) {
                            node.children.append(child)
                        }
                    case "binary_integer_literal", "character_literal", "decimal_floating_point_literal", "decimal_integer_literal", "false", "hex_floating_point_literal", "hex_integer_literal", "null_literal", "octal_integer_literal", "string_literal", "true":
                        if let child = self.transform__literal(cursor, node) {
                            node.children.append(child)
                        }
                    case "array_access", "array_creation_expression", "class_literal", "field_access", "identifier", "method_invocation", "method_reference", "object_creation_expression", "parenthesized_expression", "this":
                        if let child = self.transform_primary_expression(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_object_creation_expression(node)
        return node
    }

    func transform_octal_integer_literal(_ cursor: TreeCursor, _ parent: AST?) -> javaast_octal_integer_literal? {
        self.enter_octal_integer_literal()
        let node = javaast_octal_integer_literal(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_octal_integer_literal(node)
        return node
    }

    func transform_package_declaration(_ cursor: TreeCursor, _ parent: AST?) -> javaast_package_declaration? {
        self.enter_package_declaration()
        let node = javaast_package_declaration(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "annotation":
                        if let child = self.transform_annotation(cursor, node) {
                            node.children.append(child)
                        }
                    case "identifier":
                        if let child = self.transform_identifier(cursor, node) {
                            node.children.append(child)
                        }
                    case "marker_annotation":
                        if let child = self.transform_marker_annotation(cursor, node) {
                            node.children.append(child)
                        }
                    case "scoped_identifier":
                        if let child = self.transform_scoped_identifier(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_package_declaration(node)
        return node
    }

    func transform_parenthesized_expression(_ cursor: TreeCursor, _ parent: AST?) -> javaast_parenthesized_expression? {
        self.enter_parenthesized_expression()
        let node = javaast_parenthesized_expression(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "binary_integer_literal", "character_literal", "decimal_floating_point_literal", "decimal_integer_literal", "false", "hex_floating_point_literal", "hex_integer_literal", "null_literal", "octal_integer_literal", "string_literal", "true":
                        if let child = self.transform__literal(cursor, node) {
                            node.children = child
                        }
                    case "array_access", "array_creation_expression", "class_literal", "field_access", "identifier", "method_invocation", "method_reference", "object_creation_expression", "parenthesized_expression", "this":
                        if let child = self.transform_primary_expression(cursor, node) {
                            node.children = child
                        }
                    case "assignment_expression", "binary_expression", "cast_expression", "instanceof_expression", "lambda_expression", "ternary_expression", "unary_expression", "update_expression":
                        if let child = self.transform_expression(cursor, node) {
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

    func transform_primary_expression(_ cursor: TreeCursor, _ parent: AST?) -> javaast_primary_expression? {
        var node: javaast_primary_expression? = nil
        switch cursor.node.kind {
        case "binary_integer_literal", "character_literal", "decimal_floating_point_literal", "decimal_integer_literal", "false", "hex_floating_point_literal", "hex_integer_literal", "null_literal", "octal_integer_literal", "string_literal", "true":
            node = self.transform__literal(cursor, parent)
        case "array_access":
            node = self.transform_array_access(cursor, parent)
        case "array_creation_expression":
            node = self.transform_array_creation_expression(cursor, parent)
        case "class_literal":
            node = self.transform_class_literal(cursor, parent)
        case "field_access":
            node = self.transform_field_access(cursor, parent)
        case "identifier":
            node = self.transform_identifier(cursor, parent)
        case "method_invocation":
            node = self.transform_method_invocation(cursor, parent)
        case "method_reference":
            node = self.transform_method_reference(cursor, parent)
        case "object_creation_expression":
            node = self.transform_object_creation_expression(cursor, parent)
        case "parenthesized_expression":
            node = self.transform_parenthesized_expression(cursor, parent)
        case "this":
            node = self.transform_this(cursor, parent)
        default:
            print("invalid subtype in supertype: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
        }
        return node
    }

    func transform_program(_ cursor: TreeCursor, _ parent: AST?) -> javaast_program? {
        self.enter_program()
        let node = javaast_program(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "annotation_type_declaration", "class_declaration", "enum_declaration", "import_declaration", "interface_declaration", "module_declaration", "package_declaration":
                        if let child = self.transform_declaration(cursor, node) {
                            node.children.append(child)
                        }
                    case "assert_statement", "block", "break_statement", "continue_statement", "do_statement", "enhanced_for_statement", "expression_statement", "for_statement", "if_statement", "labeled_statement", "local_variable_declaration", "return_statement", "switch_statement", "synchronized_statement", "throw_statement", "try_statement", "try_with_resources_statement", "while_statement":
                        if let child = self.transform_statement(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_program(node)
        return node
    }

    func transform_receiver_parameter(_ cursor: TreeCursor, _ parent: AST?) -> javaast_receiver_parameter? {
        self.enter_receiver_parameter()
        let node = javaast_receiver_parameter(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "boolean_type", "floating_point_type", "generic_type", "integral_type", "scoped_type_identifier", "type_identifier", "void_type":
                        if let child = self.transform__simple_type(cursor, node) {
                            node.children.append(child)
                        }
                    case "array_type":
                        if let child = self.transform__unannotated_type(cursor, node) {
                            node.children.append(child)
                        }
                    case "annotation":
                        if let child = self.transform_annotation(cursor, node) {
                            node.children.append(child)
                        }
                    case "identifier":
                        if let child = self.transform_identifier(cursor, node) {
                            node.children.append(child)
                        }
                    case "marker_annotation":
                        if let child = self.transform_marker_annotation(cursor, node) {
                            node.children.append(child)
                        }
                    case "this":
                        if let child = self.transform_this(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_receiver_parameter(node)
        return node
    }

    func transform_record_declaration(_ cursor: TreeCursor, _ parent: AST?) -> javaast_record_declaration? {
        self.enter_record_declaration()
        let node = javaast_record_declaration(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "body":
                    switch cursor.node.kind {
                    case "class_body":
                        node.body = self.transform_class_body(cursor, node)
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
                    case "formal_parameters":
                        node.parameters = self.transform_formal_parameters(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    case "modifiers":
                        if let child = self.transform_modifiers(cursor, node) {
                            node.children = child
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_record_declaration(node)
        return node
    }

    func transform_requires_modifier(_ cursor: TreeCursor, _ parent: AST?) -> javaast_requires_modifier? {
        self.enter_requires_modifier()
        let node = javaast_requires_modifier(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_requires_modifier(node)
        return node
    }

    func transform_resource(_ cursor: TreeCursor, _ parent: AST?) -> javaast_resource? {
        self.enter_resource()
        let node = javaast_resource(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "dimensions":
                    switch cursor.node.kind {
                    case "dimensions":
                        node.dimensions = self.transform_dimensions(cursor, node)
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
                case "type":
                    switch cursor.node.kind {
                    case "boolean_type", "floating_point_type", "generic_type", "integral_type", "scoped_type_identifier", "type_identifier", "void_type":
                        node.type = self.transform__simple_type(cursor, node)
                    case "array_type":
                        node.type = self.transform__unannotated_type(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "value":
                    switch cursor.node.kind {
                    case "binary_integer_literal", "character_literal", "decimal_floating_point_literal", "decimal_integer_literal", "false", "hex_floating_point_literal", "hex_integer_literal", "null_literal", "octal_integer_literal", "string_literal", "true":
                        node.value = self.transform__literal(cursor, node)
                    case "array_access", "array_creation_expression", "class_literal", "field_access", "identifier", "method_invocation", "method_reference", "object_creation_expression", "parenthesized_expression", "this":
                        node.value = self.transform_primary_expression(cursor, node)
                    case "assignment_expression", "binary_expression", "cast_expression", "instanceof_expression", "lambda_expression", "ternary_expression", "unary_expression", "update_expression":
                        node.value = self.transform_expression(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    case "field_access":
                        if let child = self.transform_field_access(cursor, node) {
                            node.children = child
                        }
                    case "identifier":
                        if let child = self.transform_identifier(cursor, node) {
                            node.children = child
                        }
                    case "modifiers":
                        if let child = self.transform_modifiers(cursor, node) {
                            node.children = child
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_resource(node)
        return node
    }

    func transform_resource_specification(_ cursor: TreeCursor, _ parent: AST?) -> javaast_resource_specification? {
        self.enter_resource_specification()
        let node = javaast_resource_specification(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "resource":
                        if let child = self.transform_resource(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_resource_specification(node)
        return node
    }

    func transform_return_statement(_ cursor: TreeCursor, _ parent: AST?) -> javaast_return_statement? {
        self.enter_return_statement()
        let node = javaast_return_statement(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "binary_integer_literal", "character_literal", "decimal_floating_point_literal", "decimal_integer_literal", "false", "hex_floating_point_literal", "hex_integer_literal", "null_literal", "octal_integer_literal", "string_literal", "true":
                        if let child = self.transform__literal(cursor, node) {
                            node.children = child
                        }
                    case "array_access", "array_creation_expression", "class_literal", "field_access", "identifier", "method_invocation", "method_reference", "object_creation_expression", "parenthesized_expression", "this":
                        if let child = self.transform_primary_expression(cursor, node) {
                            node.children = child
                        }
                    case "assignment_expression", "binary_expression", "cast_expression", "instanceof_expression", "lambda_expression", "ternary_expression", "unary_expression", "update_expression":
                        if let child = self.transform_expression(cursor, node) {
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

    func transform_scoped_identifier(_ cursor: TreeCursor, _ parent: AST?) -> javaast_scoped_identifier? {
        self.enter_scoped_identifier()
        let node = javaast_scoped_identifier(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
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
                case "scope":
                    switch cursor.node.kind {
                    case "identifier":
                        node.scope = self.transform_identifier(cursor, node)
                    case "scoped_identifier":
                        node.scope = self.transform_scoped_identifier(cursor, node)
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
        self.leave_scoped_identifier(node)
        return node
    }

    func transform_scoped_type_identifier(_ cursor: TreeCursor, _ parent: AST?) -> javaast_scoped_type_identifier? {
        self.enter_scoped_type_identifier()
        let node = javaast_scoped_type_identifier(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "annotation":
                        if let child = self.transform_annotation(cursor, node) {
                            node.children.append(child)
                        }
                    case "generic_type":
                        if let child = self.transform_generic_type(cursor, node) {
                            node.children.append(child)
                        }
                    case "marker_annotation":
                        if let child = self.transform_marker_annotation(cursor, node) {
                            node.children.append(child)
                        }
                    case "scoped_type_identifier":
                        if let child = self.transform_scoped_type_identifier(cursor, node) {
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
        self.leave_scoped_type_identifier(node)
        return node
    }

    func transform_spread_parameter(_ cursor: TreeCursor, _ parent: AST?) -> javaast_spread_parameter? {
        self.enter_spread_parameter()
        let node = javaast_spread_parameter(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "boolean_type", "floating_point_type", "generic_type", "integral_type", "scoped_type_identifier", "type_identifier", "void_type":
                        if let child = self.transform__simple_type(cursor, node) {
                            node.children.append(child)
                        }
                    case "array_type":
                        if let child = self.transform__unannotated_type(cursor, node) {
                            node.children.append(child)
                        }
                    case "modifiers":
                        if let child = self.transform_modifiers(cursor, node) {
                            node.children.append(child)
                        }
                    case "variable_declarator":
                        if let child = self.transform_variable_declarator(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_spread_parameter(node)
        return node
    }

    func transform_statement(_ cursor: TreeCursor, _ parent: AST?) -> javaast_statement? {
        var node: javaast_statement? = nil
        switch cursor.node.kind {
        case "assert_statement":
            node = self.transform_assert_statement(cursor, parent)
        case "block":
            node = self.transform_block(cursor, parent)
        case "break_statement":
            node = self.transform_break_statement(cursor, parent)
        case "continue_statement":
            node = self.transform_continue_statement(cursor, parent)
        case "annotation_type_declaration", "class_declaration", "enum_declaration", "import_declaration", "interface_declaration", "module_declaration", "package_declaration":
            node = self.transform_declaration(cursor, parent)
        case "do_statement":
            node = self.transform_do_statement(cursor, parent)
        case "enhanced_for_statement":
            node = self.transform_enhanced_for_statement(cursor, parent)
        case "expression_statement":
            node = self.transform_expression_statement(cursor, parent)
        case "for_statement":
            node = self.transform_for_statement(cursor, parent)
        case "if_statement":
            node = self.transform_if_statement(cursor, parent)
        case "labeled_statement":
            node = self.transform_labeled_statement(cursor, parent)
        case "local_variable_declaration":
            node = self.transform_local_variable_declaration(cursor, parent)
        case "return_statement":
            node = self.transform_return_statement(cursor, parent)
        case "switch_statement":
            node = self.transform_switch_statement(cursor, parent)
        case "synchronized_statement":
            node = self.transform_synchronized_statement(cursor, parent)
        case "throw_statement":
            node = self.transform_throw_statement(cursor, parent)
        case "try_statement":
            node = self.transform_try_statement(cursor, parent)
        case "try_with_resources_statement":
            node = self.transform_try_with_resources_statement(cursor, parent)
        case "while_statement":
            node = self.transform_while_statement(cursor, parent)
        default:
            print("invalid subtype in supertype: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
        }
        return node
    }

    func transform_static_initializer(_ cursor: TreeCursor, _ parent: AST?) -> javaast_static_initializer? {
        self.enter_static_initializer()
        let node = javaast_static_initializer(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "block":
                        if let child = self.transform_block(cursor, node) {
                            node.children = child
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_static_initializer(node)
        return node
    }

    func transform_string_literal(_ cursor: TreeCursor, _ parent: AST?) -> javaast_string_literal? {
        self.enter_string_literal()
        let node = javaast_string_literal(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_string_literal(node)
        return node
    }

    func transform_super(_ cursor: TreeCursor, _ parent: AST?) -> javaast_super? {
        self.enter_super()
        let node = javaast_super(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_super(node)
        return node
    }

    func transform_super_interfaces(_ cursor: TreeCursor, _ parent: AST?) -> javaast_super_interfaces? {
        self.enter_super_interfaces()
        let node = javaast_super_interfaces(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "interface_type_list":
                        if let child = self.transform_interface_type_list(cursor, node) {
                            node.children = child
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_super_interfaces(node)
        return node
    }

    func transform_superclass(_ cursor: TreeCursor, _ parent: AST?) -> javaast_superclass? {
        self.enter_superclass()
        let node = javaast_superclass(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "boolean_type", "floating_point_type", "generic_type", "integral_type", "scoped_type_identifier", "type_identifier", "void_type":
                        if let child = self.transform__simple_type(cursor, node) {
                            node.children = child
                        }
                    case "array_type":
                        if let child = self.transform__unannotated_type(cursor, node) {
                            node.children = child
                        }
                    case "annotated_type":
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
        self.leave_superclass(node)
        return node
    }

    func transform_switch_block(_ cursor: TreeCursor, _ parent: AST?) -> javaast_switch_block? {
        self.enter_switch_block()
        let node = javaast_switch_block(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "annotation_type_declaration", "class_declaration", "enum_declaration", "import_declaration", "interface_declaration", "module_declaration", "package_declaration":
                        if let child = self.transform_declaration(cursor, node) {
                            node.children.append(child)
                        }
                    case "assert_statement", "block", "break_statement", "continue_statement", "do_statement", "enhanced_for_statement", "expression_statement", "for_statement", "if_statement", "labeled_statement", "local_variable_declaration", "return_statement", "switch_statement", "synchronized_statement", "throw_statement", "try_statement", "try_with_resources_statement", "while_statement":
                        if let child = self.transform_statement(cursor, node) {
                            node.children.append(child)
                        }
                    case "switch_label":
                        if let child = self.transform_switch_label(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_switch_block(node)
        return node
    }

    func transform_switch_label(_ cursor: TreeCursor, _ parent: AST?) -> javaast_switch_label? {
        self.enter_switch_label()
        let node = javaast_switch_label(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "binary_integer_literal", "character_literal", "decimal_floating_point_literal", "decimal_integer_literal", "false", "hex_floating_point_literal", "hex_integer_literal", "null_literal", "octal_integer_literal", "string_literal", "true":
                        if let child = self.transform__literal(cursor, node) {
                            node.children = child
                        }
                    case "array_access", "array_creation_expression", "class_literal", "field_access", "identifier", "method_invocation", "method_reference", "object_creation_expression", "parenthesized_expression", "this":
                        if let child = self.transform_primary_expression(cursor, node) {
                            node.children = child
                        }
                    case "assignment_expression", "binary_expression", "cast_expression", "instanceof_expression", "lambda_expression", "ternary_expression", "unary_expression", "update_expression":
                        if let child = self.transform_expression(cursor, node) {
                            node.children = child
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_switch_label(node)
        return node
    }

    func transform_switch_statement(_ cursor: TreeCursor, _ parent: AST?) -> javaast_switch_statement? {
        self.enter_switch_statement()
        let node = javaast_switch_statement(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "body":
                    switch cursor.node.kind {
                    case "switch_block":
                        node.body = self.transform_switch_block(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "condition":
                    switch cursor.node.kind {
                    case "parenthesized_expression":
                        node.condition = self.transform_parenthesized_expression(cursor, node)
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
        self.leave_switch_statement(node)
        return node
    }

    func transform_synchronized_statement(_ cursor: TreeCursor, _ parent: AST?) -> javaast_synchronized_statement? {
        self.enter_synchronized_statement()
        let node = javaast_synchronized_statement(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
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
                    case "parenthesized_expression":
                        if let child = self.transform_parenthesized_expression(cursor, node) {
                            node.children = child
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_synchronized_statement(node)
        return node
    }

    func transform_ternary_expression(_ cursor: TreeCursor, _ parent: AST?) -> javaast_ternary_expression? {
        self.enter_ternary_expression()
        let node = javaast_ternary_expression(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "alternative":
                    switch cursor.node.kind {
                    case "binary_integer_literal", "character_literal", "decimal_floating_point_literal", "decimal_integer_literal", "false", "hex_floating_point_literal", "hex_integer_literal", "null_literal", "octal_integer_literal", "string_literal", "true":
                        node.alternative = self.transform__literal(cursor, node)
                    case "array_access", "array_creation_expression", "class_literal", "field_access", "identifier", "method_invocation", "method_reference", "object_creation_expression", "parenthesized_expression", "this":
                        node.alternative = self.transform_primary_expression(cursor, node)
                    case "assignment_expression", "binary_expression", "cast_expression", "instanceof_expression", "lambda_expression", "ternary_expression", "unary_expression", "update_expression":
                        node.alternative = self.transform_expression(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "condition":
                    switch cursor.node.kind {
                    case "binary_integer_literal", "character_literal", "decimal_floating_point_literal", "decimal_integer_literal", "false", "hex_floating_point_literal", "hex_integer_literal", "null_literal", "octal_integer_literal", "string_literal", "true":
                        node.condition = self.transform__literal(cursor, node)
                    case "array_access", "array_creation_expression", "class_literal", "field_access", "identifier", "method_invocation", "method_reference", "object_creation_expression", "parenthesized_expression", "this":
                        node.condition = self.transform_primary_expression(cursor, node)
                    case "assignment_expression", "binary_expression", "cast_expression", "instanceof_expression", "lambda_expression", "ternary_expression", "unary_expression", "update_expression":
                        node.condition = self.transform_expression(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "consequence":
                    switch cursor.node.kind {
                    case "binary_integer_literal", "character_literal", "decimal_floating_point_literal", "decimal_integer_literal", "false", "hex_floating_point_literal", "hex_integer_literal", "null_literal", "octal_integer_literal", "string_literal", "true":
                        node.consequence = self.transform__literal(cursor, node)
                    case "array_access", "array_creation_expression", "class_literal", "field_access", "identifier", "method_invocation", "method_reference", "object_creation_expression", "parenthesized_expression", "this":
                        node.consequence = self.transform_primary_expression(cursor, node)
                    case "assignment_expression", "binary_expression", "cast_expression", "instanceof_expression", "lambda_expression", "ternary_expression", "unary_expression", "update_expression":
                        node.consequence = self.transform_expression(cursor, node)
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
        self.leave_ternary_expression(node)
        return node
    }

    func transform_this(_ cursor: TreeCursor, _ parent: AST?) -> javaast_this? {
        self.enter_this()
        let node = javaast_this(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_this(node)
        return node
    }

    func transform_throw_statement(_ cursor: TreeCursor, _ parent: AST?) -> javaast_throw_statement? {
        self.enter_throw_statement()
        let node = javaast_throw_statement(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "binary_integer_literal", "character_literal", "decimal_floating_point_literal", "decimal_integer_literal", "false", "hex_floating_point_literal", "hex_integer_literal", "null_literal", "octal_integer_literal", "string_literal", "true":
                        if let child = self.transform__literal(cursor, node) {
                            node.children = child
                        }
                    case "array_access", "array_creation_expression", "class_literal", "field_access", "identifier", "method_invocation", "method_reference", "object_creation_expression", "parenthesized_expression", "this":
                        if let child = self.transform_primary_expression(cursor, node) {
                            node.children = child
                        }
                    case "assignment_expression", "binary_expression", "cast_expression", "instanceof_expression", "lambda_expression", "ternary_expression", "unary_expression", "update_expression":
                        if let child = self.transform_expression(cursor, node) {
                            node.children = child
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_throw_statement(node)
        return node
    }

    func transform_throws(_ cursor: TreeCursor, _ parent: AST?) -> javaast_throws? {
        self.enter_throws()
        let node = javaast_throws(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "boolean_type", "floating_point_type", "generic_type", "integral_type", "scoped_type_identifier", "type_identifier", "void_type":
                        if let child = self.transform__simple_type(cursor, node) {
                            node.children.append(child)
                        }
                    case "array_type":
                        if let child = self.transform__unannotated_type(cursor, node) {
                            node.children.append(child)
                        }
                    case "annotated_type":
                        if let child = self.transform__type(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_throws(node)
        return node
    }

    func transform_true(_ cursor: TreeCursor, _ parent: AST?) -> javaast_true? {
        self.enter_true()
        let node = javaast_true(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_true(node)
        return node
    }

    func transform_try_statement(_ cursor: TreeCursor, _ parent: AST?) -> javaast_try_statement? {
        self.enter_try_statement()
        let node = javaast_try_statement(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
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
                    case "catch_clause":
                        if let child = self.transform_catch_clause(cursor, node) {
                            node.children.append(child)
                        }
                    case "finally_clause":
                        if let child = self.transform_finally_clause(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_try_statement(node)
        return node
    }

    func transform_try_with_resources_statement(_ cursor: TreeCursor, _ parent: AST?) -> javaast_try_with_resources_statement? {
        self.enter_try_with_resources_statement()
        let node = javaast_try_with_resources_statement(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
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
                case "resources":
                    switch cursor.node.kind {
                    case "resource_specification":
                        node.resources = self.transform_resource_specification(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                default:
                    switch cursor.node.kind {
                    case "catch_clause":
                        if let child = self.transform_catch_clause(cursor, node) {
                            node.children.append(child)
                        }
                    case "finally_clause":
                        if let child = self.transform_finally_clause(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_try_with_resources_statement(node)
        return node
    }

    func transform_type_arguments(_ cursor: TreeCursor, _ parent: AST?) -> javaast_type_arguments? {
        self.enter_type_arguments()
        let node = javaast_type_arguments(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "boolean_type", "floating_point_type", "generic_type", "integral_type", "scoped_type_identifier", "type_identifier", "void_type":
                        if let child = self.transform__simple_type(cursor, node) {
                            node.children.append(child)
                        }
                    case "array_type":
                        if let child = self.transform__unannotated_type(cursor, node) {
                            node.children.append(child)
                        }
                    case "annotated_type":
                        if let child = self.transform__type(cursor, node) {
                            node.children.append(child)
                        }
                    case "wildcard":
                        if let child = self.transform_wildcard(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_type_arguments(node)
        return node
    }

    func transform_type_bound(_ cursor: TreeCursor, _ parent: AST?) -> javaast_type_bound? {
        self.enter_type_bound()
        let node = javaast_type_bound(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "boolean_type", "floating_point_type", "generic_type", "integral_type", "scoped_type_identifier", "type_identifier", "void_type":
                        if let child = self.transform__simple_type(cursor, node) {
                            node.children.append(child)
                        }
                    case "array_type":
                        if let child = self.transform__unannotated_type(cursor, node) {
                            node.children.append(child)
                        }
                    case "annotated_type":
                        if let child = self.transform__type(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_type_bound(node)
        return node
    }

    func transform_type_identifier(_ cursor: TreeCursor, _ parent: AST?) -> javaast_type_identifier? {
        self.enter_type_identifier()
        let node = javaast_type_identifier(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_type_identifier(node)
        return node
    }

    func transform_type_parameter(_ cursor: TreeCursor, _ parent: AST?) -> javaast_type_parameter? {
        self.enter_type_parameter()
        let node = javaast_type_parameter(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "annotation":
                        if let child = self.transform_annotation(cursor, node) {
                            node.children.append(child)
                        }
                    case "identifier":
                        if let child = self.transform_identifier(cursor, node) {
                            node.children.append(child)
                        }
                    case "marker_annotation":
                        if let child = self.transform_marker_annotation(cursor, node) {
                            node.children.append(child)
                        }
                    case "type_bound":
                        if let child = self.transform_type_bound(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_type_parameter(node)
        return node
    }

    func transform_type_parameters(_ cursor: TreeCursor, _ parent: AST?) -> javaast_type_parameters? {
        self.enter_type_parameters()
        let node = javaast_type_parameters(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "type_parameter":
                        if let child = self.transform_type_parameter(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_type_parameters(node)
        return node
    }

    func transform_unary_expression(_ cursor: TreeCursor, _ parent: AST?) -> javaast_unary_expression? {
        self.enter_unary_expression()
        let node = javaast_unary_expression(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "operand":
                    switch cursor.node.kind {
                    case "binary_integer_literal", "character_literal", "decimal_floating_point_literal", "decimal_integer_literal", "false", "hex_floating_point_literal", "hex_integer_literal", "null_literal", "octal_integer_literal", "string_literal", "true":
                        node.operand = self.transform__literal(cursor, node)
                    case "array_access", "array_creation_expression", "class_literal", "field_access", "identifier", "method_invocation", "method_reference", "object_creation_expression", "parenthesized_expression", "this":
                        node.operand = self.transform_primary_expression(cursor, node)
                    case "assignment_expression", "binary_expression", "cast_expression", "instanceof_expression", "lambda_expression", "ternary_expression", "unary_expression", "update_expression":
                        node.operand = self.transform_expression(cursor, node)
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

    func transform_update_expression(_ cursor: TreeCursor, _ parent: AST?) -> javaast_update_expression? {
        self.enter_update_expression()
        let node = javaast_update_expression(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "binary_integer_literal", "character_literal", "decimal_floating_point_literal", "decimal_integer_literal", "false", "hex_floating_point_literal", "hex_integer_literal", "null_literal", "octal_integer_literal", "string_literal", "true":
                        if let child = self.transform__literal(cursor, node) {
                            node.children = child
                        }
                    case "array_access", "array_creation_expression", "class_literal", "field_access", "identifier", "method_invocation", "method_reference", "object_creation_expression", "parenthesized_expression", "this":
                        if let child = self.transform_primary_expression(cursor, node) {
                            node.children = child
                        }
                    case "assignment_expression", "binary_expression", "cast_expression", "instanceof_expression", "lambda_expression", "ternary_expression", "unary_expression", "update_expression":
                        if let child = self.transform_expression(cursor, node) {
                            node.children = child
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_update_expression(node)
        return node
    }

    func transform_variable_declarator(_ cursor: TreeCursor, _ parent: AST?) -> javaast_variable_declarator? {
        self.enter_variable_declarator()
        let node = javaast_variable_declarator(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "dimensions":
                    switch cursor.node.kind {
                    case "dimensions":
                        node.dimensions = self.transform_dimensions(cursor, node)
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
                case "value":
                    switch cursor.node.kind {
                    case "array_initializer":
                        node.value = self.transform_array_initializer(cursor, node)
                    case "binary_integer_literal", "character_literal", "decimal_floating_point_literal", "decimal_integer_literal", "false", "hex_floating_point_literal", "hex_integer_literal", "null_literal", "octal_integer_literal", "string_literal", "true":
                        node.value = self.transform__literal(cursor, node)
                    case "array_access", "array_creation_expression", "class_literal", "field_access", "identifier", "method_invocation", "method_reference", "object_creation_expression", "parenthesized_expression", "this":
                        node.value = self.transform_primary_expression(cursor, node)
                    case "assignment_expression", "binary_expression", "cast_expression", "instanceof_expression", "lambda_expression", "ternary_expression", "unary_expression", "update_expression":
                        node.value = self.transform_expression(cursor, node)
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
        self.leave_variable_declarator(node)
        return node
    }

    func transform_void_type(_ cursor: TreeCursor, _ parent: AST?) -> javaast_void_type? {
        self.enter_void_type()
        let node = javaast_void_type(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_void_type(node)
        return node
    }

    func transform_while_statement(_ cursor: TreeCursor, _ parent: AST?) -> javaast_while_statement? {
        self.enter_while_statement()
        let node = javaast_while_statement(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                case "body":
                    switch cursor.node.kind {
                    case "annotation_type_declaration", "class_declaration", "enum_declaration", "import_declaration", "interface_declaration", "module_declaration", "package_declaration":
                        node.body = self.transform_declaration(cursor, node)
                    case "assert_statement", "block", "break_statement", "continue_statement", "do_statement", "enhanced_for_statement", "expression_statement", "for_statement", "if_statement", "labeled_statement", "local_variable_declaration", "return_statement", "switch_statement", "synchronized_statement", "throw_statement", "try_statement", "try_with_resources_statement", "while_statement":
                        node.body = self.transform_statement(cursor, node)
                    default:
                        print("invalid fieldName cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                case "condition":
                    switch cursor.node.kind {
                    case "parenthesized_expression":
                        node.condition = self.transform_parenthesized_expression(cursor, node)
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
        self.leave_while_statement(node)
        return node
    }

    func transform_wildcard(_ cursor: TreeCursor, _ parent: AST?) -> javaast_wildcard? {
        self.enter_wildcard()
        let node = javaast_wildcard(pos: Common.Position(Int(cursor.node.startPosition.row), Int(cursor.node.startPosition.column), Int(cursor.node.endPosition.row), Int(cursor.node.endPosition.column), Int(cursor.node.startByte), Int(cursor.node.endByte)), parent: parent)
        if cursor.gotoFirstChild() {
            repeat {
                if self.handle_common(node, cursor) { continue }

                switch cursor.fieldName() {
                default:
                    switch cursor.node.kind {
                    case "boolean_type", "floating_point_type", "generic_type", "integral_type", "scoped_type_identifier", "type_identifier", "void_type":
                        if let child = self.transform__simple_type(cursor, node) {
                            node.children.append(child)
                        }
                    case "array_type":
                        if let child = self.transform__unannotated_type(cursor, node) {
                            node.children.append(child)
                        }
                    case "annotated_type":
                        if let child = self.transform__type(cursor, node) {
                            node.children.append(child)
                        }
                    case "annotation":
                        if let child = self.transform_annotation(cursor, node) {
                            node.children.append(child)
                        }
                    case "marker_annotation":
                        if let child = self.transform_marker_annotation(cursor, node) {
                            node.children.append(child)
                        }
                    case "super":
                        if let child = self.transform_super(cursor, node) {
                            node.children.append(child)
                        }
                    default:
                        print("invalid cursor.node.kind: ", cursor.node.kind, cursor.node.kindId, cursor.node.isExtra(), cursor.node.isError(), cursor.fieldName() ?? "")
                    }
                }
            } while cursor.gotoNextSibling()
            _ = cursor.gotoParent()
        }
        self.leave_wildcard(node)
        return node
    }


}
