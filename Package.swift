// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "BamwareSettings",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "BamwareSettings", targets: ["BamwareSettings"]),
    ],
    dependencies: [
        .package(url: "https://github.com/groue/GRDB.swift.git", from: "6.0.0")
    ],
    targets: [
        .target(
            name: "BamwareSettings",
            dependencies: [.product(name: "GRDB", package: "GRDB.swift")]
        )
    ]
)