# This Makefile is meant to be used by people that do not usually work
# with Go source code. If you know what GOPATH is then you probably
# don't need to bother with make.

.PHONY: gol android ios gol-cross swarm evm all test clean
.PHONY: gol-linux gol-linux-386 gol-linux-amd64 gol-linux-mips64 gol-linux-mips64le
.PHONY: gol-linux-arm gol-linux-arm-5 gol-linux-arm-6 gol-linux-arm-7 gol-linux-arm64
.PHONY: gol-darwin gol-darwin-386 gol-darwin-amd64
.PHONY: gol-windows gol-windows-386 gol-windows-amd64

GOBIN = $(shell pwd)/build/bin
GO ?= latest

gol:
	build/env.sh go run build/ci.go install ./cmd/gol
	@echo "Done building."
	@echo "Run \"$(GOBIN)/gol\" to launch gol."

swarm:
	build/env.sh go run build/ci.go install ./cmd/swarm
	@echo "Done building."
	@echo "Run \"$(GOBIN)/swarm\" to launch swarm."

all:
	build/env.sh go run build/ci.go install

android:
	build/env.sh go run build/ci.go aar --local
	@echo "Done building."
	@echo "Import \"$(GOBIN)/gol.aar\" to use the library."

ios:
	build/env.sh go run build/ci.go xcode --local
	@echo "Done building."
	@echo "Import \"$(GOBIN)/gol.framework\" to use the library."

test: all
	build/env.sh go run build/ci.go test

clean:
	rm -fr build/_workspace/pkg/ $(GOBIN)/*

# The devtools target installs tools required for 'go generate'.
# You need to put $GOBIN (or $GOPATH/bin) in your PATH to use 'go generate'.

devtools:
	env GOBIN= go get -u golang.org/x/tools/cmd/stringer
	env GOBIN= go get -u github.com/jteeuwen/go-bindata/go-bindata
	env GOBIN= go get -u github.com/fjl/gencodec
	env GOBIN= go install ./cmd/abigen

# Cross Compilation Targets (xgo)

gol-cross: gol-linux gol-darwin gol-windows gol-android gol-ios
	@echo "Full cross compilation done:"
	@ls -ld $(GOBIN)/gol-*

gol-linux: gol-linux-386 gol-linux-amd64 gol-linux-arm gol-linux-mips64 gol-linux-mips64le
	@echo "Linux cross compilation done:"
	@ls -ld $(GOBIN)/gol-linux-*

gol-linux-386:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/386 -v ./cmd/gol
	@echo "Linux 386 cross compilation done:"
	@ls -ld $(GOBIN)/gol-linux-* | grep 386

gol-linux-amd64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/amd64 -v ./cmd/gol
	@echo "Linux amd64 cross compilation done:"
	@ls -ld $(GOBIN)/gol-linux-* | grep amd64

gol-linux-arm: gol-linux-arm-5 gol-linux-arm-6 gol-linux-arm-7 gol-linux-arm64
	@echo "Linux ARM cross compilation done:"
	@ls -ld $(GOBIN)/gol-linux-* | grep arm

gol-linux-arm-5:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm-5 -v ./cmd/gol
	@echo "Linux ARMv5 cross compilation done:"
	@ls -ld $(GOBIN)/gol-linux-* | grep arm-5

gol-linux-arm-6:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm-6 -v ./cmd/gol
	@echo "Linux ARMv6 cross compilation done:"
	@ls -ld $(GOBIN)/gol-linux-* | grep arm-6

gol-linux-arm-7:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm-7 -v ./cmd/gol
	@echo "Linux ARMv7 cross compilation done:"
	@ls -ld $(GOBIN)/gol-linux-* | grep arm-7

gol-linux-arm64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm64 -v ./cmd/gol
	@echo "Linux ARM64 cross compilation done:"
	@ls -ld $(GOBIN)/gol-linux-* | grep arm64

gol-linux-mips:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mips --ldflags '-extldflags "-static"' -v ./cmd/gol
	@echo "Linux MIPS cross compilation done:"
	@ls -ld $(GOBIN)/gol-linux-* | grep mips

gol-linux-mipsle:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mipsle --ldflags '-extldflags "-static"' -v ./cmd/gol
	@echo "Linux MIPSle cross compilation done:"
	@ls -ld $(GOBIN)/gol-linux-* | grep mipsle

gol-linux-mips64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mips64 --ldflags '-extldflags "-static"' -v ./cmd/gol
	@echo "Linux MIPS64 cross compilation done:"
	@ls -ld $(GOBIN)/gol-linux-* | grep mips64

gol-linux-mips64le:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mips64le --ldflags '-extldflags "-static"' -v ./cmd/gol
	@echo "Linux MIPS64le cross compilation done:"
	@ls -ld $(GOBIN)/gol-linux-* | grep mips64le

gol-darwin: gol-darwin-386 gol-darwin-amd64
	@echo "Darwin cross compilation done:"
	@ls -ld $(GOBIN)/gol-darwin-*

gol-darwin-386:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=darwin/386 -v ./cmd/gol
	@echo "Darwin 386 cross compilation done:"
	@ls -ld $(GOBIN)/gol-darwin-* | grep 386

gol-darwin-amd64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=darwin/amd64 -v ./cmd/gol
	@echo "Darwin amd64 cross compilation done:"
	@ls -ld $(GOBIN)/gol-darwin-* | grep amd64

gol-windows: gol-windows-386 gol-windows-amd64
	@echo "Windows cross compilation done:"
	@ls -ld $(GOBIN)/gol-windows-*

gol-windows-386:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=windows/386 -v ./cmd/gol
	@echo "Windows 386 cross compilation done:"
	@ls -ld $(GOBIN)/gol-windows-* | grep 386

gol-windows-amd64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=windows/amd64 -v ./cmd/gol
	@echo "Windows amd64 cross compilation done:"
	@ls -ld $(GOBIN)/gol-windows-* | grep amd64
