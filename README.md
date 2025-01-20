# Clibgit2 – Swift Package for libgit2

This Swift package provides access to the libgit2 C API without any Swift API overlay.

## Usage

Include this package as a dependency like so:

```swift
let package = Package(
	// ...
	dependencies: [
		.package(url: "https://github.com/Formkunft/Clibgit2", from: "1.9.0"),
	],
	targets: [
		.target(
			// ...
			dependencies: [
				"Clibgit2",
			]),
	]
)
```

The version numbers of this package follow the version numbers of libgit2.
