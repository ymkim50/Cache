// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "Cache",
    platforms: [
        .macOS(.v10_14),
        .iOS(.v12),
        .tvOS(.v12),
    ],
    products: [
        .library(name: "Cache", targets: ["Cache"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "Cache", path: "Source/Shared"),  //, exclude: ["Library/ImageWrapper.swift"]), // relative to the target path
        .target(name: "Cache", path: "Source/iOS"),  //, exclude: ["Library/ImageWrapper.swift"]), // relative to the target path
        .target(name: "Cache", path: "Source/Mac"),
        .testTarget(name: "CacheTests", dependencies: ["Cache"], path: "Tests"),
    ]
)
