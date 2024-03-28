/*
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

package com.vaticle.dependencies.tool.release.notes

import com.google.api.client.http.GenericUrl
import com.google.api.client.http.HttpHeaders
import com.google.api.client.http.HttpResponse
import com.google.api.client.http.javanet.NetHttpTransport
import org.zeroturnaround.exec.ProcessExecutor
import org.zeroturnaround.exec.ProcessResult
import java.nio.file.Path

object Constant {
    val releaseTemplateRegex = "\\{\\s*release notes\\s*}".toRegex()
    const val github = "https://api.github.com"
    const val headerAccept = "application/vnd.github.v3+json"
    const val headerAuthPrefix = "Token"
    const val labelPrefix = "type"
    const val labelFeature = "$labelPrefix: feature"
    const val labelBug = "$labelPrefix: bug"
    const val labelRefactor = "$labelPrefix: refactor"
}

fun getEnv(env: String): String {
    return System.getenv(env) ?: throw RuntimeException("'$env' environment variable must be set.")
}

fun httpGet(url: String, githubToken: String): HttpResponse {
    return NetHttpTransport()
            .createRequestFactory()
            .buildGetRequest(GenericUrl(url))
            .setHeaders(
                    HttpHeaders().setAuthorization("${Constant.headerAuthPrefix} $githubToken").setAccept(Constant.headerAccept)
            )
            .execute()
}

fun bash(script: String, baseDir: Path, requireNormalExit: Boolean = true): ProcessResult {
    var builder = ProcessExecutor(script.split(" "))
            .readOutput(true)
            .redirectOutput(System.out)
            .redirectError(System.err)
            .directory(baseDir.toFile());
    if (requireNormalExit) builder = builder.exitValueNormal();
    return builder.execute()
}
