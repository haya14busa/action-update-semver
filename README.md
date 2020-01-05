# GitHub Action: Update major/minor semver

[![Docker Image CI](https://github.com/haya14busa/action-update-semver/workflows/Docker%20Image%20CI/badge.svg)](https://github.com/haya14busa/action-update-semver/actions)
[![Release](https://img.shields.io/github/release/haya14busa/action-update-semver.svg?maxAge=43200)](https://github.com/haya14busa/action-update-semver/releases)

This action updates major/minor release tags on a tag push.
e.g. Update `v1` and `v1.2` tag when released `v1.2.3`.

It works well for GitHub Action. ref: https://help.github.com/en/articles/about-actions#versioning-your-action

## Inputs

### `github_token`

**Required**. Must be in form of `github_token: ${{ secrets.github_token }}`'.

### `message`

**Optional**. Tag message. Default: `Release $TAG`

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
      - uses: actions/checkout@v1
      - uses: haya14busa/action-update-semver@v1
        with:
          github_token: ${{ secrets.github_token }}
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
      - uses: actions/checkout@v1
      - uses: haya14busa/action-update-semver@v1
        with:
          github_token: \${{ secrets.github_token }}
EOF
```

</details>
