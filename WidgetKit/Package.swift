// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "WidgetKit",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "WidgetKit",
            targets: ["WidgetKit"]),
    ],
    targets: [
        .target(
            name: "WidgetKit"),
        .testTarget(
            name: "WidgetKitTests",
            dependencies: ["WidgetKit"]
        ),
    ]
)
