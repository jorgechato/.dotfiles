# Select a cluster
#
# Use to select a cluster, it uses a config file to get the clusters.
# The config file path must be stored in $env.KPUF_CONFIG_FILE.
# The config file is a yaml file with the following structure:
# - cluster: ctx-name1
#   alias: my-alias1
#   namespaces:
#     - np-name1
#     - np-name2
# - cluster: ctx-name2
#   alias: my-alias2
#   namespaces:
#     - np-name1
#     - np-name2
#
# This will also set the kubectl context.
def kpuf [] {
    let config_file = $env.KPUF_CONFIG_FILE

    # Select cluster
    let cluster_alias = (open $config_file | get alias | sort -r | to text  | fzf)
    if $cluster_alias == "" {
        return
    }
    let cluster = (open $config_file | where alias == $cluster_alias | get cluster | first | to text)

    # Select namespace
    let namespace = (open $config_file | where alias == $cluster_alias | get namespaces | first | to text | fzf)
    if $namespace == "" {
        return
    }

    # Set kubectl context
    try {
        kubectl config use-context $cluster o+e> /tmp/kpuf.log
    } catch {
        print $"ERROR: You don't have ($cluster) in your ~/.kube/config file."
    }

    # Check if cluster is logged in, if not, login.
    try {
        kubectl --namespace $namespace get pods o+e> /tmp/kpuf.log
    } catch {
        kpuf login $cluster
    }

    # Set kubectl namespace
    kubectl config set-context --current --namespace $namespace o+e> /tmp/kpuf.log
}

# Login to a cluster
#
# Use to login to a cluster, this will also set the kubectl context.
# Only GCP clusters are supported as of now.
def "kpuf login" [
    context: string # Context to login to.
] {
    if ($context | str contains "gke") {
        do -p { gcloud auth login --update-adc o+e> /tmp/kpuf.log}
        try {
            gcloud container clusters get-credentials ($context | split row "_" | last ) --region ($context | split row "_" | get 2) --project ($context | split row "_" | get 1) o+e> /tmp/kpuf.log
        } catch {
            print $"ERROR: There was an error logging into ($context)"
        }
    } else {
        print $"ERROR: Only GCP contexts are supported."
    }
}

# Restart a deployment
#
# Use to restart a deployment
def "kpuf restart" [
    deployment?: string = "mercari-pacman-jp" # Deployment to restart, (defaults: mercari-pacman-jp).
] {
    kubectl rollout restart deployment $deployment
}
