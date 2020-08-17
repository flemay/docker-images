FROM python:alpine
LABEL maintainer "@flemay"
RUN apk add --update git make openssh-client
RUN pip install cookiecutter
ENTRYPOINT [ "cookiecutter" ]