FROM ubuntu:xenial

RUN \
  apt-get update && apt-get upgrade -q -y && \
  apt-get install -y --no-install-recommends golang git make gcc libc-dev ca-certificates && \
  git clone --depth 1 --branch release/1.5 https://github.com/GoldiamTech/go-goldiam && \
  (cd go-goldiam && make ggol) && \
  cp go-goldiam/build/bin/ggol /ggol && \
  apt-get remove -y golang git make gcc libc-dev && apt autoremove -y && apt-get clean && \
  rm -rf /go-goldiam

EXPOSE 2009
EXPOSE 52018

ENTRYPOINT ["/ggol"]
