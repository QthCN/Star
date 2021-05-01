//
//  File.swift
//  
//
//  Created by 秦天欢 on 2021/3/18.
//

import Foundation
import Common

public class CPPAnalyzer: Analyzer {
    public init() {}
    
    public func analysis(fs: FileSystem, config: Configuration) {
        // TODO
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
    
    public func structure(cu: CompilationUnion) -> [Structure] {
        // TODO
        return []
    }
}
