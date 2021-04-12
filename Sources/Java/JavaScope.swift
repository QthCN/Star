//
//  File.swift
//  
//
//  Created by 秦天欢 on 2021/4/8.
//

import Foundation
import Common


class JavaGlobalScope: Scope {
    init() {
        super.init(parent: nil, name: "GLOBAL")
        
        // 设置默认的type
        self.declDefaultTypes()
    }
    
    func declDefaultTypes() {
        // TODO 将JavaTypeVisiter中的默认type移到这里
    }
    
}


let globalScope = JavaGlobalScope()
