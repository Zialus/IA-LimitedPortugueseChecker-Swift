// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "TugaChecker",
    dependencies: [
        .package(url: "https://github.com/onevcat/Rainbow.git", from: "4.0.0")
    ],
    targets: [
        .target(
            name: "TugaChecker",
            dependencies: ["Rainbow"]
        )
    ]
)
