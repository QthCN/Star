import SwiftTreeSitter
import TreeSitterLanguages

open class Parser {
    
    public var tsParser = SwiftTreeSitter.Parser()
    public var content: String = ""
    
    public init() {
        
    }
    
    open func parse(content: String) -> CompilationUnion {
        return CompilationUnion(content: content)
    }
    
}

public class CompilationUnion {
    let ast: AST?
    let content: String.UTF8View
    
    public init(ast: AST, content: String) {
        self.ast = ast
        self.content = content.utf8
    }
    
    public init(content: String) {
        self.ast = nil
        self.content = content.utf8
    }
    
    public func inError() -> Bool {
        return self.ast == nil
    }
    
    public func getAST() -> AST? {
        return self.ast
    }
    
    public func codes(pos: Position) -> String {
        let startIndex = self.content.index(self.content.startIndex, offsetBy: pos.startBytes)
        let endIndex = self.content.index(self.content.startIndex, offsetBy: pos.endBytes)
        return String(self.content[startIndex..<endIndex])!
    }
    
    public func codesBetweenPos(_ posA: Position, _ posB: Position) -> String {
        let startIndex = self.content.index(self.content.startIndex, offsetBy: posA.endBytes)
        let endIndex = self.content.index(self.content.startIndex, offsetBy: posB.startBytes)
        return String(self.content[startIndex..<endIndex])!
    }
}
