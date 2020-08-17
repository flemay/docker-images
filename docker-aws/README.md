# Docker - AWS

[![Push Status][linkGitHubActionsProjectBadge]][linkGitHubActionsProject]
[![Generic badge][linkDockerHubProjectBadge]][linkDockerHubProject]
[![Docker Hub Pulls Badge][LinkDockerHubProjectPullsBadge]][linkDockerHubProject]
[![License][linkLicenseBadge]][linkLicense]

Docker image of the latest and greatest of AWS tools, always.

## What's inside the image

- Based on NodeJS alpine image
- [aws-cli][linkAWSCLI]
- [aws-cdk][linkAWSCDK]
- [aws-shell][linkAWSShell]
- [aws-sam][linkAWSSAM]
- [cfn-lint][linkCloudFormationLinter]
- [cfn-flip][linkCloudFormationTemplateFlip]

## Usage

```bash
# Configure aws inside the container only
$ docker run --rm -it flemay/aws bash
$> aws configure

# Run image with env vars (useful when using assume role)
$ docker run --rm -it \
  -e "AWS_ACCESS_KEY_ID" \
  -e "AWS_SECRET_ACCESS_KEY" \
  -e "AWS_SESSION_TOKEN" \
  -e "AWS_SECURITY_TOKEN" \
  -e "ASSUMED_ROLE" \
  -e "AWS_REGION" \
  -e "AWS_DEFAULT_REGION" \
  -e "AWS_PROFILE" \
  -v ~/.aws:/root/.aws \
  -v $(PWD):/opt/app:Z -w /opt/app \
  flemay/aws bash

# Create a new AWS profile
$ docker run --rm -it -v /path/to/.aws:/root/.aws flemay/aws bash
$> aws configure --profile my-user-profile
AWS Access Key ID [None]: key
AWS Secret Access Key [None]: secret
Default region name [None]: ap-southeast-2
Default output format [None]:

# Query - list all function names that run on NodeJS 6.10
$> aws lambda list-functions --region ap-southeast-2 --query Functions[?Runtime=="'nodejs6.10'"].FunctionName | sort
```

## Development

```bash
# Build image locally
# generate .env file
$ make envfile

# build image
$ make build

# test image
$ make test

# go inside the container
$ make shell
```

## Versioning

This image will always be built with the tag `latest` and tools will always be up to date. This may cause issues if any tool has a breaking change.

## Automated build process

A change to master triggers a GitHub Action that builds, tests, and pushes the image to Docker Hub. The automatic build on Docker Hub has been disabled ensuring the build process to only go through GitHub Actions. Moreover, to make sure the image is always up to date, a scheduled GitHub Action kicks off every month. Finally, a pull request triggers another GitHub Action which builds and tests the image.

## Contributing

Contributions are greatly appreciated. Everyone can contribute and [here][linkProjectContributing] are different ways.

## License

[MIT][linkLicense]


[linkProjectContributing]: CONTRIBUTING.md
[linkLicenseBadge]: https://img.shields.io/dub/l/vibe-d.svg
[linkLicense]: LICENSE

[linkGitHubActionsProjectBadge]: https://github.com/flemay/docker-images/workflows/Push-AWS/badge.svg
[linkGitHubActionsProject]: https://github.com/flemay/docker-images/actions

[linkDockerHubProjectBadge]: https://img.shields.io/badge/repository-dockerhub-blue.svg
[linkDockerHubProject]: https://hub.docker.com/r/flemay/aws
[LinkDockerHubProjectPullsBadge]: https://img.shields.io/docker/pulls/flemay/aws

[linkAWSCDK]: https://github.com/awslabs/aws-cdk
[linkAWSShell]: https://github.com/awslabs/aws-shell
[linkAWSCLI]: https://github.com/aws/aws-cli
[linkAWSSAM]: https://github.com/awslabs/serverless-application-model
[linkCloudFormationLinter]: https://github.com/aws-cloudformation/cfn-python-lint
[linkCloudFormationTemplateFlip]: https://github.com/awslabs/aws-cfn-template-flip