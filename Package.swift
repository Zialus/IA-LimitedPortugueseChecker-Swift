import PackageDescription

let package = Package(
    name: "TugaChecker",
    dependencies: [
        .Package(url: "https://github.com/onevcat/Rainbow.git", majorVersion: 2)
    ]
)
