public protocol Parser {
    
    func parse(content: String) -> CompilationUnion
    
}

public class CompilationUnion {
    let ast: AST?
    let content: String
    
    public init(ast: AST, content: String) {
        self.ast = ast
        self.content = content
    }
    
    public init(content: String) {
        self.ast = nil
        self.content = content
    }
    
    public func inError() -> Bool {
        return self.ast == nil
    }
}
