//
//  File 2.swift
//  
//
//  Created by 秦天欢 on 2020/12/15.
//

import Foundation

public protocol Analyzer {
    // 在对应目录上执行分析，执行分析后可以调用其它方法获取信息
    func analysis(fs: FileSystem, config: Configuration)
    
    /// 基本操作
    
    // 获取某个文件的cu，一个cu代表一个被tree-sitter parse过后的对象。对于cu来说type层面的semantic的信息不一定要提供，具体是否系统可以通过symbolInfo判断。一般来说可以认为一个cu就是一个文件
    func cu(fs: FileSystemObject) -> CompilationUnion?
    // 获取某个位置的符号信息。符号的通用信息（例如符号类型、定义等）会由这个信息自带，符号的额外信息（例如CallGraph）可以通过具体动作函数获取。
    func symbolInfo(cu: CompilationUnion, offset: Int) -> SymbolInfo?
    
    /// 作用在SymbolInfo上的动作
    
    // 获取某个符号的callGraph信息
    func callGraph(symbol: SymbolInfo) -> CGCaller?
    
    // 获取某个文件的structure信息
    func structure(cu: CompilationUnion) -> [Structure]
}
