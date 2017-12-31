FROM alpine:3.6
##FROM ubuntu
ADD . /gol
RUN apk add --update bash && rm -rf /var/cache/apk/*
RUN \
  apk add --no-cache git go make gcc musl-dev linux-headers && \
  (cd gol && make gol)                             && \
  cp gol/build/bin/gol /usr/local/bin/             && \
  apk del git go make gcc musl-dev linux-headers            && \
  rm -rf /gol
ADD start.sh /root/start.sh

EXPOSE 6588 30303 30303/udp

ENTRYPOINT /root/start.sh
