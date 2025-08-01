// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "ImageDownloaderSDK",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "ImageDownloaderSDK",
            targets: ["ImageDownloaderSDK"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "ImageDownloaderSDK",
            url: "https://github.com/prachipb09/ImageCacherSDK/releases/download/1.0.0/ImageDownloaderSDK.xcframework.zip",
            checksum: "53cc9dd8e9c9caa317d587ab82e56ae80781c23045c09a7e709a602bd8e2382e"
        )
    ]
)
