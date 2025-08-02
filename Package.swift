// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "ImageDownloaderBinarySDK", // 🚨 Rename to avoid conflict
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "ImageDownloaderBinarySDK", // 🚨 Also rename the product
            targets: ["ImageDownloaderBinaryTarget"] // ✅ Use new target name
        )
    ],
    targets: [
        .binaryTarget(
            name: "ImageDownloaderBinaryTarget", // ✅ Must not match anything else
            url: "https://github.com/prachipb09/ImageCacherSDK/releases/download/1.0.0/ImageDownloaderSDK.xcframework.zip",
            checksum: "53cc9dd08e9caa317d587ab820db27c586349c734508a9c176e26ac6cf89f5a7"
        )
    ]
)
