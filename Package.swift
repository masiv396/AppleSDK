// swift-tools-version:5.2
import PackageDescription
let package = Package(
    name: "MyStaticLib",
    products: [
        .library(name: "MasivPushIosSdk", targets: ["MasivPushIosSdk"])
    ],
    targets: [
        .target(name: "MasivPushIosSdk", path: "AppleSDK")
    ]
)
