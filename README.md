# noble-prebuild

This repository is a prebuilt [Devcontainer](https://containers.dev/) that uses the [Devcontainer features](https://containers.dev/features) to build a base image and then installs additional software.

## jvrck/noble-full image
This is a prebuilt image that is based on the latest devcontainers Ubuntu 24.04 noble base and contains the following software:

### Base Image Features (via Devcontainer)
- Docker in Docker
- Python 3.12
- Node.js 20
- AWS CLI v2
- mise (polyglot runtime manager)

### Additional Tools
- GitHub CLI (gh)
- Vim editor
- PostgreSQL Client
- MySQL Client
- Screen
- Tmux
- Goose CLI (database migration tool)
- Pyinfo
- UV (Python package manager)

### NPM Global Packages
- Devcontainer CLI
- Claude Code CLI
- Gemini CLI
- Codex CLI (OpenAI)
- Repomix
- CCUsage
- Claude Code Router
- Qwen Code CLI

## How to use this image

### Running in VS Code
To use this image in VS Code, create a `.devcontainer/devcontainer.json` file in your project and add the following configuration:

```json
{
	"name": "Dev Container",
	"image": "ghcr.io/jvrck/noble-full"
}
```
Then use the [VS Code Remote - Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) and select the `Reopen in Container` option.

This will open a new VS Code window with the Devcontainer running.

This will also work with Github Codespaces, as the Devcontainer feature is supported.

### Running locally in Terminal (without VS Code)
You can run this container directly on your local machine using Docker:

```bash
docker run -it --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v $(pwd):/workspace \
    -w /workspace \
    ghcr.io/jvrck/noble-full
```

This command:
- Runs the container interactively (`-it`)
- Removes the container when you exit (`--rm`)
- Mounts the Docker socket for Docker-in-Docker functionality
- Mounts your current directory to `/workspace`
- Sets the working directory to `/workspace`

## Image Cleanup Policy

This repository includes an automated GitHub Actions workflow that cleans up old container images from GitHub Container Registry to prevent storage bloat. The cleanup runs weekly and:

- Deletes images older than 30 days
- Always keeps at least 5 most recent versions
- Never deletes images tagged as 'latest'
- Currently runs in dry-run mode for safety

To enable automatic cleanup:
1. Create a Personal Access Token (PAT) with `delete:packages` scope
2. Add it as a repository secret named `GHCR_CLEANUP_PAT`
3. Edit `.github/workflows/cleanup-ghcr.yaml` and set `dry-run: false`

The workflow can also be triggered manually from the Actions tab.

## License
This repository is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.