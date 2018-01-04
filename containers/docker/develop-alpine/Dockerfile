FROM alpine:3.5

RUN \
  apk add --update go git make gcc musl-dev linux-headers ca-certificates && \
  git clone --depth 1 https://github.com/GoldiamTech/go-goldiam && \
  (cd go-goldiam && make ggol) && \
  cp go-goldiam/build/bin/ggol /ggol && \
  apk del go git make gcc musl-dev linux-headers && \
  rm -rf /go-goldiam && rm -rf /var/cache/apk/*

EXPOSE 2009
EXPOSE 52018

ENTRYPOINT ["/ggol"]
