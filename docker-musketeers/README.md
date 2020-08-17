# Docker - Musketeers

[![GitHub Repository][linkGitHubProjectRepositoryBadge]][linkGitHubProjectRepository]
[![Push Status][linkGitHubActionsProjectBadge]][linkGitHubActionsProject]
[![DockerHub Repository][linkDockerHubProjectBadge]][linkDockerHubProject]
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

This image is used when pushing the Docker images of this Monorepo.

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

A change to master triggers a GitHub Action that builds, tests, and pushes the image to Docker Hub. The automatic build on Docker Hub has been disabled ensuring the build process to only go through GitHub Actions. Moreover, to make sure the image is always up to date, a scheduled GitHub Action kicks off every month. Finally, a pull request triggers another GitHub Action which builds and tests the image.

## Contributing

Contributions are greatly appreciated. Everyone can contribute and [here][linkProjectContributing] are different ways.

## License

[MIT][linkLicense]


[linkProjectContributing]: CONTRIBUTING.md
[link3Musketeers]: https://3musketeers.io

[linkLicenseBadge]: https://img.shields.io/dub/l/vibe-d.svg
[linkLicense]: LICENSE

[linkGitHubProjectRepositoryBadge]: https://img.shields.io/badge/repository-github-black.svg
[linkGitHubProjectRepository]: https://github.com/flemay/docker-images/tree/master/docker-musketeers
[linkGitHubActionsProjectBadge]: https://github.com/flemay/docker-images/workflows/Push-Musketeers/badge.svg
[linkGitHubActionsProject]: https://github.com/flemay/docker-images/actions

[linkDockerHubProjectBadge]: https://img.shields.io/badge/repository-dockerhub-blue.svg
[linkDockerHubProject]: https://hub.docker.com/r/flemay/musketeers
[LinkDockerHubProjectPullsBadge]: https://img.shields.io/docker/pulls/flemay/musketeers
