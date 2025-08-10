# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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