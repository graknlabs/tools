/*
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

package com.vaticle.dependencies.tool.release.notes

data class Version(val major: Int, val minor: Int, val patch: Int, val rc: Int?, val alpha: Int?): Comparable<Version> {
    companion object {
        fun parse(version: String): Version {
            val components = version.split("-")
            val (major, minor, patch) = components[0].split(".").map(String::toInt)
            return when (components.size) {
                1 -> Version(major = major, minor = minor, patch = patch, rc = null, alpha = null)
                2 -> when {
                    components[1] == "alpha" -> Version(major = major, minor = minor, patch = patch, rc = null, alpha = 1)
                    components[1].startsWith("rc") -> Version(
                        major = major,
                        minor = minor,
                        patch = patch,
                        rc = components[1].removePrefix("rc").toInt(),
                        alpha = null
                    )
                    else -> {
                        throw IllegalArgumentException(
                            "version '$version' does not follow the form 'x.y.z', 'x.y.z-rcN', 'x.y.z-alpha', or 'x.y.z-alpha-N'"
                        )
                    }
                }
                3 -> {
                    require(components[1] == "alpha") {
                        "version '$version' does not follow the form 'x.y.z', 'x.y.z-rcN', 'x.y.z-alpha', or 'x.y.z-alpha-N'"
                    }
                    Version(major = major, minor = minor, patch = patch, rc = null, alpha = components[2].toInt())
                }
                else -> {
                    throw IllegalArgumentException(
                        "version '$version' does not follow the form 'x.y.z', 'x.y.z-rcN', 'x.y.z-alpha', or 'x.y.z-alpha-N'"
                    ) 
                }
            }
        }
    }

    override fun compareTo(other: Version): Int {
        val major = major.compareTo(other.major)
        if (major != 0) return major

        val minor = minor.compareTo(other.minor)
        if (minor != 0) return minor

        val patch = patch.compareTo(other.patch)
        if (patch != 0) return patch

        if (rc != null) {
            if (other.rc != null) return rc.compareTo(other.rc)
            else if (other.alpha != null) return 1
            else return -1
        }

        if (alpha != null) {
            if (other.alpha != null) return alpha.compareTo(other.alpha)
            else return -1
        }

        return 1 // x.y.z is always after x.y.z-prereleases
    }

    override fun toString(): String {
        val prerelease = when {
            rc != null -> "-rc$rc"
            alpha == 1 -> "-alpha"
            alpha != null -> "-alpha-$alpha"
            else -> ""
        }
        return "$major.$minor.$patch$prerelease"
    }

    fun isPrerelease(): Boolean = rc != null || alpha != null
}
