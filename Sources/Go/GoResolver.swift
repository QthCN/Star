//
//  File.swift
//  
//
//  Created by 秦天欢 on 2020/12/14.
//

import Foundation
import Common

public class GoResolver: Resolver {
    var fs: FileSystem! = nil
    var parser: GoParser! = nil
    
    public func setFileSystem(fs: FileSystem) {
        self.fs = fs
    }
    
    public func setParser(parser: Parser) {
        self.parser = parser as? GoParser
    }
    
    
    
    
}
