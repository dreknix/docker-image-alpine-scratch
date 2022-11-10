FROM scratch

LABEL description="Building Alpine image from scratch"
LABEL maintainer="dreknix <dreknix@proton.me>"

ARG ALPINE_VERSION
ARG ALPINE_ARCH
ARG VERSION

LABEL version="${VERSION}"

ADD alpine-minirootfs-${ALPINE_VERSION}-${ALPINE_ARCH}.tar.gz /

# when date is changed, the packages get upgraded
ENV LAST_UPGRADE_ON 20221110

RUN \
    apk update && \
    apk upgrade && \
    rm -rf /var/cache/apk/*

CMD ["/bin/sh"]
