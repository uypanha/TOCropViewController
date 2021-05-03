// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

var platforms: [SupportedPlatform] {
    return[.iOS(.v9)]
}

let package = Package(
    name: "TOCropViewController",
    defaultLocalization: "en",
    platforms: platforms,
    products: [
        .library(
            name: "TOCropViewController",
            targets: ["TOCropViewController"]
        ),
        .library(
            name: "CropViewController",
            targets: ["CropViewController"]
        )
    ],
    targets: [
        .target(
            name: "TOCropViewController",
            path: "Objective-C/TOCropViewController/",
			exclude:["Supporting/Info.plist"],
            resources: [.process("Resources")],
            publicHeadersPath: "include"
        ),
        .target(
            name: "CropViewController",
            dependencies: ["TOCropViewController"],
            path: "Swift/CropViewController/",
			exclude:["Info.plist"],
            sources: ["CropViewController.swift"]
        )
    ]
)
