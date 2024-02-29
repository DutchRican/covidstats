// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "covidstats",
    platforms: [
        .macOS(.v12)
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.4.0"),
        .package(url: "https://github.com/scinfu/SwiftSoup.git", from: "2.3.0"),
        .package(url: "https://github.com/scottrhoyt/SwiftyTextTable.git", from: "0.5.0")
    ],
    targets: [
        .executableTarget(
            name: "covidstats",
            dependencies: [.product(
                name: "ArgumentParser",
                package: "swift-argument-parser"),
                           "SwiftSoup", "SwiftyTextTable"
            ]),
        .testTarget(
            name: "CovidStatsTests",
            dependencies: ["covidstats","SwiftSoup"]),
    ]
)
