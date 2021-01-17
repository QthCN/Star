//
//  File.swift
//  
//
//  Created by 秦天欢 on 2020/12/13.
//

import Foundation
import Common


class GoType: Type {
    // 当前该type是否已经完整，对于完整的type来说不需要再进行类型推断
    func complete() -> Bool {
        return false
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

// 类似于nil，主要是在tupleType里使用
class GoUnknownType: GoType {
    
}

class GoBasicType: GoType {
    var kind: GoBasicKind
    
    init(kind: GoBasicKind) {
        self.kind = kind
    }
    
    override func complete() -> Bool {
        return true
    }
}

class GoArrayType: GoType {
    private var _complete: Bool = false
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
    
    override func complete() -> Bool {
        if self._complete {
            return self._complete
        }
        self._complete = self.len != nil && self.elem != nil && self.elem!.complete()
        return self._complete
    }
}

class GoSliceType: GoType {
    private var _complete: Bool = false
    var elem: GoType?
    
    init(elem: GoType) {
        self.elem = elem
    }
    
    override func complete() -> Bool {
        if self._complete {
            return self._complete
        }
        self._complete = self.elem != nil && self.elem!.complete()
        return self._complete
    }
}


enum GoVarSituation {
    // stuct的field
    case field
    // 函数参数或者是返回类型参数
    case param
}


class GoVar {
    private var _complete: Bool = false
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
    
    func complete() -> Bool {
        if self._complete {
            return self._complete
        }
        self._complete = self.name != nil && self.typ != nil && self.typ!.complete()
        return self._complete
    }
}


class GoStructType: GoType {
    private var _complete: Bool = false
    var fields: [GoVar] = []
    
    init(fields: [GoVar]) {
        self.fields = fields
    }
    
    func addField(field: GoVar) {
        self.fields.append(field)
        self._complete = self._complete && field.complete()
    }
    
    override func complete() -> Bool {
        if self._complete {
            return self._complete
        }
        
        for f in fields {
            if f.complete() == false {
                return false
            }
        }
        
        self._complete = true
        return self._complete
    }
}


class GoPointerType: GoType {
    private var _complete: Bool = false
    var base: GoType?
    
    init(base: GoType) {
        self.base = base
    }
    
    override func complete() -> Bool {
        if self._complete {
            return self._complete
        }
        self._complete = self.base != nil && self.base!.complete()
        return self._complete
    }
}

class GoTupleType: GoType {
    private var _complete: Bool = false
    var vars: [GoVar] = []
    
    init(vars: [GoVar]) {
        self.vars = vars
    }
    
    override func complete() -> Bool {
        if self._complete {
            return self._complete
        }
        
        for v in self.vars {
            if v.complete() == false {
                return false
            }
        }
        
        self._complete = true
        return self._complete
    }
}

class GoSignatureType: GoType {
    private var _complete: Bool = false
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
    
    override func complete() -> Bool {
        if self._complete {
            return self._complete
        }
        self._complete = self.recv != nil && self.recv!.complete() && self.params != nil && self.params!.complete() && self.results != nil && self.results!.complete()
        return self._complete
    }
}


class GoFunc {
    private var _complete: Bool = false
    var name: String
    var sig: GoSignatureType
    
    init(name: String, sig: GoSignatureType) {
        self.name = name
        self.sig = sig
    }
    
    func complete() -> Bool {
        if self._complete {
            return self._complete
        }
        self._complete = self.sig.complete()
        return self._complete
    }
}

class GoInterfaceType: GoType {
    private var _complete: Bool = false
    var methods: [GoFunc] = []
    var embeddeds: [GoType] = []
    
    init(methods: [GoFunc], embeddeds: [GoType]) {
        self.methods = methods
        self.embeddeds = embeddeds
    }
    
    func addMethod(method: GoFunc) {
        self.methods.append(method)
        self._complete = self._complete && method.complete()
    }
    
    func addEmbeded(embeded: GoType) {
        self.embeddeds.append(embeded)
        self._complete = self._complete && embeded.complete()
    }
    
    override func complete() -> Bool {
        if self._complete {
            return self._complete
        }
        
        for m in self.methods {
            if m.complete() == false {
                return false
            }
        }
        
        for e in self.embeddeds {
            if e.complete() == false {
                return false
            }
        }
        
        self._complete = true
        return self._complete
    }
}


class GoMapType: GoType {
    private var _complete: Bool = false
    var key: GoType?
    var elem: GoType?
    
    init(key: GoType, elem: GoType) {
        self.key = key
        self.elem = elem
    }
    
    override func complete() -> Bool {
        if self._complete {
            return self._complete
        }
        self._complete = self.key != nil && self.key!.complete() && self.elem != nil && self.elem!.complete()
        return self._complete
    }
}

enum GoChanDir {
    case sendrecv
    case sendonly
    case recvonly
}

class GoChanType: GoType {
    private var _complete: Bool = false
    var dir: GoChanDir
    var elem: GoType?
    
    init(dir: GoChanDir, elem: GoType) {
        self.dir = dir
        self.elem = elem
    }
    
    override func complete() -> Bool {
        if self._complete {
            return self._complete
        }
        self._complete = self.elem != nil && self.elem!.complete()
        return self._complete
    }
}


class GoNamedType: GoType {
    private var _complete: Bool = false
    var name: String?
    var typ: GoType?
    var methods: [GoFunc] = []
    
    init(name: String, typ: GoType, methods: [GoFunc]) {
        self.name = name
        self.typ = typ
        self.methods = methods
    }
    
    func addMethod(method: GoFunc) {
        self.methods.append(method)
        self._complete = self._complete && method.complete()
    }
    
    override func complete() -> Bool {
        if self.name != nil && self.typ != nil && self.typ!.complete() == false {
            return false
        }
        
        for f in self.methods {
            if f.complete() == false {
                return false
            }
        }
        
        self._complete = true
        return self._complete
    }
}
