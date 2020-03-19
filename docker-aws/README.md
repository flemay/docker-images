[![Build Status][linkGitHubActionsProjectBadge]][linkGitHubActionsProject]
[![Docker Build Status][linkDockerHubProjectBuildBadge]][linkDockerHubProjectBuild]
[![Generic badge][linkDockerHubProjectBadge]][linkDockerHubProject]
[![Docker Hub Pulls Badge][LinkDockerHubProjectPullsBadge]][linkDockerHubProject]
[![License][linkLicenseBadge]][linkLicense]

# Docker - AWS

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
# run image from docker hub
$ docker run --rm flemay/aws
# run image with env vars (useful when using assume role)
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

# build image locally
# generate .env file
$ make envfile
# build image
$ make build
# test image
$ make test
# go inside the container
$ make shell
```

## Examples

### Create a new AWS profile

```bash
$ docker run --rm -it -v /path/to/.aws:/root/.aws flemay/aws bash
$ aws configure --profile my-user-profile
AWS Access Key ID [None]: key
AWS Secret Access Key [None]: secret
Default region name [None]: ap-southeast-2
Default output format [None]:
```

### Query

```bash
# list all function names that run on NodeJS 6.10
$ aws lambda list-functions --region ap-southeast-2 --query Functions[?Runtime=="'nodejs6.10'"].FunctionName | sort
```

## Versioning

This image will always be built with the tag `latest` and tools will always be up to date. This may cause issues if any tool has a breaking change.

## Automated build process

A change to master triggers a [GitHub Action][linkGitHubActionsProject] that tests and triggers [Docker Hub build][linkDockerHubProjectBuild]. The automatic build on Docker Hub has been disabled ensuring the build process to go through GitHub Actions first. Moreover, to make sure the image is always up to date, a scheduled GitHub Action kicks off every month. Finally, a pull request triggers another GitHub Action which tests it without deploying.



[linkLicenseBadge]: https://img.shields.io/dub/l/vibe-d.svg
[linkLicense]: LICENSE
[linkGitHubActionsProjectBadge]: https://github.com/flemay/docker-aws/workflows/Deploy/badge.svg
[linkGitHubActionsProject]: https://github.com/flemay/docker-aws/actions
[linkDockerHubProjectBadge]: https://img.shields.io/badge/repository-dockerhub-blue.svg
[linkDockerHubProject]: https://hub.docker.com/r/flemay/aws
[linkDockerHubProjectBuild]: https://hub.docker.com/r/flemay/aws/builds/
[linkDockerHubProjectBuildBadge]: https://img.shields.io/docker/build/flemay/aws.svg
[LinkDockerHubProjectPullsBadge]: https://img.shields.io/docker/pulls/flemay/aws

[linkAWSCDK]: https://github.com/awslabs/aws-cdk
[linkAWSShell]: https://github.com/awslabs/aws-shell
[linkAWSCLI]: https://github.com/aws/aws-cli
[linkAWSSAM]: https://github.com/awslabs/serverless-application-model
[linkCloudFormationLinter]: https://github.com/aws-cloudformation/cfn-python-lint
[linkCloudFormationTemplateFlip]: https://github.com/awslabs/aws-cfn-template-flip