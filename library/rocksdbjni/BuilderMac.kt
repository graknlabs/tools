package com.vaticle.dependencies.library.rocksdbjni

import java.nio.file.Paths

import com.vaticle.dependencies.util.bash

fun main() {
    val baseDir = Paths.get(".")
    val version = Paths.get("library").resolve("rocksdbjni").resolve("VERSION").toFile().useLines { it.firstOrNull() }

    val javaHome = Paths.get(bash("/usr/libexec/java_home", baseDir, null, true).outputUTF8().trim())

    bash("git clone https://github.com/facebook/rocksdb.git", baseDir, javaHome, true)

    val rocksDbDir = Paths.get("rocksdb")
    bash("git checkout v$version", rocksDbDir, javaHome, true)

    bash("brew install cmake", rocksDbDir, javaHome, false)

    bash("make clean jclean", rocksDbDir, javaHome, true)

    // use 'make DEBUG_LEVEL=0 ...' to build production binary
    bash("make -j8 rocksdbjava", rocksDbDir, javaHome, true)

    val srcMainJavaDir = Paths.get("rocksdb", "java", "src", "main", "java")
    val sourcesJarName = "rocksdbjni-$version-sources.jar"
    bash("jar -cf ../../../target/$sourcesJarName org", srcMainJavaDir, javaHome, true)

    val versionedJarName = "rocksdbjni-$version-osx.jar"
    val jar = rocksDbDir.resolve("java").resolve("target").resolve(versionedJarName).toFile()
    val destPath = Paths.get("rocksdbjni-osx.jar").toFile()
    jar.copyTo(destPath)

    val sourcesJar = rocksDbDir.resolve("java").resolve("target").resolve(sourcesJarName).toFile()
    val sourcesDestPath = Paths.get("rocksdbjni-sources.jar").toFile()
    sourcesJar.copyTo(sourcesDestPath)
}
