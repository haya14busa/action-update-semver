#!/bin/sh
set -x

cd "${GITHUB_WORKSPACE}"

# Set up variables.
TAG="${GITHUB_REF#refs/tags/}" # v1.2.3
MINOR="${TAG%.*}"              # v1.2
MAJOR="${MINOR%.*}"            # v1

if [ "${GITHUB_REF}" = "${TAG}" ]; then
  echo "This workflow is not triggered by tag: GITHUB_REF=${GITHUB_REF}"
  exit 1
fi

echo ::set-output name=minor_tag::${MINOR}
echo ::set-output name=major_tag::${MAJOR}

# Set up Git.
git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"

# Update MAJOR/MINOR tag
git tag -fa ${MAJOR} -m "Release ${TAG}"
git tag -fa ${MINOR} -m "Release ${TAG}"

# Push
git remote set-url origin https://${GITHUB_ACTOR}:${INPUT_GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git
git push --force origin ${MINOR}
git push --force origin ${MAJOR}
