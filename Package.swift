// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NetworkingModule",
        platforms: [.iOS(.v13)],
        products: [
            .library(name: "NetworkingModule", targets: ["NetworkingModule"]),
        ],
        dependencies: [],
        targets: [
            .target(
                name: "NetworkingModule",
                dependencies: []
            ),
        ]
)

