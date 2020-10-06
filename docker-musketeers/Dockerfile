FROM docker
LABEL maintainer "@flemay"
RUN apk --no-cache update && apk --no-cache upgrade \
    && apk --no-cache add --upgrade make zip git curl docker-compose openssl bash gettext
CMD [ "make" ]
