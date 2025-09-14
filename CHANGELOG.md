# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.0.7] - 2025-09-15

### Added

- Added Codex CLI (OpenAI) to the list of AI CLI tools
- Added update-ai-tools script for updating all AI CLI tools with a single command
  - Updates claude-code, gemini-cli, qwen-code, and codex-cli
  - Provides progress indicators and error handling
  - Installed system-wide at /usr/local/bin/update-ai-tools

## [0.0.6] - 2025-08-13

### Added

- Added screen and tmux terminal multiplexers for better terminal management
- Added Goose CLI for database migrations
- Added `--no-cache` flag to Docker build commands in Makefile for fresh builds

### Changed

- Optimized setup.sh script with error handling (`set -e`)
- Combined all apt package installations into a single command for better Docker layer caching
- Combined all npm global package installations into a single command
- Added apt cache cleanup to reduce Docker image size
- Removed unnecessary sudo from pyinfo installation (runs as root in Docker)
- Fixed typos in setup.sh comments

### Documentation

- Updated README.md to accurately reflect all installed packages
- Reorganized package list into categories (Base Features, Additional Tools, NPM Packages)

## [0.0.5] - 2025-08-12

### Added

- Added uv (Python package manager) - an extremely fast Python package and project manager written in Rust
- Added qwen-code CLI tool
- Added claude-code-router CLI tool

## [0.0.4] - 2025-08-11

### Fixed

- Fixed npm global package permission issues by installing packages to user-specific directory (/home/vscode/.npm-global)
- Fixed build errors related to missing /home/vscode directory and .npm cache directory
- Global npm packages can now be upgraded without permission errors in devcontainer environments

## [0.0.3] - 2025-06-26

### Added

- Added Gemini CLI.
- Added RepoMix.
- Added CCUsage.

## [0.0.2] - 2025-06-20

### Added

- Added Claude Code cli.
- Added mise (polyglot runtime manager) via devcontainer feature

## [0.0.1] - 2024-10-04

### Added

- Initial release