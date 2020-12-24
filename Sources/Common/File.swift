//
//  File.swift
//  
//
//  Created by 秦天欢 on 2020/12/14.
//

import Foundation

public class FileSystemObject: CustomStringConvertible {
    var isDir: Bool = false
    var path: String = ""
    var name: String = ""

    public init() {
        // 如果什么都没有提供则生成根目录
        self.path = ""
        self.name = ""
        self.isDir = true
    }

    public init(path: String, name: String, isDir: Bool = false) {
        self.path = path
        self.name = name
        self.isDir = isDir
    }

    public func rpath() -> String {
        if self.path == "" {
            return self.name
        } else if self.name == "" {
            return self.path
        } else {
            return "\(self.path)/\(self.name)"
        }
    }
    
    public func dir() -> Bool {
        return self.isDir
    }
    
    public func objName() -> String {
        return self.name
    }
    
    public func objPath() -> String {
        return self.path
    }
    
    public var description: String {
        return "\(self.rpath())"
    }
}

public protocol FileSystem {
    // 列出对象的文件内容
    func getFileContent(item: FileSystemObject) -> String?
    // 列出目录下对象
    func listItems(path: FileSystemObject) -> [FileSystemObject]
}


public class MacFileSystem: FileSystem {
    private let rootItem: FileSystemObject

    public init(rootDir: String) {
        self.rootItem = FileSystemObject()
        self.rootItem.isDir = true
        self.rootItem.path = ""
        self.rootItem.name = rootDir
    }

    public func getFileContent(item: FileSystemObject) -> String? {
        let fullPath = "\(self.rootItem.name)/\(item.rpath())"
        let fm = FileManager.default
        if fm.fileExists(atPath: fullPath) {
            if let data = fm.contents(atPath: fullPath) {
                return  String(decoding: data, as: UTF8.self)
                // TODO no idea why fm.contents can not return content at first call
            } else if let data = fm.contents(atPath: fullPath) {
                return  String(decoding: data, as: UTF8.self)
            } else {
                print("can not get content at \(fullPath)")
                return ""
            }
        } else {
            print("file not exist, can not get content at \(fullPath)")
            return ""
        }


    }

    public func listItems(path: FileSystemObject) -> [FileSystemObject] {
        let fullPath = "\(self.rootItem.name)/\(path.rpath())"
        let fm = FileManager.default
        do {
            var records: [FileSystemObject] = []
            let items = try fm.contentsOfDirectory(atPath: fullPath)
            for item in items {
                let itemPath = "\(fullPath)/\(item)"
                var isDir: ObjCBool = false
                if fm.fileExists(atPath: itemPath, isDirectory: &isDir) {
                    if isDir.boolValue {
                        let obj = FileSystemObject(path: path.rpath(), name: item, isDir: true)
                        records.append(obj)
                    } else {
                        let obj = FileSystemObject(path: path.rpath(), name: item, isDir: false)
                        records.append(obj)
                    }
                }
            }
            return records
        } catch  {
            print(error.localizedDescription)
            return []
        }

    }
}
