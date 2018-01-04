FROM alpine:3.6
##FROM ubuntu
ADD . /ggol
RUN apk add --update bash && rm -rf /var/cache/apk/*
RUN \
  apk add --no-cache git go make gcc musl-dev linux-headers && \
  (cd go-goldiam && make ggol)                             && \
  cp go-goldiam/build/bin/ggol /usr/local/bin/             && \
  apk del git go make gcc musl-dev linux-headers            && \
  rm -rf /go-goldiam
ADD start.sh /root/start.sh

EXPOSE 2009 52018 52018/udp

ENTRYPOINT /root/start.sh
