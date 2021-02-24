//
//  File 2.swift
//  
//
//  Created by 秦天欢 on 2020/12/15.
//

import Foundation

public protocol Analyzer {
    func analysis(fs: FileSystem, config: Configuration)
    func cu(fs: FileSystemObject) -> CompilationUnion?
    func symbolInfo(cu: CompilationUnion, offset: Int) -> SymbolInfo?
    func callGraph(cu: CompilationUnion, symbol: SymbolInfo) -> CGCaller?
}
