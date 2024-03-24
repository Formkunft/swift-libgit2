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
                "libgit2/deps/http-parser/CMakeLists.txt",
                "libgit2/deps/http-parser/COPYING",
                "libgit2/deps/pcre/CMakeLists.txt",
                "libgit2/deps/pcre/COPYING",
                "libgit2/deps/pcre/LICENCE",
                "libgit2/deps/pcre/cmake",
                "libgit2/deps/pcre/config.h.in",
                "libgit2/deps/xdiff/CMakeLists.txt",
                "libgit2/deps/zlib/CMakeLists.txt",
                "libgit2/deps/zlib/LICENSE",
                "libgit2/src/libgit2/CMakeLists.txt",
                "libgit2/src/libgit2/experimental.h.in",
                "libgit2/src/libgit2/git2.rc",
                "libgit2/src/util/CMakeLists.txt",
                "libgit2/src/util/git2_features.h.in",
                "libgit2/src/util/hash/builtin.c",
                "libgit2/src/util/hash/builtin.h",
                "libgit2/src/util/hash/collisiondetect.c",
                "libgit2/src/util/hash/collisiondetect.h",
                "libgit2/src/util/hash/openssl.c",
                "libgit2/src/util/hash/openssl.h",
                "libgit2/src/util/hash/win32.c",
                "libgit2/src/util/hash/win32.h",
                "libgit2/src/util/win32",
            ],
            sources: [
                "libgit2/deps/http-parser",
                "libgit2/deps/pcre",
                "libgit2/deps/xdiff",
                "libgit2/deps/zlib",
                "libgit2/src/libgit2",
                "libgit2/src/util",
            ],
            publicHeadersPath: "libgit2/include",
            cSettings: [
                .unsafeFlags([
                    // fix 'struct entry' causing build conflict
                    "-fno-modules",
                    // disable warning: 'Implicit conversion loses integer precision'
                    "-Wno-shorten-64-to-32",
                ]),
                
                .headerSearchPath("libgit2/src/libgit2"),
                .headerSearchPath("libgit2/src/util"),
                .headerSearchPath("libgit2/deps/http-parser"),
                .headerSearchPath("libgit2/deps/pcre"),
                .headerSearchPath("libgit2/deps/xdiff"),
                .headerSearchPath("libgit2/deps/zlib"),
                
                .define("LIBGIT2_NO_FEATURES_H"),
                .define("GIT_ARCH_64"),
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
