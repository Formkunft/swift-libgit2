# Clibgit2 – Swift Package for libgit2

This is a Swift package for linking to the [libgit2](https://libgit2.org) library.
macOS is currently the only supported platform given the build configuration in the package manifest.

This package does not provide any Swift API overlay and instead just offers access to the C API.

## Usage

Include this package as a dependency like so:

```swift
let package = Package(
	// ...
	platforms: [
		.macOS(.v11),
	],
	// ...
	dependencies: [
		.package(url: "https://github.com/Formkunft/Clibgit2", from: "1.9.0"),
	],
	// ...
)
```

The version numbers of this package follow the version numbers of libgit2.
