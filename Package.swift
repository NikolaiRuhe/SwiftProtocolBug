// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TestID",
    platforms: [
        .iOS(.v11), .macOS(.v10_11),
    ],
    products: [
        .library(
            name: "TestID",
            targets: ["TestID"]),
    ],
    targets: [
        .target(
            name: "TestID",
            dependencies: []),
        .testTarget(
            name: "TestIDTests",
            dependencies: ["TestID"]),
    ]
)
