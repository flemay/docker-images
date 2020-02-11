FROM alpine:latest
LABEL maintainer "@flemay"
RUN apk --update add bash curl nodejs npm yarn git \
  && rm -rf /var/cache/apk/*

# install latest version of hugo
RUN TAG_LATEST_URL="$(curl -LsI -o /dev/null -w %{url_effective} https://github.com/gohugoio/hugo/releases/latest)" \
  && echo ${TAG_LATEST_URL} \
  && HUGO_VERSION="$(echo ${TAG_LATEST_URL} | egrep -o '[0-9]+\.[0-9]+\.?[0-9]*')" \
  && echo ${HUGO_VERSION} \
  && wget -qO- "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz" | tar xz \
  && mv hugo /usr/local/bin/ \
  && chmod +x /usr/local/bin/hugo

RUN hugo version

# install few node modules needed by Hugo (https://gohugo.io/hugo-pipes/postcss/)
RUN node --version \
  && npm install -g postcss-cli autoprefixer

WORKDIR /opt/app