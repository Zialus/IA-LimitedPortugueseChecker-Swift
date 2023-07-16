// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "TugaChecker",
    dependencies: [
        .package(url: "https://github.com/onevcat/Rainbow.git", from: "4.0.1")
    ],
    targets: [
        .executableTarget(
            name: "TugaChecker",
            dependencies: ["Rainbow"]
        )
    ]
)
