//
//  File.swift
//  
//
//  Created by 秦天欢 on 2020/12/13.
//

import Foundation
import Common


class GoType: Type {
    
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

    // types for untyped values
    case untypedBool
    case untypedInt
    case untypedRune
    case untypedFloat
    case untypedComplex
    case untypedString
    case untypedNil

    // aliases
    case byte // Uint8
    case rune // Int32
}

class GoBasicType: GoType {
    let kind: GoBasicKind
    
    init(kind: GoBasicKind) {
        self.kind = kind
    }
}

class GoArrayType: GoType {
    let len: Int?
    let elem: GoType
    
    init(len: Int, elem: GoType) {
        self.len = len
        self.elem = elem
    }
    
    init(elem: GoType) {
        self.len = nil
        self.elem = elem
    }
}

class GoSliceType: GoType {
    let elem: GoType
    
    init(elem: GoType) {
        self.elem = elem
    }
}


enum GoVarSituation {
    case field
    case param
    case variable
}


class GoVar {
    let name: String
    let typ: GoType?
    let situation: GoVarSituation
    
    init(name: String, typ: GoType, situation: GoVarSituation) {
        self.name = name
        self.typ = typ
        self.situation = situation
    }
}


class GoStructType: GoType {
    let fields: [GoVar]
    let tags: [String]
    
    init(fields: [GoVar], tags: [String]) {
        self.fields = fields
        self.tags = tags
    }
}


class GoPointerType: GoType {
    let base: GoType
    
    init(base: GoType) {
        self.base = base
    }
}

class GoTupleType: GoType {
    let vars: [GoVar]
    
    init(vars: [GoVar]) {
        self.vars = vars
    }
}

class GoSignatureType: GoType {
    let recv: GoVar?
    let params: GoTupleType
    let results: GoTupleType
    let variadic: Bool
    
    init(recv: GoVar?, params: GoTupleType, results: GoTupleType, variadic: Bool) {
        self.recv = recv
        self.params = params
        self.results = results
        self.variadic = variadic
    }
}


class GoFunc {
    let name: String
    let sig: GoSignatureType
    
    init(name: String, sig: GoSignatureType) {
        self.name = name
        self.sig = sig
    }
}

class GoInterfaceType: GoType {
    let methods: [GoFunc]
    let embeddeds: [GoType]
    
    init(methods: [GoFunc], embeddeds: [GoType]) {
        self.methods = methods
        self.embeddeds = embeddeds
    }
}


class GoMapType: GoType {
    let key: GoType
    let elem: GoType
    
    init(key: GoType, elem: GoType) {
        self.key = key
        self.elem = elem
    }
}

enum GoChanDir {
    case sendrecv
    case sendonly
    case recvonly
}

class GoChanType: GoType {
    let dir: GoChanDir
    let elem: GoType
    
    init(dir: GoChanDir, elem: GoType) {
        self.dir = dir
        self.elem = elem
    }
}

class GoTypeName {
    let name: String
    let typ: GoType
    
    init(name: String, typ: GoType) {
        self.name = name
        self.typ = typ
    }
}

class GoNamedType: GoType {
    let obj: GoTypeName
    let orig: GoType
    let underling: GoType
    let methods: [GoFunc]
    
    init(obj: GoTypeName, orig: GoType, underling: GoType, methods: [GoFunc]) {
        self.obj = obj
        self.orig = orig
        self.underling = underling
        self.methods = methods
    }
}
