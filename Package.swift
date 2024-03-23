// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WireGuardKit",
    platforms: [
        .macOS(.v12),
        .iOS(.v15),
        .tvOS(.v17)
    ],
    products: [
        .library(
            name: "WireGuardKit",
            targets: [
                "WireGuardKit",
                "WireGuardKitGo"
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/passepartoutvpn/wg-go-apple", from: "0.0.20240326")
    ],
    targets: [
        .target(
            name: "WireGuardKit",
            dependencies: ["WireGuardKitC"]
        ),
        .target(
            name: "WireGuardKitC",
            dependencies: [],
            publicHeadersPath: "."
        ),
        .target(
            name: "WireGuardKitGo",
            dependencies: [
                "WireGuardKit",
                "wg-go-apple"
            ]
        )
    ]
)
