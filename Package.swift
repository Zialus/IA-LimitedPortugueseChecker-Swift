// swift-tools-version:6.1

import PackageDescription

let package = Package(
    name: "TugaChecker",
    dependencies: [
        .package(url: "https://github.com/onevcat/Rainbow.git", from: "4.2.1"),
        .package(url: "https://github.com/SimplyDanny/SwiftLintPlugins", from: "0.65.1")
    ],
    targets: [
        .executableTarget(
            name: "TugaChecker",
            dependencies: ["Rainbow"]
        )
    ]
)
