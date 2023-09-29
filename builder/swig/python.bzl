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

def _copy_to_bin(ctx, src, dst):
    ctx.actions.run_shell(
        inputs = [src],
        outputs = [dst],
        command = "cp -f '{}' '{}'".format(src.path, dst.path),
    )

def _swig_python_wrapper_impl(ctx):
    module_name = getattr(ctx.attr, "module_name", ctx.attr.name)
    import_name = getattr(ctx.attr, "import_name", "_" + ctx.attr.name)

    args = ctx.attr.extra_args + [
        "-python",
        "-module", module_name,
        "-interface", import_name,
        ctx.file.interface.path,
    ]

    if ctx.attr.enable_cxx:
        wrap_src = ctx.actions.declare_file("{}_wrap.cxx".format(module_name))
        directors_header = ctx.actions.declare_file("{}_wrap.h".format(module_name))
        args = ["-c++", "-o", wrap_src.path, "-oh", directors_header.path] + args
        swig_headers = [directors_header]
    else:
        wrap_src = ctx.actions.declare_file("{}_wrap.c".format(module_name))
        args = ["-o", wrap_src.path] + args
        swig_headers = []

    wrap_py = ctx.actions.declare_file("{}.py".format(module_name))

    for h in ctx.attr.lib[CcInfo].compilation_context.headers.to_list():
        args = ["-I" + h.dirname] + args

    ctx.actions.run(
        inputs = depset([ctx.file.interface] + ctx.files.includes, transitive = [
                    ctx.attr.lib[CcInfo].compilation_context.headers,
                    ctx.attr._swig.data_runfiles.files,
                ]),
        outputs = [wrap_src, wrap_py] + swig_headers,
        executable = ctx.file._swig,
        arguments = args,
    )

    lib_compilation_context = ctx.attr.lib[CcInfo].compilation_context
    compilation_context = cc_common.create_compilation_context(
        headers = depset(ctx.attr.python_headers[CcInfo].compilation_context.headers.to_list() + swig_headers, transitive = [lib_compilation_context.headers]),
        defines = lib_compilation_context.defines,
        framework_includes = lib_compilation_context.framework_includes,
        includes = lib_compilation_context.includes,
        local_defines = lib_compilation_context.local_defines,
        quote_includes = lib_compilation_context.quote_includes,
        system_includes = depset(
            [file.dirname for file in ctx.attr.python_headers[CcInfo].compilation_context.headers.to_list() + lib_compilation_context.headers.to_list()],
            transitive = [lib_compilation_context.system_includes, lib_compilation_context.includes],
        )
    )

    if ctx.attr.libpython:
        linking_context = cc_common.create_linking_context(
            linker_inputs = depset([], transitive = [ctx.attr.libpython[CcInfo].linking_context.linker_inputs, ctx.attr.lib[CcInfo].linking_context.linker_inputs]),
        )
    else:
        linking_context = ctx.attr.lib[CcInfo].linking_context

    return [
        DefaultInfo(files = depset([wrap_src, wrap_py])),
        CcInfo(
            compilation_context = compilation_context,
            linking_context = linking_context,
        ),
    ]


swig_python_wrapper = rule(
    implementation = _swig_python_wrapper_impl,
    attrs = {
        "lib": attr.label(
            doc = "The C library for which to generate the wrapper",
            providers = [CcInfo],
            mandatory = True,
        ),
        "module_name": attr.string(
            doc = "Optional override for the python module name (default: same as target name)",
        ),
        "import_name": attr.string(
            doc = "Optional override for the dynamic library name used in python library (default: '_' + target name)",
        ),
        "interface": attr.label(
            doc = "Optional SWIG interface (.i) file",
            allow_single_file = True,
        ),
        "includes": attr.label_list(
            doc = "Additional SWIG files required for wrapper generation",
            allow_files = True,
        ),
        "enable_cxx": attr.bool(
            doc = "Enable SWIG C++ processing (default: False)",
            default = True,
        ),
        "extra_args": attr.string_list(
            doc = "Extra arguments to be passed to SWIG",
        ),
        "python_headers": attr.label(
            doc = "Python C headers",
            mandatory = True,
        ),
        "libpython": attr.label(
            doc = "libpython (only required for Linux and Windows builds)",
        ),
        "_swig": attr.label(
            default = Label("@swig//:swig"),
            allow_single_file = True,
            executable = True,
            cfg = "host",
        ),
    },
)


def swig_python(*, name, lib, shared_lib_name=None, import_name=None, python_headers, libpython, **kwargs):
    swig_wrapper_name = name + "__swig"
    if not shared_lib_name:
        shared_lib_name = "_" + name
    if not import_name:
        import_name = shared_lib_name

    swig_python_wrapper(
        module_name = name,
        name = swig_wrapper_name,
        import_name = import_name,
        lib = lib,
        python_headers = python_headers,
        libpython = select({
            "@vaticle_bazel_distribution//platform:is_linux": libpython,
            "@vaticle_bazel_distribution//platform:is_mac": None,
            "@vaticle_bazel_distribution//platform:is_windows": libpython,
        }),
        **kwargs,
    )

    native.cc_binary(
        name = shared_lib_name,
        deps = [lib, swig_wrapper_name],
        srcs = [swig_wrapper_name],
        linkshared = True,
        linkopts = select({
            "@vaticle_bazel_distribution//platform:is_windows": ["ntdll.lib"],
            "//conditions:default": [],
        }),
        copts = select({
            "@vaticle_bazel_distribution//platform:is_mac": ["-undefined", "dynamic_lookup"],
            "//conditions:default": [],
        }),
    )

    native.py_library(name = name, srcs = [swig_wrapper_name], data = [shared_lib_name])


def _py_native_lib_rename_impl(ctx):
    output_file = ctx.actions.declare_file(ctx.attr.out)
    _copy_to_bin(ctx, ctx.files.src[0], output_file)
    return [
        DefaultInfo(files = depset([output_file])),
    ]


_py_native_lib_rename_wrapper = rule(
    implementation = _py_native_lib_rename_impl,
    attrs = {
        "out": attr.string(
            doc = "Output file name without extension",
            mandatory = True,
        ),
        "src": attr.label(
            mandatory = True,
        ),
    }
)


# The generated dynamic library has to be copied into the output directory in order to be accessible by other rules.
# We also choose the correct extension for the file. We need .pyd for Windows to be able to import from it.
# (https://docs.python.org/3/faq/windows.html#is-a-pyd-file-the-same-as-a-dll)
def py_native_lib_rename(name, out, src, visibility, **kwargs):
    _py_native_lib_rename_wrapper(
        name = name,
        out = select({
            "@vaticle_bazel_distribution//platform:is_windows": out + ".pyd",
            "//conditions:default": out + ".so",
        }),
        src = src,
        visibility = visibility,
        **kwargs,
    )
