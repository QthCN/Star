//
//  File.swift
//  
//
//  Created by 秦天欢 on 2021/1/23.
//

import Foundation
import Common


class GoMod {
    private var goModFile: FileSystemObject?
    private var content: String = ""
    
    private var moduleName: String = ""
    
    init(f: FileSystemObject, c: String) {
        self.goModFile = f
        self.content = c
        
        self.parse()
    }
    
    private func parse() {
        let lines = self.content.components(separatedBy: .newlines)
        
        // 解析module,第一行
        for line in lines {
            if line.hasPrefix("module") {
                let parts = line.components(separatedBy: .whitespaces)
                if parts.count > 1 {
                    self.moduleName = parts[1]
                }
            }
        }
        
    }
    
    func module() -> String {
        return self.moduleName
    }
}
