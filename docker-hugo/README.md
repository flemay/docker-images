# Docker - Hugo

[![GitHub Repository][linkGitHubProjectRepositoryBadge]][linkGitHubProjectRepository]
[![Push Status][linkGitHubActionsProjectBadge]][linkGitHubActionsProject]
[![DockerHub Repository][linkDockerHubProjectBadge]][linkDockerHubProject]
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

A change to master triggers a GitHub Action that builds, tests, and pushes the image to Docker Hub. The automatic build on Docker Hub has been disabled ensuring the build process to only go through GitHub Actions. Moreover, to make sure the image is always up to date, a scheduled GitHub Action kicks off every month. Finally, a pull request triggers another GitHub Action which builds and tests the image.

## Contributing

Contributions are greatly appreciated. Everyone can contribute and [here][linkContributing] are different ways.

## License

[MIT][linkLicense]


[linkFredericLemayRepo]: https://github.com/flemay/fredericlemay-com
[linkContributing]: https://github.com/flemay/docker-images/blob/master/CONTRIBUTING.md
[linkLicenseBadge]: https://img.shields.io/dub/l/vibe-d.svg
[linkLicense]: https://github.com/flemay/docker-images/blob/master/LICENSE

[linkGitHubProjectRepositoryBadge]: https://img.shields.io/badge/repository-github-black.svg
[linkGitHubProjectRepository]: https://github.com/flemay/docker-images/tree/master/docker-hugo
[linkGitHubActionsProjectBadge]: https://github.com/flemay/docker-images/workflows/Push-Hugo/badge.svg
[linkGitHubActionsProject]: https://github.com/flemay/docker-images/actions

[linkDockerHubProjectBadge]: https://img.shields.io/badge/repository-dockerhub-blue.svg
[linkDockerHubProject]: https://hub.docker.com/r/flemay/hugo
[LinkDockerHubProjectPullsBadge]: https://img.shields.io/docker/pulls/flemay/hugo

[linkHugo]: https://gohugo.io/
[linkNodeJS]: https://nodejs.org/
[linkPostcssCLI]: https://www.npmjs.com/package/postcss-cli
[linkDockerRegistry]: https://hub.docker.com/r/flemay/hugo
[linkAlpine]: https://hub.docker.com/_/alpine/
[linkHugoPostCSS]: https://gohugo.io/hugo-pipes/postcss/