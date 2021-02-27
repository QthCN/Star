//
//  File.swift
//  
//
//  Created by 秦天欢 on 2020/12/13.
//

import Foundation
import Common


public class GoType: Type {
    var symbolPosition: SymbolPosition? = nil
    
    public func position() -> SymbolPosition? {
        return self.symbolPosition
    }
    
    func setPosition(sp: SymbolPosition) {
        self.symbolPosition = sp
    }
    
    public func toString() -> String {
        return "\(self)"
    }
}


enum GoBasicKind {
    case invalid
    
    // predeclared types
    case bool
    case int
    case uint
    case uintptr
    case float
    case complex
    case string
    case unsafePointer

    // aliases
    case byte // Uint8
    case rune // Int32
}

// 类似于nil，主要是在tupleType里使用
class GoUnknownType: GoType {
    
}

class GoBasicType: GoType, CustomStringConvertible {
    var kind: GoBasicKind
    
    init(kind: GoBasicKind) {
        self.kind = kind
    }
    
    public var description: String {
        return "\(self.kind)"
    }
}

class GoArrayType: GoType, CustomStringConvertible {
    var len: Int?
    var elem: GoType?
    
    init(len: Int, elem: GoType) {
        self.len = len
        self.elem = elem
    }
    
    init(elem: GoType) {
        self.len = nil
        self.elem = elem
    }
    
    init(len: Int) {
        self.len = len
        self.elem = nil
    }
    
    public var description: String {
        return "[\(self.len ?? -1)]\(self.elem ?? GoUnknownType())"
    }
}

class GoSliceType: GoType, CustomStringConvertible {
    var elem: GoType?
    
    init(elem: GoType) {
        self.elem = elem
    }
    
    public var description: String {
        return "[]\(self.elem ?? GoUnknownType())"
    }
}


enum GoVarSituation {
    // stuct的field
    case field
    // 函数参数或者是返回类型参数
    case param
}


class GoVar: CustomStringConvertible {
    var name: String?
    var typ: GoType?
    var situation: GoVarSituation
    
    init() {
        self.name = nil
        self.typ = nil
        self.situation = .field
    }
    
    init(name: String, typ: GoType, situation: GoVarSituation) {
        self.name = name
        self.typ = typ
        self.situation = situation
    }
    
    init(typ: GoType, situation: GoVarSituation) {
        self.name = nil
        self.typ = typ
        self.situation = situation
    }
    
    init(name: String, situation: GoVarSituation) {
        self.name = name
        self.situation = situation
    }
    
    init(situation: GoVarSituation) {
        self.situation = situation
    }
    
    
    public var description: String {
        return "\(self.name ?? "")[\(self.typ ?? GoUnknownType())]"
    }
}


class GoStructType: GoType, CustomStringConvertible {
    var fields: [GoVar] = []
    
    init(fields: [GoVar]) {
        self.fields = fields
    }
    
    func addField(field: GoVar) {
        self.fields.append(field)
    }
    
    public var description: String {
        return "<\(self.fields)>"
    }
}


class GoPointerType: GoType, CustomStringConvertible {
    var base: GoType?
    
    init(base: GoType) {
        self.base = base
    }
    
    public var description: String {
        return "*\(self.base ?? GoUnknownType())"
    }
}

class GoTupleType: GoType, CustomStringConvertible {
    var vars: [GoVar] = []
    
    init(vars: [GoVar]) {
        self.vars = vars
    }
    
    public var description: String {
        return "(\(self.vars))"
    }
}

class GoSignatureType: GoType, CustomStringConvertible {
    var recv: GoVar?
    var params: GoTupleType?
    var results: GoTupleType?
    var variadic: Bool = false
    
    init(recv: GoVar, params: GoTupleType, results: GoTupleType, variadic: Bool) {
        self.recv = recv
        self.params = params
        self.results = results
        self.variadic = variadic
    }
    
    override init() {
        super.init()
    }
    
    public var description: String {
        return "\(self.params ?? GoUnknownType()) \(self.results ?? GoUnknownType())"
    }
}


class GoFunc: GoType, CustomStringConvertible {
    var name: String
    var sig: GoSignatureType?
    
    init(name: String, sig: GoSignatureType) {
        self.name = name
        self.sig = sig
    }
    
    init(name: String) {
        self.name = name
    }
    
    func setSignature(sig: GoSignatureType) {
        self.sig = sig
    }
    
    public var description: String {
        return "\(self.name) \(self.sig ?? GoUnknownType())"
    }
}

class GoInterfaceType: GoType, CustomStringConvertible {
    var methods: [GoFunc] = []
    var embeddeds: [GoType] = []
    
    init(methods: [GoFunc], embeddeds: [GoType]) {
        self.methods = methods
        self.embeddeds = embeddeds
    }
    
    func addMethod(method: GoFunc) {
        self.methods.append(method)
    }
    
    func addEmbeded(embeded: GoType) {
        self.embeddeds.append(embeded)
    }
    
    public var description: String {
        return "<\(self.methods) \(self.embeddeds)>"
    }
}


class GoMapType: GoType, CustomStringConvertible {
    var key: GoType?
    var elem: GoType?
    
    init(key: GoType, elem: GoType) {
        self.key = key
        self.elem = elem
    }
    
    public var description: String {
        return "map[\(self.key ?? GoUnknownType())]\(self.elem ?? GoUnknownType())"
    }
}

enum GoChanDir {
    case sendrecv
    case sendonly
    case recvonly
}

class GoChanType: GoType, CustomStringConvertible {
    var dir: GoChanDir
    var elem: GoType?
    
    init(dir: GoChanDir, elem: GoType) {
        self.dir = dir
        self.elem = elem
    }
    
    public var description: String {
        return "chan \(self.dir) \(self.elem ?? GoUnknownType())"
    }
}


class GoNamedType: GoType, CustomStringConvertible {
    var name: String?
    var pkg: GoPackage?
    var typ: GoType?
    var isAlias: Bool = false
    var methods: [GoFunc] = []
    
    init(name: String, pkg: GoPackage, typ: GoType? = nil, methods: [GoFunc] = []) {
        self.name = name
        self.pkg = pkg
        self.typ = typ
        self.methods = methods
    }
    
    func addMethod(method: GoFunc) {
        self.methods.append(method)
    }
    
    public var description: String {
        return "\(self.name ?? "")"
    }
}


// 主要用于Struct/interface的base中，如果base对应的pkg无法定位的话通过这个做占位符
class GoBaseFieldType: GoType, CustomStringConvertible {
    var package: String?
    var name: String?
    
    init(package: String, name: String) {
        self.package = package
        self.name = name
    }
    
    public var description: String {
        return "\(self.package ?? "").\(self.name ?? "")"
    }
}
