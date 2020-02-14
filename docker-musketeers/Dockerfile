FROM docker
LABEL maintainer "@flemay"
# for some reasons packages "gcc python2-dev openssl-dev libffi-dev musl-dev" are required
# to install compose, which previously were not
RUN apk --no-cache update && apk --no-cache upgrade \
    && apk --no-cache add --upgrade make zip git curl python3 openssl bash gettext \
    && apk --no-cache --virtual build-deps add gcc python3-dev openssl-dev libffi-dev musl-dev \
    && pip3 install --upgrade \
      pip \
      docker-compose \
    && apk del build-deps
CMD [ "make" ]
