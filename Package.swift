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
    swiftLanguageVersions: [v5],
    targets: [
        .target(name: "Cache", path: "Source"),
        .testTarget(name: "CacheTests", dependencies: ["Cache"], path: "Tests"),
    ]
)
