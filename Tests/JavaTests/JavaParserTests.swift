//
//  File.swift
//  
//
//  Created by 秦天欢 on 2021/4/7.
//

import XCTest
@testable import Java
@testable import Common

final class JavaParserTests: XCTestCase {
    
    let parser = JavaParser()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testParserCreationg() {
        let code = """
        package org.apache.tomcat;

        import java.lang.reflect.InvocationTargetException;

        import javax.naming.NamingException;

        public interface InstanceManager {

            Object newInstance(Class<?> clazz) throws IllegalAccessException, InvocationTargetException,
                    NamingException, InstantiationException, IllegalArgumentException,
                    NoSuchMethodException, SecurityException;

            Object newInstance(String className) throws IllegalAccessException, InvocationTargetException,
                    NamingException, InstantiationException, ClassNotFoundException,
                    IllegalArgumentException, NoSuchMethodException, SecurityException;

            Object newInstance(String fqcn, ClassLoader classLoader) throws IllegalAccessException,
                    InvocationTargetException, NamingException, InstantiationException,
                    ClassNotFoundException, IllegalArgumentException, NoSuchMethodException,
                    SecurityException;

            void newInstance(Object o)
                    throws IllegalAccessException, InvocationTargetException, NamingException;

            void destroyInstance(Object o) throws IllegalAccessException, InvocationTargetException;

            /**
             * Called by the component using the InstanceManager periodically to perform
             * any regular maintenance that might be required. By default, this method
             * is a NO-OP.
             */
            default void backgroundProcess() {
                // NO-OP by default
            }
        }

        """
        var i = 1
        while i <= 10 {
            let cu = parser.parse(content: code)
            i += 1
            //let dv = GoDeclVisiter(cu: cu, pkgScope: Scope(parent: nil, name: ""), fileObject: FileSystemObject())
            //dv.visit_ast(cu.getAST()! as! GoAST)
            
        }
        //let ast = parser.parse(content: code)
        //print(ast)
        
    }
    
}
