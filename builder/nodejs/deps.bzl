load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def deps(patch = []):
    http_archive(
        name = "build_bazel_rules_nodejs",
        sha256 = "5dd1e5dea1322174c57d3ca7b899da381d516220793d0adef3ba03b9d23baa8e",
        urls = ["https://github.com/bazelbuild/rules_nodejs/releases/download/5.8.3/rules_nodejs-5.8.3.tar.gz"],
    )
