// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Star",
    products: [
        .library(
            name: "Star",
            targets: ["Star", "Go"]),
    ],
    dependencies: [
        .package(name: "swift-tree-sitter",  url: "../swift-tree-sitter", .branch("main"))
    ],
    targets: [
        // Star 包含各种公共类、基类
        .target(
            name: "Star",
            dependencies: [
                .product(name: "SwiftTreeSitter", package: "swift-tree-sitter"),
            ],
            path: "Sources/Star"),
        // Go Go语言相关的源码
        .target(
            name: "Go",
            dependencies: [
                "Star"
            ],
            path: "Sources/Go"),
        .testTarget(
            name: "StarTests",
            dependencies: ["Star"],
            path: "Tests/StarTests"),
        .testTarget(
            name: "GoTests",
            dependencies: ["Go"],
            path: "Tests/GoTests"),
    ]
)
