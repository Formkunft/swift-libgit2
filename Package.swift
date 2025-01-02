// swift-tools-version:5.10
import PackageDescription

let package = Package(
	name: "Clibgit2",
	products: [
		.library(name: "Clibgit2", targets: ["Clibgit2"]),
	],
	targets: [
		.target(
			name: "Clibgit2",
			exclude: [
				"deps/llhttp/CMakeLists.txt",
				"deps/llhttp/LICENSE-MIT",
				"deps/pcre/CMakeLists.txt",
				"deps/pcre/COPYING",
				"deps/pcre/LICENCE",
				"deps/pcre/cmake",
				"deps/pcre/config.h.in",
				"deps/xdiff/CMakeLists.txt",
				"deps/zlib/CMakeLists.txt",
				"deps/zlib/LICENSE",
				"src/libgit2/CMakeLists.txt",
				"src/libgit2/config.cmake.in",
				"src/libgit2/experimental.h.in",
				"src/libgit2/git2.rc",
				"src/util/CMakeLists.txt",
				"src/util/git2_features.h.in",
				"src/util/hash/builtin.c",
				"src/util/hash/builtin.h",
				"src/util/hash/collisiondetect.c",
				"src/util/hash/collisiondetect.h",
				"src/util/hash/openssl.c",
				"src/util/hash/openssl.h",
				"src/util/hash/win32.c",
				"src/util/hash/win32.h",
				"src/util/win32",
			],
			sources: [
				"deps/llhttp",
				"deps/pcre",
				"deps/xdiff",
				"deps/zlib",
				"src/libgit2",
				"src/util",
			],
			publicHeadersPath: "include",
			cSettings: [
				.unsafeFlags([
					// fix 'struct entry' causing build conflict
					"-fno-modules",
					// disable warning: 'Implicit conversion loses integer precision'
					"-Wno-shorten-64-to-32",
				]),
                
				.headerSearchPath("src/libgit2"),
				.headerSearchPath("src/util"),
				.headerSearchPath("deps/llhttp"),
				.headerSearchPath("deps/pcre"),
				.headerSearchPath("deps/xdiff"),
				.headerSearchPath("deps/zlib"),
                
				.define("LIBGIT2_NO_FEATURES_H"),
				.define("GIT_ARCH_64"),
				.define("GIT_QSORT_BSD"),
				.define("GIT_IO_POLL"),
				.define("GIT_DEPRECATE_HARD"),
                
				.define("GIT_THREADS"),
				.define("GIT_QSORT_BSD"),
				.define("GIT_IO_POLL"),
                
				// SSH
				.define("GIT_SSH"),
				.define("GIT_SSH_EXEC"),
				.define("GIT_SHA1_COMMON_CRYPTO"),
				.define("GIT_SHA256_COMMON_CRYPTO"),
                
				// HTTP
				.define("GIT_HTTPS"),
				.define("GIT_HTTPPARSER_BUILTIN"),
				.define("GIT_SECURE_TRANSPORT"),
                
				// PCRE
				.define("GIT_REGEX_BUILTIN"),
				.define("SUPPORT_PCRE8"),
				.define("LINK_SIZE", to: "2"),
				.define("PARENS_NEST_LIMIT", to: "250"),
				.define("MATCH_LIMIT", to: "10000000"),
				.define("MATCH_LIMIT_RECURSION", to: "10000000"),
				.define("NO_RECURSE"),
				.define("NEWLINE", to: "10"), // line feed
				.define("POSIX_MALLOC_THRESHOLD", to: "10"),
				.define("BSR_ANYCRLF", to: "0"),
				.define("MAX_NAME_SIZE", to: "32"),
				.define("MAX_NAME_COUNT", to: "10000"),
                
				// iconv encoding conversion support
				.define("GIT_USE_ICONV"),
			],
			linkerSettings: [
				.linkedLibrary("iconv"),
				.linkedLibrary("z"),
			]
		),
	]
)
