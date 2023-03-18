FROM public.ecr.aws/aws-cli/aws-cli
LABEL maintainer "@flemay"

RUN yum update -y \
  && yum install -y \
    make \
    python3 \
  && yum clean all \
  && pip3 --no-cache-dir install --upgrade \
    aws-shell \
    cfn_flip \
    cfn-lint

RUN curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/linux_arm64/session-manager-plugin.rpm" -o "session-manager-plugin.rpm" \
  && yum install -y session-manager-plugin.rpm \
  && rm session-manager-plugin.rpm

