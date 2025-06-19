# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Docker/Devcontainer prebuild project that creates custom development container images based on Ubuntu 24.04 (Noble). The project builds two main images:

- `noble-full-base`: A base image with core development tools installed via Devcontainer features
- `noble-full`: An extended image with additional tools and utilities

## Build Commands

```bash
# Build the base devcontainer image (requires devcontainer CLI)
make build-full-base

# Build the full Docker image with additional tools
make build-full

# Pull latest images from GitHub Container Registry (requires GH_USER and GH_TOKEN env vars)
make pull

# Show available commands
make help
```

## Architecture

The project uses a two-stage approach:

1. **Base Image** (`noble-full-base/`): Uses Microsoft's Devcontainer specification to install core features:
   - Ubuntu 24.04 base
   - Docker-in-Docker
   - Python 3.12
   - Node.js LTS (with npm, yarn, pnpm)
   - AWS CLI v2
   - mise (polyglot runtime manager)

2. **Full Image** (`noble-full/`): Extends the base image by running `setup.sh` to install:
   - GitHub CLI (`gh`)
   - PostgreSQL and MySQL clients
   - Vim editor
   - pyinfo tool
   - Devcontainer CLI
   - Claude Code CLI

## CI/CD Workflows

GitHub Actions workflows automatically build and push images:

- `build-noble-base.yaml`: Builds base image on main branch pushes and every 3 days
- `build-noble.yaml`: Builds full image on all branches (pushes to registry only from main)

Both workflows push to GitHub Container Registry at `ghcr.io/jvrck/`.

## Development Notes

- When modifying the base image, edit `noble-full-base/.devcontainer/devcontainer.json`
- When adding tools to the full image, update `noble-full/setup.sh`
- The Makefile header incorrectly mentions "BB-Runner CloudFormation Stack" but this is actually the noble-prebuild project
- Images are built for linux/amd64 platform only
- Version changes should be documented in CHANGELOG.md following Keep a Changelog format
