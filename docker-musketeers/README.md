# Docker - Musketeers

[![Build Status][linkGitHubActionsProjectBadge]][linkGitHubActionsProject]
[![Docker Build Status][linkDockerProjectBuildBadge]][linkDockerHubProjectBuild]
[![Docker Hub Badge][linkDockerHubProjectBadge]][linkDockerHubProject]
[![Docker Hub Pulls Badge][LinkDockerHubProjectPullsBadge]][linkDockerHubProject]
[![License][linkLicenseBadge]][linkLicense]

🐳 Lightweight image with essential tools for a [3 Musketeers][link3Musketeers] project. ⚔️

## Tools

- Docker
  - useful when wanting to run docker commands inside a container
- Compose
- make
- zip
- curl
- git
- openssl
- bash
- envsubst

## Usage

```bash
# pull image
$ docker pull flemay/musketeers
# run image
$ docker run --rm flemay/musketeers docker --version
```

## Example

This image is used when building and deploying the Docker image from the GitLab repository [flemay/cookiecutter][linkGitLabCookiecutter].

## Development

```bash
# generate .env file
$ make envfile
# build image
$ make build
# test image
$ make test
# go inside a musketeers container
$ make shell
```

## Versioning

This image will always be built with the tag `latest` so tools will always be up to date. This may cause issues if any tool has a breaking change.

## Automated build process

A change to master triggers a [GitHub Action][linkGitHubActionsProject] that builds, tests, and pushes the image to [Docker Hub][linkDockerHubProject]. The automatic build on Docker Hub has been disabled ensuring the build process to only go through GitHub Actions. Moreover, to make sure the image is always up to date, a scheduled GitHub Action kicks off every month. Finally, a pull request triggers another GitHub Action which builds and tests the image.

## Contributing

Contributions are greatly appreciated. Everyone can contribute and [here][linkProjectContributing] are different ways.

## License

[MIT][linkLicense]


[linkProjectContributing]: CONTRIBUTING.md
[link3Musketeers]: https://3musketeers.io
[linkGitLabCookiecutter]: https://gitlab.com/flemay/docker-cookiecutter

[linkLicenseBadge]: https://img.shields.io/dub/l/vibe-d.svg
[linkLicense]: LICENSE
[linkGitHubActionsProjectBadge]: https://github.com/flemay/docker-musketeers/workflows/Deploy/badge.svg
[linkGitHubActionsProject]: https://github.com/flemay/docker-musketeers/actions
[linkDockerHubProjectBadge]: https://img.shields.io/badge/repository-dockerhub-blue.svg
[linkDockerHubProject]: https://hub.docker.com/r/flemay/musketeers
[linkDockerHubProjectBuild]: https://hub.docker.com/r/flemay/musketeers/builds/
[LinkDockerHubProjectPullsBadge]: https://img.shields.io/docker/pulls/flemay/musketeers
[linkDockerProjectBuildBadge]: https://img.shields.io/docker/build/flemay/musketeers.svg
