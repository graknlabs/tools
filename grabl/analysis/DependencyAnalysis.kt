package grabl.analysis

import com.eclipsesource.json.Json
import java.nio.file.Files
import java.nio.file.Paths
import java.util.regex.Pattern


fun main() {
    val remotePattern = Pattern.compile("remote = \"(https://github.com/|git@github.com:)(?<remote>[^.\"]*)(?:.git)?\"(?:.*)");
    val refPattern = Pattern.compile("(?<type>commit|tag) = \"(?<ref>.*)\"(?:.*)");

    var workspaceDirectory = System.getenv("BUILD_WORKSPACE_DIRECTORY")
    var dependencies = Paths.get(workspaceDirectory, "dependencies", "graknlabs", "dependencies.bzl")
    var repositoriesArray = Json.array()


    Files.readAllLines(dependencies).windowed(size=2, step=1).map { window ->
        window.map { it.trim(' ', ',', '\t') }
    }.mapNotNull { window ->
        val remotePatternMatcher = remotePattern.matcher(window.first())
        val refPatternMatcher = refPattern.matcher(window.last())
        if (!(remotePatternMatcher.matches() && refPatternMatcher.matches())) {
            return@mapNotNull null
        }
        mapOf(
                "remote" to remotePatternMatcher.group("remote"),
                refPatternMatcher.group("type") to refPatternMatcher.group("ref")
        )
    }.map {
        println(it)
        var obj = Json.`object`()
        for ((k, v) in it) {
            obj = obj.add(k, v)
        }
        repositoriesArray = repositoriesArray.add(obj)
    }

    var workflow = "" // TODO: get workflow
    var dependencyAnalysis = Json.`object`().add("workflow", workflow).add("commit-dependency", repositoriesArray)
    var payload = Json.`object`().add("dependency-analysis", dependencyAnalysis)

    println(payload)
    // TODO: do a POST request

}