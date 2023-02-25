// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "TreeSitterLua",
    platforms: [.macOS(.v10_13), .iOS(.v11)],
    products: [
        .library(name: "TreeSitterLua", targets: ["TreeSitterLua"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "TreeSitterLua",
                path: ".",
                exclude: [
                    "binding.gyp",
                    "bindings",
                    "Cargo.toml",
                    "examples",
                    "grammar.js",
                    "package.json",
                    "README.md",
                    "src/grammar.json",
                    "src/node-types.json",
                    // any additional files to exclude 
                ],
                sources: [
                    "src/parser.c",
                    "src/scanner.c", // this might be `scanner.c` or not present at all
                ],
                resources: [
                    .copy("queries")
                ],
                publicHeadersPath: "bindings/swift",
                cSettings: [.headerSearchPath("src")])
    ]
)
