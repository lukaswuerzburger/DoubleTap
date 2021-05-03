// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "DoubleTap",
    platforms: [
        .iOS(.v13),
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
