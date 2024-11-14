# Kubernetes context and namespace switcher

The motivation for this script is to make it easier to switch between contexts and namespaces in Kubernetes.

There are a lot of tools out there that do it better than this script, but the ones I tried never worked the way I wanted or expected. For that reason I decided to use a vanilla kubectl approach.

This script will modify your config file to add a context and namespace for each cluster and namespace you want to switch to. Tools like `kubie` or `kubectx` won't modify your config file, but they will add a lot of extra files to your system.

## Requirements

- fzf
- kubectl
- yq
    
## Installation

1. Copy the kpuf.fish file to your fish functions directory (recommended: `$HOME/.config/fish/functions/kpuf.fish`).
2. Copy the kpuf.sample.yaml to your preferred location (recommended: `$HOME/.config/fish/functions/kpuf.yaml`) and modify it to suit your needs.
3. Add the following to your fish config file:
```sh
set -x KPUF_CONFIG_FILE "$HOME/.config/fish/functions/kpuf.yaml"
```
