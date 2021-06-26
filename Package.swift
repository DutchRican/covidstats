// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "covidstats",
    platforms: [
        .macOS(.v10_12)
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.4.0"),
        .package(url: "https://github.com/scinfu/SwiftSoup.git", from: "2.3.0"),
        .package(url: "https://github.com/scottrhoyt/SwiftyTextTable.git", from: "0.5.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "covidstats",
            dependencies: [.product(name: "ArgumentParser", package: "swift-argument-parser"),
            "SwiftSoup", "SwiftyTextTable"
            ]),
        .testTarget(
            name: "covidstatsTests",
            dependencies: ["covidstats","SwiftSoup"]),
    ]
)
