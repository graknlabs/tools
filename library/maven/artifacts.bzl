# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

artifacts = {
    "androidx.annotation:annotation": "1.2.0",
    "aws.sdk.kotlin:sqs-jvm": "1.3.23",
    "aws.sdk.kotlin:marketplacemetering-jvm": "1.3.23",
    "ch.qos.logback:logback-classic": "1.4.14",
    "ch.qos.logback:logback-core": "1.4.14",
    "ch.qos.logback.contrib:logback-json-classic" : "0.1.5",
    "ch.qos.logback.contrib:logback-json-core" : "0.1.5",
    "ch.qos.logback.contrib:logback-jackson" : "0.1.5",
    "com.auth0:java-jwt": "3.8.3",
    "com.auth0:jwks-rsa": "0.22.0",
    "com.azure:azure-core": "1.5.0",
    "com.azure:azure-identity": "1.0.6",
    "com.azure:azure-storage-blob": "12.7.0",
    "com.azure:azure-storage-common": "12.7.0",
    "com.datastax.oss:java-driver-core": {
        "exclude": ["com.github.jnr:jnr-ffi"],
        "version": "4.3.0",
    },
    "com.datastax.oss:java-driver-query-builder": {
        "exclude": ["com.github.jnr:jnr-ffi"],
        "version": "4.3.0",
    },
    "com.eclipsesource.minimal-json:minimal-json": "0.9.5",
    "com.electronwill.night-config:core": "3.6.5",
    "com.electronwill.night-config:toml": "3.6.5",
    "com.fasterxml.jackson.core:jackson-annotations": "2.16.0",
    "com.fasterxml.jackson.core:jackson-core": "2.16.0",
    "com.fasterxml.jackson.core:jackson-databind": "2.16.0",
    "com.fasterxml.jackson.dataformat:jackson-dataformat-yaml": "2.9.9",
    "com.fasterxml.jackson.module:jackson-module-scala_2.11": "2.9.9",
    "com.fasterxml.jackson.module:jackson-module-kotlin": "2.16.0",
    "com.fasterxml.jackson.datatype:jackson-datatype-jsr310": "2.16.0",
    "com.fasterxml.jackson.datatype:jackson-datatype-jdk8": "2.16.0",
    "com.fifesoft:rsyntaxtextarea": "3.1.3",
    "com.github.ben-manes.caffeine:caffeine": "2.8.6",
    "com.github.jknack:handlebars": "4.0.4",
    "com.github.rholder:guava-retrying": "2.0.0",
    "com.google.android:annotations": "4.1.1.4",
    "com.google.api.grpc:proto-google-common-protos" : "2.9.0",
    "com.google.api:gax": "1.64.0",
    "com.google.api:gax-grpc": "1.64.0",
    "com.google.api-client:google-api-client": "2.0.0",
    "com.google.api-client:google-api-client-gson": "2.0.0",
    "com.google.apis:google-api-services-servicecontrol": "v1-rev20221014-2.0.0",
    "com.google.auth:google-auth-library-credentials": "1.6.0",
    "com.google.auth:google-auth-library-oauth2-http" : "1.6.0",
    "com.google.auto.value:auto-value" : "1.9",
    "com.google.auto.value:auto-value-annotations" : "1.9",
    "com.google.cloud:google-cloud-secretmanager": "1.5.2",
    "com.google.cloud:google-cloud-pubsub": "1.112.5",
    "com.google.api.grpc:proto-google-cloud-pubsub-v1": "1.94.5",
    "com.google.code.findbugs:annotations": "3.0.1",
    "com.google.code.findbugs:jsr305": "3.0.2",
    "com.google.code.gson:gson": "2.9.0",
    "com.google.errorprone:error_prone_annotations": "2.9.0",
    "com.google.guava:failureaccess" : "1.0.1",
    "com.google.guava:guava": "30.1-jre",
    "com.google.firebase:firebase-admin": "9.1.1",
    "com.google.http-client:google-http-client": "1.41.4",
    "com.google.http-client:google-http-client-gson": "1.41.4",
    "com.google.inject:guice": "4.2.2",
    "com.google.j2objc:j2objc-annotations" : "1.3",
    "com.google.ortools:ortools-java": {
        "version": "9.6.2534",
        # these transitive dependencies must be explicitly included
        "exclude": [
           "com.google.ortools:ortools-darwin-x86-64",
           "com.google.ortools:ortools-darwin-aarch64",
           "com.google.ortools:ortools-linux-x86-64",
           "com.google.ortools:ortools-linux-aarch64",
           "com.google.ortools:ortools-win32-x86-64"
        ]
    },
    "com.google.ortools:ortools-darwin-aarch64": "9.6.2534",
    "com.google.ortools:ortools-darwin-x86-64": "9.6.2534",
    "com.google.ortools:ortools-linux-aarch64": "9.6.2534",
    "com.google.ortools:ortools-linux-x86-64": "9.6.2534",
    "com.google.ortools:ortools-win32-x86-64": "9.6.2534",
    "com.google.protobuf:protobuf-java": "3.21.7",
    "com.google.protobuf:protobuf-kotlin": "3.21.7",
    "com.google.re2j:re2j" : "1.6",
    "com.google.truth:truth" : "1.0.1",
    "com.jcraft:jsch": "0.1.55",
    "com.microsoft.azure:azure": "1.33.1",
    "com.microsoft.azure:azure-client-authentication": "1.7.4",
    "com.microsoft.azure:azure-client-runtime": "1.7.4",
    "com.microsoft.azure:azure-mgmt-compute": "1.33.1",
    "com.microsoft.azure:azure-mgmt-network": "1.33.1",
    "com.microsoft.azure:azure-mgmt-resources": "1.33.1",
    "com.microsoft.rest:client-runtime": "1.7.4",
    "com.newrelic.agent.java:newrelic-agent": "8.10.0",
    "com.newrelic.logging:logback": "3.1.0",
    "com.newrelic.telemetry:telemetry-core": "0.16.0",
    "com.newrelic.telemetry:telemetry-http-okhttp": "0.16.0",
    "com.posthog.java:posthog": "1.1.1",
    "com.quantego:clp-java": {
        "exclude": ["com.google.android.tools:dx"],
        "version": "1.16.10"
    },
    "com.stripe:stripe-java": "22.3.0",
    "com.typesafe.akka:akka-actor-testkit-typed_2.12": "2.6.3",
    "com.typesafe.akka:akka-actor-typed_2.12": "2.6.3",
    "com.typesafe.akka:akka-actor_2.12": "2.6.3",
    "com.typesafe.akka:akka-stream_2.12": "2.6.3",
    "com.typesafe.play:build-link": "2.8.1",
    "com.typesafe.play:filters-helpers_2.12": "2.8.1",
    "com.typesafe.play:play-akka-http-server_2.12": "2.8.1",
    "com.typesafe.play:play-guice_2.12": "2.8.1",
    "com.typesafe.play:play-java_2.12": "2.8.1",
    "com.typesafe.play:play-netty-server_2.12": "2.8.1",
    "com.typesafe.play:play-server_2.12": "2.8.1",
    "com.typesafe.play:play-streams_2.12": "2.8.1",
    "com.typesafe.play:play-ws_2.12": "2.8.1",
    "com.typesafe.play:play_2.12": "2.8.1",
    "com.typesafe.play:twirl-api_2.12": "1.5.0",
    "com.typesafe:config": "1.4.0",
    "com.squareup.okhttp:okhttp" : "2.7.5",
    "com.squareup.okio:okio" : "1.17.5",
    "com.univocity:univocity-parsers": "2.8.1",
    "commons-cli:commons-cli": "1.4",
    "commons-collections:commons-collections": "3.2.1",
    "commons-configuration:commons-configuration": "1.10",
    "commons-io:commons-io": "2.3",
    "commons-lang:commons-lang": "2.6",
    "commons-logging:commons-logging": "1.2",
    "eu.neilalexander:jnacl" : "1.0.0",
    "info.picocli:picocli": "4.6.1",
    "io.cucumber:cucumber-java": "5.1.3",
    "io.cucumber:cucumber-junit": "5.1.3",
    "io.github.microutils:kotlin-logging-jvm": "2.0.10",
    "io.github.speedb-io:speedbjni": "2.6.0",
    "io.grpc:grpc-api": "1.49.0",
    "io.grpc:grpc-context": "1.49.0",
    "io.grpc:grpc-core": "1.49.0",
    "io.grpc:grpc-netty": "1.49.0",
    "io.grpc:grpc-protobuf": "1.49.0",
    "io.grpc:grpc-stub": "1.49.0",
    "io.grpc:grpc-testing": "1.49.0",
    "io.fabric8:kubernetes-client": "6.10.0",
    "io.fabric8:kubernetes-client-api": "6.10.0",
    "io.fabric8:kubernetes-model": "6.10.0",
    "io.fabric8:kubernetes-model-apiextensions": "6.10.0",
    "io.fabric8:kubernetes-model-apps": "6.10.0",
    "io.fabric8:kubernetes-model-core": "6.10.0",
    "io.fabric8:kubernetes-model-policy": "6.10.0",
    "io.ktor:ktor-client-auth-jvm": "2.3.7",
    "io.ktor:ktor-client-cio-jvm": "2.3.7",
    "io.ktor:ktor-client-content-negotiation-jvm": "2.3.7",
    "io.ktor:ktor-client-core-jvm": "2.3.7",
    "io.ktor:ktor-client-websockets-jvm": "2.3.7",
    "io.ktor:ktor-serialization-gson-jvm": "2.3.7",
    "io.ktor:ktor-serialization-jackson-jvm": "2.3.7",
    "io.ktor:ktor-serialization-kotlinx-jvm": "2.3.7",
    "io.ktor:ktor-serialization-kotlinx-protobuf-jvm": "2.3.7",
    "io.ktor:ktor-server-auth-jvm": "2.3.7",
    "io.ktor:ktor-server-auth-jwt-jvm": "2.3.7",
    "io.ktor:ktor-server-content-negotiation-jvm": "2.3.7",
    "io.ktor:ktor-server-core-jvm": "2.3.7",
    "io.ktor:ktor-server-netty-jvm": "2.3.7",
    "io.ktor:ktor-server-default-headers-jvm": "2.3.7",
    "io.ktor:ktor-server-status-pages-jvm": "2.3.7",
    "io.ktor:ktor-server-websockets-jvm": "2.3.7",
    "io.kubernetes:client-java": {
        "exclude": ["com.github.stefanbirkner:system-rules"],
        "version": "12.0.0"
    },
    "io.kubernetes:client-java-api": {
        "exclude": ["com.github.stefanbirkner:system-rules"],
        "version": "12.0.0"
    },
    "io.kubernetes:client-java-util": {
        "exclude": ["com.github.stefanbirkner:system-rules"],
        "version": "0.1"
    },
    "io.netty:netty-all": "4.1.87.Final",
    "io.netty:netty-codec-http2": "4.1.87.Final",
    "io.netty:netty-handler": "4.1.87.Final",
    "io.netty:netty-handler-proxy": "4.1.87.Final",
    "io.netty:netty-buffer": "4.1.87.Final",
    "io.netty:netty-codec": "4.1.87.Final",
    "io.netty:netty-codec-http": "4.1.87.Final",
    "io.netty:netty-codec-socks": "4.1.87.Final",
    "io.netty:netty-common": "4.1.87.Final",
    "io.netty:netty-tcnative-classes" : "2.0.61.Final",
    "io.netty:netty-transport": "4.1.87.Final",
    "io.netty:netty-resolver": "4.1.87.Final",
    "io.netty:netty-transport-native-epoll" : {
        "version": "4.1.87.Final",
        "classifier": "linux-x86_64",
        "packaging": "jar",
    },
    "io.netty:netty-transport-native-unix-common" : "4.1.87.Final",
    "io.netty:netty-tcnative-boringssl-static": "2.0.61.Final",
    "io.opencensus:opencensus-api": "0.24.0",
    "io.opencensus:opencensus-contrib-grpc-metrics": "0.24.0",
    "io.sentry:sentry" : "7.1.0",
    "io.perfmark:perfmark-api" : "0.25.0",
    "io.vavr:vavr": "0.9.0",
    "javax.annotation:javax.annotation-api": "1.3.2",
    "javax.inject:javax.inject": "1",
    "javax.servlet:javax.servlet-api": "3.1.0",
    "javax.xml.stream:stax-api": "1.0-2",
    "org.jline:jline": "3.17.1",
    "org.jline:jline-terminal-jansi": "3.17.1",
    "junit:junit": "4.12",
    "net.logstash.logback:logstash-logback-encoder": "6.5",
    "net.minidev:json-smart": "2.3",
    "org.antlr:antlr4-runtime": "4.8",
    "org.apache.cassandra:cassandra-all": {
        "exclude": [
            "ch.qos.logback:logback-classic",
            "ch.qos.logback:logback-core",
            "it.unimi.dsi:fastutil",
            "com.addthis.metrics:reporter-config3",
            "org.eclipse.jdt.core.compiler:ecj",
        ],
        "version": "3.11.3",
    },
    "org.apache.cassandra:cassandra-thrift": {
        "exclude": [
            "ch.qos.logback:logback-classic",
            "ch.qos.logback:logback-core",
            "it.unimi.dsi:fastutil",
        ],
        "version": "3.11.3",
    },
    "org.apache.commons:commons-compress": "1.21",
    "org.apache.commons:commons-csv": "1.8",
    "org.apache.commons:commons-lang3": "3.9",
    "org.apache.commons:commons-math3": "3.6.1",
    "org.apache.hadoop:hadoop-annotations": "2.7.2",
    "org.apache.hadoop:hadoop-common": {
        "exclude": [
            "javax.servlet:servlet-api",
            "org.slf4j:slf4j-log4j12",
            "io.netty:netty",
        ],
        "version": "2.7.2",
    },
    "org.apache.hadoop:hadoop-mapreduce-client-core": {
        "exclude": [
            "javax.servlet:servlet-api",
            "org.slf4j:slf4j-log4j12",
            "io.netty:netty",
        ],
        "version": "2.7.2",
    },
    "org.apache.spark:spark-core_2.11": {
        "exclude": [
            "com.fasterxml.jackson.module:jackson-module-scala_2.10",
            "io.netty:netty",
            "javax.servlet:ja,vax.servlet-api",
            "log4j:log4j",
            "org.scala-lang.modules:scala-xml_2.11",
            "org.slf4j:jcl-over-slf4j",
            "org.slf4j:slf4j-api",
            "org.slf4j:slf4j-log4j12",
        ],
        "version": "2.2.0",
    },
    "org.apache.spark:spark-launcher_2.11": {
        "exclude": [
            "com.fasterxml.jackson.module:jackson-module-scala_2.10",
            "io.netty:netty",
            "javax.servlet:ja,vax.servlet-api",
            "log4j:log4j",
            "org.scala-lang.modules:scala-xml_2.11",
            "org.slf4j:jcl-over-slf4j",
            "org.slf4j:slf4j-api",
            "org.slf4j:slf4j-log4j12",
        ],
        "version": "2.2.0",
    },
    "org.apache.thrift:libthrift": "0.9.2",
    "org.apache.tinkerpop:gremlin-core": {
        "exclude": [
            "org.slf4j:jcl-over-slf4j",
            "org.slf4j:slf4j-log4j12",
        ],
        "version": "3.4.1",
    },
    "org.apache.tinkerpop:hadoop-gremlin": {
        "exclude": [
            "com.fasterxml.jackson.core:jackson-core",
            "com.fasterxml.jackson.core:jackson-databind",
            "com.sun.jersey:jersey-client",
            "commons-logging:commons-logging",
            "io.netty:netty",
            "javax.servlet:javax.servlet-api",
            "log4j:log4j",
            "org.mortbay.jetty:jetty-util",
            "org.slf4j:jcl-over-slf4j",
            "org.slf4j:slf4j-log4j12",
            "org.slf4j:slf4j-nop",
        ],
        "version": "3.4.1",
    },
    "org.apache.tinkerpop:spark-gremlin": {
        "exclude": [
            "com.fasterxml.jackson.core:jackson-annotations",
            "com.fasterxml.jackson.core:jackson-core",
            "com.fasterxml.jackson.core:jackson-databind",
            "com.fasterxml.jackson.module:jackson-module-scala_2.10",
            "io.netty:netty",
            "javax.servlet:javax.servlet-api",
        ],
        "version": "3.4.1",
    },
    "org.apache.tinkerpop:tinkergraph-gremlin": {
        "exclude": ["org.slf4j:slf4j-log4j12"],
        "version": "3.4.1",
    },
    "org.apache.tomcat:annotations-api" : "6.0.53",
    "org.bouncycastle:bcprov-jdk15on": "1.69",
    "org.bouncycastle:bcpkix-jdk15on": "1.69",
    "org.codehaus.janino:janino": "3.1.6",
    "org.codehaus.mojo:animal-sniffer-annotations" : "1.21",
    "org.hamcrest:hamcrest": "2.2",
    "org.hamcrest:hamcrest-all": "1.3",
    "org.hamcrest:hamcrest-core": "1.3",
    "org.hamcrest:hamcrest-library": "1.3",
    "org.javatuples:javatuples": "1.2",
    "org.jetbrains.compose.compiler:compiler": "1.5.7",
    "org.jetbrains.compose.animation:animation-core-desktop": "1.5.11",
    "org.jetbrains.compose.desktop:desktop-jvm": "1.5.11",
    "org.jetbrains.compose.foundation:foundation-desktop": "1.5.11",
    "org.jetbrains.compose.foundation:foundation-layout-desktop": "1.5.11",
    "org.jetbrains.compose.material:material-desktop": "1.5.11",
    "org.jetbrains.compose.ui:ui-desktop": "1.5.11",
    "org.jetbrains.compose.ui:ui-geometry-desktop": "1.5.11",
    "org.jetbrains.compose.ui:ui-graphics-desktop": "1.5.11",
    "org.jetbrains.compose.ui:ui-test-desktop": "1.5.11",
    "org.jetbrains.compose.ui:ui-test-junit4-desktop": "1.5.11",
    "org.jetbrains.compose.ui:ui-text-desktop": "1.5.11",
    "org.jetbrains.compose.ui:ui-unit-desktop": "1.5.11",
    "org.jetbrains.compose.runtime:runtime-desktop": "1.5.11",
    "org.jetbrains.kotlin:kotlin-reflect": "1.9.22",
    "org.jetbrains.kotlin:kotlin-stdlib-jdk7": "1.9.22",
    "org.jetbrains.kotlin:kotlin-test": "1.9.22",
    "org.jetbrains.kotlinx:kotlinx-coroutines-core": "1.7.3",
    "org.jetbrains.kotlinx:kotlinx-coroutines-core-jvm": "1.7.3",
    "org.jetbrains.kotlinx:kotlinx-coroutines-slf4j": "1.7.3",
    "org.jetbrains.kotlinx:kotlinx-coroutines-test": "1.7.3",
    "org.jetbrains.kotlinx:kotlinx-serialization-core-jvm": "1.6.2",
    "org.jetbrains.kotlinx:kotlinx-serialization-protobuf-jvm": "1.6.2",
    "org.jacoco:org.jacoco.agent": {
        "classifier": "runtime",
        "version": "0.8.12",
    },
    "org.jacoco:org.jacoco.cli": {
        "classifier": "nodeps",
        "version": "0.8.12",
    },
    # Find out the Skiko version we need by viewing dependencies of org.jetbrains.compose.ui/ui-graphics-desktop
    "org.jetbrains.skiko:skiko-awt": "0.7.85",
    "org.jetbrains.skiko:skiko-awt-runtime-linux-arm64": "0.7.85",
    "org.jetbrains.skiko:skiko-awt-runtime-linux-x64": "0.7.85",
    "org.jetbrains.skiko:skiko-awt-runtime-macos-arm64": "0.7.85",
    "org.jetbrains.skiko:skiko-awt-runtime-macos-x64": "0.7.85",
    "org.jetbrains.skiko:skiko-awt-runtime-windows-x64": "0.7.85",
    "org.jsoup:jsoup": "1.16.1",
    "org.kohsuke:github-api": "1.101",
    "org.mockito:mockito-core": "3.2.4",
    "org.mockito.kotlin:mockito-kotlin": "3.0.0",
    "org.openjdk.jmh:jmh-core": "1.23",
    "org.openjdk.jmh:jmh-generator-annprocess": "1.23",
    "org.scala-lang:scala-library": "2.12.10",
    "org.sharegov:mjson": "1.4.1",
    "org.slf4j:jcl-over-slf4j": "2.0.0",
    "org.slf4j:log4j-over-slf4j": "2.0.0",
    "org.slf4j:slf4j-api": "2.0.0",
    "org.slf4j:slf4j-simple": "2.0.0",
    "org.springframework.security:spring-security-crypto": "5.5.0",
    "org.yaml:snakeyaml": "2.2",
    "org.zeromq:jeromq": "0.5.2",
    "org.zeroturnaround:zt-exec": "1.10",
    "com.mailgun:mailgun-java": "1.1.2",
    "io.github.openfeign:feign-core": "13.2.1",
    "com.vdurmont:semver4j": "3.1.0",
}
