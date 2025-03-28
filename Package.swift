// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "BamwareSettings",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "BamwareSettings", targets: ["BamwareSettings"]),
    ],
    dependencies: [
        .package(url: "https://github.com/mrbam88/BamwareCore.git", branch: "main"),
        .package(url: "https://github.com/groue/GRDB.swift.git", from: "6.0.0")
    ],
    targets: [
        .target(
            name: "BamwareSettings",
            dependencies: [
                "BamwareCore",
                .product(name: "GRDB", package: "GRDB.swift")
            ]
        ),
        .testTarget(
            name: "BamwareSettingsTests",
            dependencies: ["BamwareSettings"]
        )
    ]
)
