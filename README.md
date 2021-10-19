# GitHub Action: Update major/minor semver

[![Docker Image CI](https://github.com/haya14busa/action-update-semver/workflows/Docker%20Image%20CI/badge.svg)](https://github.com/haya14busa/action-update-semver/actions)
[![reviewdog](https://github.com/haya14busa/action-update-semver/workflows/reviewdog/badge.svg)](https://github.com/haya14busa/action-update-semver/actions?query=workflow%3Areviewdog)
[![release](https://github.com/haya14busa/action-update-semver/workflows/release/badge.svg)](https://github.com/haya14busa/action-update-semver/actions?query=workflow%3Arelease)
[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/haya14busa/action-update-semver?logo=github&sort=semver)](https://github.com/haya14busa/action-update-semver/releases)

This action updates major/minor release tags on a tag push.
e.g. Update `v1` and `v1.2` tag when released `v1.2.3`.

It works well for GitHub Action. ref: https://help.github.com/en/articles/about-actions#versioning-your-action

## Inputs

### `tag`

**Optional**. Existing tag to update from. Default comes from `$GITHUB_REF`.

### `message`

**Optional**. Tag message. Default: `Release $TAG`

### `major_version_tag_only`

**Optional**. Create only major version tags. Default: `false`


## Example usage

### [.github/workflows/update_semver.yml](.github/workflows/update_semver.yml)

```yml
name: Update Semver
on:
  push:
    branches-ignore:
      - '**'
    tags:
      - 'v*.*.*'
jobs:
  update-semver:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: haya14busa/action-update-semver@v1
        with:
          major_version_tag_only: true  # (optional, default is "false")
```

<details>

<summary>oneliner</summary>

```
$ cat <<EOF > .github/workflows/update_semver.yml
name: Update Semver
on:
  push:
    branches-ignore:
      - '**'
    tags:
      - 'v*.*.*'
jobs:
  update-semver:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: haya14busa/action-update-semver@v1
EOF
```

</details>
