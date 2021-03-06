// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Star",
    products: [
        .library(
            name: "Star",
            targets: ["Semantic"]),
    ],
    dependencies: [
        .package(name: "swift-tree-sitter",  url: "../swift-tree-sitter", .branch("main"))
    ],
    targets: [
        // Star 包含各种公共类、基类
        .target(
            name: "Common",
            dependencies: [
                .product(name: "SwiftTreeSitter", package: "swift-tree-sitter"),
            ],
            path: "Sources/Common"),
        // Go Go语言相关的源码
        .target(
            name: "Go",
            dependencies: [
                "Common"
            ],
            path: "Sources/Go"),
        // Java Java语言相关的源码
        .target(
            name: "Java",
            dependencies: [
                "Common"
            ],
            path: "Sources/Java"),
        // CPP C++语言相关的源码
        .target(
            name: "CPP",
            dependencies: [
                "Common"
            ],
            path: "Sources/CPP"),
        // Semantic为对外输出的Module
        .target(
            name: "Semantic",
            dependencies: [
                "Common", "Go", "CPP", "Java"
            ],
            path: "Sources/Semantic"),
        .testTarget(
            name: "GoTests",
            dependencies: ["Go"],
            path: "Tests/GoTests"),
        .testTarget(
            name: "CPPTests",
            dependencies: ["CPP"],
            path: "Tests/CPPTests"),
        .testTarget(
            name: "JavaTests",
            dependencies: ["Java"],
            path: "Tests/JavaTests"),
    ]
)
