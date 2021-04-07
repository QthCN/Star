//
//  File.swift
//  
//
//  Created by 秦天欢 on 2021/4/7.
//

import Foundation
import Common

public class JavaAnalyzer: Analyzer {
    var fs: FileSystem! = nil
    var config: Configuration = Configuration()
    let queue = DispatchQueue(label: "star.javaanalyzer", qos: .userInteractive, attributes: .concurrent)
    
    public init() {}
    
    public func analysis(fs: FileSystem, config: Configuration) {
        self.fs = fs
        self.config = config
        self.reset()
        self.analysis()
        print("java analysis finished")
    }
    
    func reset() {
        
    }
    
    func analysis() {
        
    }
    
    public func cu(fs: FileSystemObject) -> CompilationUnion? {
        // TODO
        return nil
    }
    
    public func symbolInfo(cu: CompilationUnion, offset: Int) -> SymbolInfo? {
        // TODO
        return nil
    }
    
    public func callGraph(symbol: SymbolInfo) -> CGCaller? {
        // TODO
        return nil
    }
    
    func isJavaProject() -> Bool {
        // 搜索三层目录看是否有java结尾的文件，有的话就认为是java的项目
        let topDirItems = self.fs.listItems(path: FileSystemObject())
        for topDirItem in topDirItems {
            if !topDirItem.dir() && topDirItem.objName().hasSuffix(".java") {
                return true
            }
            
            if topDirItem.dir() {
                let subDirItems = self.fs.listItems(path: topDirItem)
                for subDirItem in subDirItems {
                    if !subDirItem.dir() && subDirItem.objName().hasSuffix(".java") {
                        return true
                    }
                }
                
                for subDirItem in subDirItems {
                    if subDirItem.dir() {
                        let subSubDirItems = self.fs.listItems(path: subDirItem)
                        for subSubDirItem in subSubDirItems {
                            if !subSubDirItem.dir() && subSubDirItem.objName().hasSuffix(".java") {
                                return true
                            }
                        }
                    }
                }
            }
        }
        
        return false
    }
}

