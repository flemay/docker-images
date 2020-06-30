FROM node:alpine
LABEL maintainer "@flemay"

RUN apk --no-cache update && apk --no-cache upgrade \
    && apk --no-cache add --upgrade ca-certificates make zip py-pip python3 python3-dev bash curl build-base groff
RUN pip3 --no-cache-dir install --upgrade pip aws-shell awscli aws-sam-cli cfn-lint cfn_flip
RUN npm install -g aws-cdk

CMD ["aws", "--version"]