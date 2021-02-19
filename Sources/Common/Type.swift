//
//  Type.swift
//  
//
//  Created by 秦天欢 on 2020/12/13.
//

import Foundation

public protocol Type {
    func position() -> SymbolPosition?
    func toString() -> String
}
