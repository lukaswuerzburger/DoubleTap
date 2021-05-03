// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DoubleTap",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "DoubleTap",
            targets: ["DoubleTap"]
        ),
    ],
    dependencies: [
        .package(name: "ViewInspector", url: "https://github.com/nalexn/ViewInspector", from: "0.7.0")
    ],
    targets: [
        .target(
            name: "DoubleTap",
            dependencies: []
        ),
        .testTarget(
            name: "DoubleTapTests",
            dependencies: ["DoubleTap", "ViewInspector"]
        ),
    ]
)
