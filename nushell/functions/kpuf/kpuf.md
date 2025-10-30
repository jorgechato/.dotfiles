# Kubernetes context and namespace switcher

The motivation for this script is to simplify switching between contexts and namespaces in Kubernetes.

While many tools exist that handle this more elegantly, the ones I tried didn’t behave the way I wanted. For that reason, I opted for a straightforward, vanilla kubectl approach.

This script modifies your kubeconfig file to add a context and namespace for each cluster and namespace you want to switch to. Tools like kubie or kubectx don’t modify your config file but can introduce additional files to your system.

## Requirements

- fzf
- kubectl
- yq
