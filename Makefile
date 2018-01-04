# This Makefile is meant to be used by people that do not usually work
# with Go source code. If you know what GOPATH is then you probably
# don't need to bother with make.

.PHONY: ggol android ios ggol-cross swarm evm all test clean
.PHONY: ggol-linux ggol-linux-386 ggol-linux-amd64 ggol-linux-mips64 ggol-linux-mips64le
.PHONY: ggol-linux-arm ggol-linux-arm-5 ggol-linux-arm-6 ggol-linux-arm-7 ggol-linux-arm64
.PHONY: ggol-darwin ggol-darwin-386 ggol-darwin-amd64
.PHONY: ggol-windows ggol-windows-386 ggol-windows-amd64

GOBIN = $(shell pwd)/build/bin
GO ?= latest

ggol:
	build/env.sh go run build/ci.go install ./cmd/ggol
	@echo "Done building."
	@echo "Run \"$(GOBIN)/ggol\" to launch ggol."

swarm:
	build/env.sh go run build/ci.go install ./cmd/swarm
	@echo "Done building."
	@echo "Run \"$(GOBIN)/swarm\" to launch swarm."

all:
	build/env.sh go run build/ci.go install

android:
	build/env.sh go run build/ci.go aar --local
	@echo "Done building."
	@echo "Import \"$(GOBIN)/ggol.aar\" to use the library."

ios:
	build/env.sh go run build/ci.go xcode --local
	@echo "Done building."
	@echo "Import \"$(GOBIN)/ggol.framework\" to use the library."

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

ggol-cross: ggol-linux ggol-darwin ggol-windows ggol-android ggol-ios
	@echo "Full cross compilation done:"
	@ls -ld $(GOBIN)/ggol-*

ggol-linux: ggol-linux-386 ggol-linux-amd64 ggol-linux-arm ggol-linux-mips64 ggol-linux-mips64le
	@echo "Linux cross compilation done:"
	@ls -ld $(GOBIN)/ggol-linux-*

ggol-linux-386:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/386 -v ./cmd/ggol
	@echo "Linux 386 cross compilation done:"
	@ls -ld $(GOBIN)/ggol-linux-* | grep 386

ggol-linux-amd64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/amd64 -v ./cmd/ggol
	@echo "Linux amd64 cross compilation done:"
	@ls -ld $(GOBIN)/ggol-linux-* | grep amd64

ggol-linux-arm: ggol-linux-arm-5 ggol-linux-arm-6 ggol-linux-arm-7 ggol-linux-arm64
	@echo "Linux ARM cross compilation done:"
	@ls -ld $(GOBIN)/ggol-linux-* | grep arm

ggol-linux-arm-5:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm-5 -v ./cmd/ggol
	@echo "Linux ARMv5 cross compilation done:"
	@ls -ld $(GOBIN)/ggol-linux-* | grep arm-5

ggol-linux-arm-6:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm-6 -v ./cmd/ggol
	@echo "Linux ARMv6 cross compilation done:"
	@ls -ld $(GOBIN)/ggol-linux-* | grep arm-6

ggol-linux-arm-7:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm-7 -v ./cmd/ggol
	@echo "Linux ARMv7 cross compilation done:"
	@ls -ld $(GOBIN)/ggol-linux-* | grep arm-7

ggol-linux-arm64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm64 -v ./cmd/ggol
	@echo "Linux ARM64 cross compilation done:"
	@ls -ld $(GOBIN)/ggol-linux-* | grep arm64

ggol-linux-mips:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mips --ldflags '-extldflags "-static"' -v ./cmd/ggol
	@echo "Linux MIPS cross compilation done:"
	@ls -ld $(GOBIN)/ggol-linux-* | grep mips

ggol-linux-mipsle:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mipsle --ldflags '-extldflags "-static"' -v ./cmd/ggol
	@echo "Linux MIPSle cross compilation done:"
	@ls -ld $(GOBIN)/ggol-linux-* | grep mipsle

ggol-linux-mips64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mips64 --ldflags '-extldflags "-static"' -v ./cmd/ggol
	@echo "Linux MIPS64 cross compilation done:"
	@ls -ld $(GOBIN)/ggol-linux-* | grep mips64

ggol-linux-mips64le:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mips64le --ldflags '-extldflags "-static"' -v ./cmd/ggol
	@echo "Linux MIPS64le cross compilation done:"
	@ls -ld $(GOBIN)/ggol-linux-* | grep mips64le

ggol-darwin: ggol-darwin-386 ggol-darwin-amd64
	@echo "Darwin cross compilation done:"
	@ls -ld $(GOBIN)/ggol-darwin-*

ggol-darwin-386:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=darwin/386 -v ./cmd/ggol
	@echo "Darwin 386 cross compilation done:"
	@ls -ld $(GOBIN)/ggol-darwin-* | grep 386

ggol-darwin-amd64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=darwin/amd64 -v ./cmd/ggol
	@echo "Darwin amd64 cross compilation done:"
	@ls -ld $(GOBIN)/ggol-darwin-* | grep amd64

ggol-windows: ggol-windows-386 ggol-windows-amd64
	@echo "Windows cross compilation done:"
	@ls -ld $(GOBIN)/ggol-windows-*

ggol-windows-386:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=windows/386 -v ./cmd/ggol
	@echo "Windows 386 cross compilation done:"
	@ls -ld $(GOBIN)/ggol-windows-* | grep 386

ggol-windows-amd64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=windows/amd64 -v ./cmd/ggol
	@echo "Windows amd64 cross compilation done:"
	@ls -ld $(GOBIN)/ggol-windows-* | grep amd64
