# noble-prebuild

This repository is a prebuilt [Devcontainer](https://containers.dev/) that uses the [Devcontainer features](https://containers.dev/features) to build a base image and then installs additional software.

## jvrck/noble-full image
This is a prebuilt image that is based on the latest devcontainers Ubuntu 24.04 noble base and contains the following software:

- Docker in Docker (via Devcontainer feature) 
- Python 3.12 (via Devcontainer feature)
- Node.js 20 (via Devcontainer feature)
- AWS CLI v2 (via Devcontainer feature)
- mise (polyglot runtime manager) (via Devcontainer feature)
- Github CLI
- MySQL Client
- PostgreSQL Client
- Devcontainer CLI
- Claude Code CLI
- Gemini CLI
- RepoMix
- CCUsage

## How to use this image
To use this image, you can create a `.devcontainer/devcontainer.json` file in your project and add the following configuration:

```json
{
	"name": "Dev Container",
	"image": "ghcr.io/jvrck/noble-full"
}
```
To run a Devcontainer, you can use the [VS Code Remote - Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) and select the `Reopen in Container` option.

This will open a new VS Code window with the Devcontainer running.

This will also work with Github Codespaces, as the Devcontainer feature is supported.

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