// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "SQLite.swift",
    platforms: [
        .iOS(.v11),
        .macOS(.v10_13),
        .watchOS(.v4),
        .tvOS(.v11)
    ],
    products: [
        .library(
            name: "SQLite",
            targets: ["SQLite"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/stephencelis/CSQLite.git", from: "0.0.3")
    ],
    targets: [
        .target(
            name: "SQLite",
            dependencies: [
                .product(
                    name: "CSQLite",
                    package: "CSQLite",
                    condition: .when(platforms: [.linux, .android])
                )
            ],
            exclude: [
                "Info.plist"
            ]
        ),
        .testTarget(
            name: "SQLiteTests",
            dependencies: [
                "SQLite"
            ],
            path: "Tests/SQLiteTests",
            exclude: [
                "Info.plist"
            ],
            resources: [
                .copy("Resources")
            ]
        )
    ]
)

