.PHONY: build cluster test

default: build

build:
	go build -o bin/swarm    github.com/GoldiamTech/go-goldiam/cmd/swarm
	go build -o bin/ggol     github.com/GoldiamTech/go-goldiam/cmd/ggol
	go build -o bin/bootnode github.com/GoldiamTech/go-goldiam/cmd/bootnode

cluster: build
	scripts/boot-cluster.sh

test:
	go test -v github.com/GoldiamTech/go-goldiam/swarm/...
