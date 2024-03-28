# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

def version(artifacts_org, artifacts_repo={}):
    """ Merge org artifact versions with repo artifact versions """
    normalised_artifacts_org = _artifact_versions(artifacts_org)

    repo_overrides_not_in_org = []
    for repo_artifact in artifacts_repo:
        if repo_artifact not in normalised_artifacts_org:
            repo_overrides_not_in_org.append(repo_artifact)
    if len(repo_overrides_not_in_org) != 0:
        fail("Cannot use repository artifact overrides not present in organisation artifact list: {0}".format(repo_overrides_not_in_org))

    overriden = {}
    for artifact in normalised_artifacts_org:
        overriden[artifact] = artifacts_repo.get(artifact, normalised_artifacts_org[artifact])
    return overriden

def _artifact_versions(artifacts_with_excludes):
    """ Normalise the provided master maven artifacts versions to just artifact : version """
    just_versions = {}
    for artifact, value in artifacts_with_excludes.items():
        if type(value) == type({}): # comparing to `== dict` doesn't work
            just_versions[artifact] = value["version"]
        else:
            just_versions[artifact] = value
    return just_versions


