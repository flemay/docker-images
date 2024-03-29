# Docker - AWS (2)

AWS CLI (v2) and some tools.

## What's inside the image

* Based on the official [AWS CLI Docker image][link-aws-cli-image]
* [AWS CLI v2][link-aws-cli-v2]
* [Session Manager][link-session-manager]
* [aws-shell][link-aws-shell]
* [cfn-lint][link-cfn-lint]
* [cfn-flip][link-cfn-flip]

## Usage

```bash
% git clone https://github.com/flemay/docker-images.git
% cd docker-aws2
# Build image
% make build
# Create .env file with AWS env vars
% make envfile
# Assume my-role
% . awsume my-role
# Shell into container
% make shell
# List s3 buckets
% aws s3 ls
# Connect to an EC2 instance with AWS Session Manager
% aws ssm start-session --target ec2-instance-id
```

[link-aws-cli-image]: https://gallery.ecr.aws/aws-cli/aws-cli
[link-aws-cli-v2]: https://github.com/aws/aws-cli/tree/v2
[link-session-manager]: https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html
[link-aws-shell]: https://github.com/awslabs/aws-shell
[link-cfn-lint]: https://github.com/aws-cloudformation/cfn-python-lint
[link-cfn-flip]: https://github.com/awslabs/aws-cfn-template-flip
