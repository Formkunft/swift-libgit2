# Swift libgit2

Swift libgit2 is a package that provides access to the libgit2 C API without any Swift API overlay.

The version numbers of this package follow the version numbers of libgit2.

## Using Swift libgit2 in your project

Add `swift-libgit2` as a dependency to your package:

```swift
let package = Package(
    // ...
    dependencies: [
        .package(url: "https://github.com/Formkunft/swift-libgit2", .upToNextMinor(from: "1.9.0")),
    ],
    targets: [
        .target(
            // ...
            dependencies: [
                .product(name: "Clibgit2", package: "swift-libgit2"),
            ]),
    ]
)
```

Then, import `Clibgit2` in your code:

```swift
import Clibgit2

// ...
```
