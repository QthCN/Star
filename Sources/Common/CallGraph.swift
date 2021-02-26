//
//  File 2.swift
//  
//
//  Created by 秦天欢 on 2021/2/24.
//

import Foundation


public class CGNode {
    public var pos: String = ""
    
    public init(pos: String) {
        self.pos = pos
    }
}


// 调用方节点
public class CGCaller: CGNode {
    // 调用方节点函数名
    public var name: String = ""
    // 被调用节点信息
    public var nodes: [CGNode] = []
    
    public override init(pos: String) {
        super.init(pos: pos)
    }
}

// 被调用节点
public class CGCallee: CGNode {
    // 被调用节点函数名
    public var name: String = ""
    // 被调用节点函数参数
    public var arguments: [CGNode] = []
    
    public override init(pos: String) {
        super.init(pos: pos)
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
    
    public override init(pos: String) {
        super.init(pos: pos)
    }
    
    public func hasData() -> Bool {
        if self.nodesHasData(nodes: self.initialize) { return true }
        if self.nodesHasData(nodes: self.condition) { return true }
        if self.nodesHasData(nodes: self.update) { return true }
        for (_, nodes) in self.branch {
            if self.nodesHasData(nodes: nodes) { return true }
        }
        return false
    }
    
    public func nodesHasData(nodes: [CGNode]) -> Bool {
        for node in nodes {
            if node is CGCallee {
                return true
            } else if node is CGCondition {
                if (node as! CGCondition).hasData() {
                    return true
                }
            }
        }
        return false
    }
}
