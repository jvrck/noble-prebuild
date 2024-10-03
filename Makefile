# Makefile for BB-Runner CloudFormation Stack

# Phony targets
.PHONY: help

build-full-base:
	devcontainer build --image-name ghcr.io/jvrck/noble-full-base --platform "linux/amd64" --push false --workspace-folder noble-full-base
build-full:
	docker build -t ghcr.io/jvrck/noble-full ./noble-full
pull:
	docker login ghcr.io -u $(GH_USER) -p $(GH_TOKEN)
	docker pull ghcr.io/jvrck/noble-full-base
	docker pull ghcr.io/jvrck/noble-full

# Help
help:
	@echo "Available commands:"
	@echo "  make build-full-base	- Build noble-full-base devcontainer"
	@echo "  make build-full   	- Build noble-full from base"
	@echo "  make pull		- Pull images from ghcr.io"
	@echo "  make help     	- Show this help message"