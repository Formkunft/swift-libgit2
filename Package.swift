// swift-tools-version:5.10
import PackageDescription

let package = Package(
	name: "swift-libgit2",
	products: [
		.library(name: "Clibgit2", targets: ["Clibgit2"]),
	],
	targets: [
		.target(
			name: "Clibgit2",
			exclude: [
				"deps/llhttp/CMakeLists.txt",
				"deps/llhttp/LICENSE-MIT",
				"deps/pcre2/CMakeLists.txt",
				"deps/pcre2/LICENCE.md",
				"deps/pcre2/config.h.in",
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
				"deps/pcre2",
				"deps/xdiff",
				"deps/zlib",
				"src/libgit2",
				"src/util",
			],
			publicHeadersPath: "include",
			cSettings: [
				.unsafeFlags([
					// libgit2 is not compatible with modules
					"-fno-modules",
					// SwiftPM still passes a module cache path when modules are disabled
					"-Wno-unused-command-line-argument",
					// disable warning: 'Implicit conversion loses integer precision'
					"-Wno-shorten-64-to-32",
				]),
				
				.headerSearchPath("src/libgit2"),
				.headerSearchPath("src/util"),
				.headerSearchPath("deps/llhttp"),
				.headerSearchPath("deps/pcre2"),
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
				.define("GIT_HTTPS_SECURETRANSPORT"),
				.define("GIT_HTTPPARSER_BUILTIN"),
				.define("GIT_SECURE_TRANSPORT"),
				.define("USE_HTTPS", to: "SecureTransport"),
				
				// PCRE
				.define("GIT_REGEX_BUILTIN"),
				.define("PCRE2_STATIC"),
				.define("PCRE2_EXPORT", to: ""),
				.define("PCRE2_EXP_DECL", to: ""),
				.define("PCRE2_EXP_DEFN", to: ""),
				.define("PCRE2_CODE_UNIT_WIDTH", to: "8"),
				.define("SUPPORT_UNICODE"),
				.define("LINK_SIZE", to: "2"),
				.define("HEAP_LIMIT", to: "20000000"),
				.define("PARENS_NEST_LIMIT", to: "250"),
				.define("MATCH_LIMIT", to: "10000000"),
				.define("MATCH_LIMIT_DEPTH", to: "MATCH_LIMIT"),
				.define("MAX_VARLOOKBEHIND", to: "255"),
				.define("NEWLINE_DEFAULT", to: "2"), // line feed
				.define("MAX_NAME_SIZE", to: "128"),
				.define("MAX_NAME_COUNT", to: "10000"),
				
				// iconv encoding conversion support
				.define("GIT_I18N"),
				.define("GIT_I18N_ICONV"),
			],
			linkerSettings: [
				.linkedLibrary("iconv"),
				.linkedLibrary("z"),
			]
		),
	]
)
