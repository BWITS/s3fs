FROM alpine:3.2

MAINTAINER Bill ozbillwang@gmail.com
ENV REFRESHED_AT 20150916

ENV S3FS_VERSION 1.79
RUN apk --update add fuse alpine-sdk automake autoconf libxml2-dev fuse-dev curl-dev \
  && wget -qO- https://github.com/s3fs-fuse/s3fs-fuse/archive/v${S3FS_VERSION}.tar.gz|tar xz \
  && cd s3fs-fuse-${S3FS_VERSION} \
  && ./autogen.sh \
  && ./configure --prefix=/usr \
  && make \
  && make install \
  && rm -rf /var/cache/apk/* 

CMD ["/bin/sh"]
