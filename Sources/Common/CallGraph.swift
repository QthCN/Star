//
//  File 2.swift
//  
//
//  Created by 秦天欢 on 2021/2/24.
//

import Foundation


public class CGNode {
    public init() {
        
    }
}


// 调用方节点
public class CGCaller: CGNode {
    // 调用方节点函数名
    public var name: String = ""
    // 被调用节点信息
    public var nodes: [CGNode] = []
    
    public override init() {
        
    }
}

// 被调用节点
public class CGCallee: CGNode {
    // 被调用节点函数名
    public var name: String = ""
    
    public override init() {
        
    }
}

// 条件语句，例如if、while等
public class CGCondition: CGNode {
    // 条件语句类型，例如if、while等
    public var name: String = ""
    // 初始化调用
    public var initialize: [CGNode] = []
    // 条件调用
    public var condition: [CGNode] = []
    // 更新
    public var update: [CGNode] = []
    // 分叉，key为分叉条件，value为对应分叉调用
    public var branch: [String:[CGNode]] = [:]
    
    public override init() {
        
    }
}
