FROM alpine:3.2

ENV S3FS_VERSION 1.79
RUN apk --update add fuse alpine-sdk
RUN apk add automake autoconf
RUN apk add fuse-dev libxml2-dev curl-dev

RUN wget -qO- https://github.com/s3fs-fuse/s3fs-fuse/archive/v${S3FS_VERSION}.tar.gz|tar xz

#RUN cd s3fs-fuse-${S3FS_VERSION} && ./autogen.sh && ./configure --prefix=/usr && make && make install
WORKDIR /s3fs-fuse-${S3FS_VERSION}
RUN ./autogen.sh
RUN ./configure --prefix=/usr
RUN make
RUN make install

CMD ["/bin/bash"]
