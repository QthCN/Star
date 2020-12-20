//
//  File.swift
//  
//
//  Created by 秦天欢 on 2020/12/20.
//

import Foundation
import Common


// 执行分析，分析的结果存在AST节点中
class GoDeclVisiter: GoVisiter {
    
    var cu: CompilationUnion
    var pkgScope: Scope
    var currentScope: Scope
    init(cu: CompilationUnion, pkgScope: Scope) {
        self.cu = cu
        self.pkgScope = pkgScope
        self.currentScope = Scope(parent: self.pkgScope, name: "File")
        super.init()
        self.handleError = true
    }
    
    func pushScope(_ name: String = "Anonymous") {
        let newScope = Scope(parent: self.currentScope, name: name)
        self.currentScope = newScope
    }
    
    func popScope() {
        self.currentScope = self.currentScope.parent ?? self.currentScope
    }
    
    override func visit_node(_ node: GoAST) {
        super.visit_node(node)
        node.setScope(self.currentScope)
    }
    
    override func visit_argument_list(_ node: goast_argument_list) {
        // TODO
    }
    
    
}
