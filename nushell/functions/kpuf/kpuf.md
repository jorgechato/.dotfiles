# Kubernetes context and namespace switcher

The motivation for this script is to make it easier to switch between contexts and namespaces in Kubernetes.

There are a lot of tools out there that do it better than this script, but the ones I tried never worked the way I wanted or expected. For that reason I decided to use a vanilla kubectl approach.

This script will modify your config file to add a context and namespace for each cluster and namespace you want to switch to. Tools like `kubie` or `kubectx` won't modify your config file, but they will add a lot of extra files to your system.

## Requirements

- fzf
- kubectl
- yq
