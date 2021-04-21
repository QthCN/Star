//
//  File.swift
//  
//
//  Created by 秦天欢 on 2021/4/21.
//

import Foundation
import Common


class JavaExprVisiter: JavaVisiter {
    weak var pkg: JavaPackage!
    weak var cu: CompilationUnion!
    weak var file: FileSystemObject!
    
    
    init(cu: CompilationUnion, pkg: JavaPackage, file: FileSystemObject) {
        self.cu = cu
        self.pkg = pkg
        self.file = file
        super.init()
    }
    
}
