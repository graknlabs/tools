#
# Copyright (C) 2022 Vaticle
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#

load("@io_bazel_rules_kotlin//kotlin:jvm.bzl", "kt_jvm_binary", "kt_jvm_test")

def _release_validate_deps_script_impl(ctx):
    test_script = ctx.actions.declare_file("{}.kt".format(ctx.attr.name))

    ctx.actions.expand_template(
        output = test_script,
        template = ctx.file._release_validate_deps_template,
        substitutions = {
            "{workspace_refs_json_path}": ctx.file.refs.path,
            "{version_file_path}": ctx.file.version_file.path,
            "{tagged_deps}": ",".join(ctx.attr.tagged_deps),
        }
    )

    return [
        DefaultInfo(
            runfiles = ctx.runfiles(files = [ctx.file.refs, ctx.file.version_file]),
            executable = test_script
        )
    ]


_release_validate_deps_script_test = rule(
    attrs = {
        "refs": attr.label(
            allow_single_file = True,
            mandatory = True
        ),
        "version_file": attr.label(
            allow_single_file = True,
            mandatory = True
        ),
        "tagged_deps": attr.string_list(
            mandatory = True
        ),
        "_release_validate_deps_template": attr.label(
            allow_single_file=True,
            default = "@vaticle_dependencies//tool/release/deps:ValidateDeps.kt"
        )
    },
    implementation = _release_validate_deps_script_impl,
    test = True
)

# macro to create the templating rule and binary executable rule
def release_validate_deps(name, **kwargs):
    standard_name = name.capitalize().replace("-","_")
    target_name = standard_name + "_gen"

    # create rule that generates the templated script with the correct inputs
    _release_validate_deps_script_test(
        name = target_name,
        **kwargs
    )

    # assign this rule instance as the name that is passed in, so it is called with `bazel run `
    kt_jvm_test(
        name = name,
        main_class = "com.vaticle.dependencies.tool.release.deps." + standard_name + "_genKt",
        srcs = [target_name],
        deps = [
            "@maven//:com_eclipsesource_minimal_json_minimal_json"
        ],
    )


def release_validate_nodejs_deps(
        name,
        package_json,
        version_file,
        tagged_deps,
    ):
        kt_jvm_test(
            name = name,
            main_class = "com.vaticle.dependencies.tool.release.deps.ValidateNodeJsDepsKt",
            srcs = [
                "@vaticle_dependencies//tool/release/deps:ValidateNodeJsDeps.kt"
            ],
            data = [
                package_json,
            ],
            deps = [
                "@maven//:com_eclipsesource_minimal_json_minimal_json",
                "@maven//:com_google_http_client_google_http_client",
            ],
            args = ["$(location {})".format(package_json), "$(location {})".format(version_file)] + tagged_deps,
            tags = ["manual"],
        )


def release_validate_python_deps(
        name,
        requirements,
        version_file,
        tagged_deps,
    ):
        kt_jvm_test(
            name = name,
            main_class = "com.vaticle.dependencies.tool.release.deps.ValidatePythonDepsKt",
            srcs = [
                "@vaticle_dependencies//tool/release/deps:ValidatePythonDeps.kt"
            ],
            data = [
                requirements,
            ],
            deps = [
                "@maven//:com_eclipsesource_minimal_json_minimal_json",
                "@maven//:com_google_http_client_google_http_client",
            ],
            args = ["$(location {})".format(requirements), "$(location {})".format(version_file)] + tagged_deps,
            tags = ["manual"],
        )
