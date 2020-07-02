# Docker - Hugo

[![Build Status][linkGitHubActionsProjectBadge]][linkGitHubActionsProject]
[![Docker Build Status][linkDockerHubProjectBuildBadge]][linkDockerHubProjectBuild]
[![Generic badge][linkDockerHubProjectBadge]][linkDockerHubProject]
[![Docker Hub Pulls Badge][LinkDockerHubProjectPullsBadge]][linkDockerHubProject]
[![License][linkLicenseBadge]][linkLicense]

Docker image of the latest version of [Hugo][linkHugo], always!

## What's inside the image

- Based on the latest [Alpine image][linkAlpine]
- Latest regular version of Hugo
  - Not the Extended version as I don't need support for SASS/SCSS
- [NodeJS][linkNodeJS] with npm, yarn, and postcss-cli/autoprefixer modules used by [Hugo PostCSS][linkHugoPostCSS]
- bash, curl, git

## Usage

```bash
# pull image
$ docker pull flemay/hugo
# run image
$ docker run --rm flemay/hugo hugo version
```

## Example

This image is used when building and deploying the website from the repository [flemay/fredericlemay-com][linkFredericLemayRepo].

## Development

```bash
# generate .env file
$ make envfile
# build image
$ make build
# test image
$ make test
# go inside the container
$ make shell
# call docker hub build
$ make deploy
# clean
$ make clean
```

## Versioning

This image will always be built with the tag `latest` so tools will always be up to date. This may cause issues if any tool has a breaking change.

## Automated build process

A change to master triggers a [GitHub Action][linkGitHubActionsProject] that tests and triggers [Docker Hub build][linkDockerHubProjectBuild]. The automatic build on Docker Hub has been disabled ensuring the build process to go through GitHub Actions first. Moreover, to make sure the image is always up to date, a scheduled GitHub Action kicks off every month. Finally, a pull request triggers another GitHub Action which tests it without deploying.

## Contributing

Contributions are greatly appreciated. Everyone can contribute and [here][linkProjectContributing] are different ways.


[linkFredericLemayRepo]: https://github.com/flemay/fredericlemay-com
[linkProjectContributing]: CONTRIBUTING.md
[linkLicenseBadge]: https://img.shields.io/dub/l/vibe-d.svg
[linkLicense]: LICENSE
[linkGitHubActionsProjectBadge]: https://github.com/flemay/docker-hugo/workflows/Deploy/badge.svg
[linkGitHubActionsProject]: https://github.com/flemay/docker-hugo/actions
[linkDockerHubProjectBadge]: https://img.shields.io/badge/repository-dockerhub-blue.svg
[linkDockerHubProject]: https://hub.docker.com/r/flemay/hugo
[linkDockerHubProjectBuild]: https://hub.docker.com/r/flemay/hugo/builds/
[linkDockerHubProjectBuildBadge]: https://img.shields.io/docker/build/flemay/hugo.svg
[LinkDockerHubProjectPullsBadge]: https://img.shields.io/docker/pulls/flemay/hugo

[linkHugo]: https://gohugo.io/
[linkNodeJS]: https://nodejs.org/
[linkPostcssCLI]: https://www.npmjs.com/package/postcss-cli
[linkDockerRegistry]: https://hub.docker.com/r/flemay/hugo
[linkAlpine]: https://hub.docker.com/_/alpine/
[linkHugoPostCSS]: https://gohugo.io/hugo-pipes/postcss/