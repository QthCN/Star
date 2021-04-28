//
//  File.swift
//  
//
//  Created by 秦天欢 on 2021/4/13.
//

import Foundation
import Common


public class JavaType: Type {
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

enum JavaBasicKind {
    case invalid
    
    case void
    
    // predeclared types
    case byte
    case short
    case int
    case long
    case float
    case double
    case boolean
    case char
    case string
}

class JavaUnknownType: JavaType {
    
}

class JavaBasicType: JavaType, CustomStringConvertible {
    var kind: JavaBasicKind
    
    init(kind: JavaBasicKind) {
        self.kind = kind
    }
    
    public var description: String {
        return "\(self.kind)"
    }
}


public class JavaTypeVariable: JavaType {
    var name: String? = ""
    var bounds: [JavaType] = []
    
    public func setName(name: String) {
        self.name = name
    }
    
    public func setBounds(bounds: [JavaType]) {
        self.bounds = bounds
    }
    
}

public class JavaParameterizedType: JavaType {
    var typeArguments: [JavaType] = []
    // TODO weak?
    var rawType: JavaType? = nil
    
    public func setTypeArguments(typeArguments: [JavaType]) {
        self.typeArguments = typeArguments
    }
    
    public func setRawType(rawType: JavaType) {
        self.rawType = rawType
    }
}

public class JavaGenericArrayType: JavaType {
    // TODO weak?
    var componentType: JavaType? = nil
    
    public func setComponentType(componentType: JavaType) {
        self.componentType = componentType
    }
}

public class JavaWildcardType: JavaType {
    var upperBounds: [JavaType] = []
    var lowerBounds: [JavaType] = []
    
    func setUpperBounds(upperBounds: [JavaType]) {
        self.upperBounds = upperBounds
    }
    
    func setLowerBounds(lowerBounds: [JavaType]) {
        self.lowerBounds = lowerBounds
    }
}

public class JavaSignatureType: JavaType {
    var params: [JavaVar] = []
    var result: JavaVar?
}


public class JavaVar: JavaType {
    var name: String?
    var rawType: JavaType?
    weak var node: JavaAST?
    
    init(name: String) {
        self.name = name
    }
    
    override init() {
        
    }
}


public class JavaMethod: JavaType {
    var name: String
    var sig: JavaSignatureType?
    weak var node: JavaAST?
    
    init(name: String, sig: JavaSignatureType) {
        self.name = name
        self.sig = sig
    }
    
    init(name: String) {
        self.name = name
    }
    
    func setSignature(sig: JavaSignatureType) {
        self.sig = sig
    }
}


// Class/Enum/Interface
public class JavaObjectype: JavaParameterizedType {
    var name: String
    var superClasses: [JavaType] = []
    var superInterfaces: [JavaType] = []
    var varMembers: [JavaVar] = []
    var methodMembers: [JavaMethod] = []
    var classMembers: [JavaObjectype] = []
    
    init(name: String) {
        self.name = name
    }
}

// 类型实例，包含type argument的实际值
public class JavaConcreteType: JavaType {
    var names: [String:JavaType] = [:]
    var rawType: JavaType? = nil
    
    public func setRawType(rawType: JavaType) {
        self.rawType = rawType
    }
}

// & 连接的type
public class JavaSumType: JavaType {
    var types: [JavaType] = []
}
