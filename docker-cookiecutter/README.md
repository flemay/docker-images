# Docker - Cookiecutter

[![Build Status][linkGitHubActionsProjectBadge]][linkGitHubActionsProject]
[![Docker Build Status][linkDockerHubProjectBuildBadge]][linkDockerHubProjectBuild]
[![Generic badge][linkDockerHubProjectBadge]][linkDockerHubProject]
[![Docker Hub Pulls Badge][LinkDockerHubProjectPullsBadge]][linkDockerHubProject]
[![License][linkLicenseBadge]][linkLicense]

Docker image of the latest version of [Cookiecutter][linkGitHubCookiecutter], always!

## What's inside the image

- Based on the latest [Python Alpine image][linkAlpine]
- Latest version of [Cookiecutter][linkGitHubCookiecutter]
- Git
- OpenSSH

## Usage

```bash
# pull image
$ docker pull flemay/cookiecutter

# use the image to generate from a Cookiecutter template
$ docker run -it --rm \
    -v $PWD:/opt/app \
    -w /opt/app \
    flemay/cookiecutter \
    https://github.com/3musketeersio/cookiecutter-musketeers-go.git

# or
$ docker run -it --rm \
  -v $PWD:/opt/app \
  -v $HOME/.ssh:/root/.ssh:ro \
  -w /opt/app \
  flemay/cookiecutter \
  git@github.com:3musketeersio/cookiecutter-musketeers-go.git
```

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

A change to master triggers a [GitHub Action][linkGitHubActionsProject] that builds, tests, and pushes the image to [Docker Hub][linkDockerHubProject]. The automatic build on Docker Hub has been disabled ensuring the build process to only go through GitHub Actions. Moreover, to make sure the image is always up to date, a scheduled GitHub Action kicks off every month. Finally, a pull request triggers another GitHub Action which builds and tests the image.

## Contributing

Contributions are greatly appreciated. Everyone can contribute and [here][linkProjectContributing] are different ways.

## License

[MIT][linkLicense]


[linkProjectContributing]: CONTRIBUTING.md
[linkLicenseBadge]: https://img.shields.io/dub/l/vibe-d.svg
[linkLicense]: LICENSE
[linkGitHubActionsProjectBadge]: https://github.com/flemay/docker-cookiecutter/workflows/Deploy/badge.svg
[linkGitHubActionsProject]: https://github.com/flemay/docker-cookiecutter/actions
[linkDockerHubProjectBadge]: https://img.shields.io/badge/repository-dockerhub-blue.svg
[linkDockerHubProject]: https://hub.docker.com/r/flemay/cookiecutter
[linkDockerHubProjectBuild]: https://hub.docker.com/r/flemay/cookiecutter/builds/
[linkDockerHubProjectBuildBadge]: https://img.shields.io/docker/build/flemay/cookiecutter.svg
[LinkDockerHubProjectPullsBadge]: https://img.shields.io/docker/pulls/flemay/cookiecutter

[linkDockerRegistry]: https://hub.docker.com/r/flemay/cookiecutter
[linkAlpine]: https://hub.docker.com/_/python/
[linkGitHubCookiecutter]: https://github.com/cookiecutter/cookiecutter