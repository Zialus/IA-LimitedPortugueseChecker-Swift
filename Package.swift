// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "TugaChecker",
    dependencies: [
        .package(url: "https://github.com/onevcat/Rainbow.git", from: "3.0.0")
    ],
    targets: [
        .target(
            name: "TugaChecker",
            dependencies: ["Rainbow"]
        )
    ]
)
