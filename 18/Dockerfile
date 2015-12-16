FROM azukiapp/alpine:3.2
MAINTAINER Azuki <support@azukiapp.com>

ENV PKGNAME erlang
ENV ERLANG_VERSION 18.1
ENV REPOSITORY @community

# Get and install erlang from deb package
RUN  apk update \
  && apk add \
    'ncurses-terminfo-base@edge>6.0' \
    'ncurses5-libs@edge>5.9' \
    'ncurses-terminfo@edge>6.0' \
    'ncurses-libs@edge>6.0' \
  && TAG="${REPOSITORY}>${ERLANG_VERSION}" \
  && apk add \
    "${PKGNAME}-kernel${TAG}" \
    "${PKGNAME}-stdlib${TAG}" \
    "${PKGNAME}-compiler${TAG}" \
    "${PKGNAME}-kernel${TAG}" \
    "${PKGNAME}-stdlib${TAG}" \
    "${PKGNAME}-compiler${TAG}" \
    "${PKGNAME}-crypto${TAG}" \
    "${PKGNAME}-syntax-tools${TAG}" \
    "${PKGNAME}-inets${TAG}" \
    "${PKGNAME}-ssl${TAG}" \
    "${PKGNAME}-public-key${TAG}" \
    "${PKGNAME}-asn1${TAG}" \
    "${PKGNAME}-sasl${TAG}" \
    "${PKGNAME}-erl-interface${TAG}" \
    "${PKGNAME}-dev${TAG}" \
    "${PKGNAME}-eunit${TAG}" \
    "${PKGNAME}${TAG}" \
  && rm -rf /var/cache/apk/* /var/tmp/* /tmp/*

CMD ["erl"]
