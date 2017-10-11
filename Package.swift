
import PackageDescription

let package = Package(
    name: "PoemBot",
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor", majorVersion: 2)
        ]
)
