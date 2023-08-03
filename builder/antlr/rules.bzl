def python_grammar_adapter(
        name,
        input,
        output):
    native.genrule(
        name = name,
        srcs = [input],
        outs = [output],
        cmd_bash = "$(location @vaticle_dependencies//builder/antlr:grammar-adapter) --in $< --out $@ --adapt-keyword type --adapt-keyword filter",
        tools = ["@vaticle_dependencies//builder/antlr:grammar-adapter"],
    )
