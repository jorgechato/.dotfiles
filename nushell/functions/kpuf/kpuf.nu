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

    gke_gcloud_login $cluster

    # Set kubectl context and namespace
    do --ignore-errors {
        kubectl config use-context $cluster | ignore
    }; echo $"ERROR: You don't have ($cluster) in your ~/.kube/config file."

    do --ignore-errors {
        kubectl config set-context --current --namespace $namespace | ignore
    }
}

def eval_esc [args] {
    if $args == "" {
        exit 1
    }
}

def gke_gcloud_login [context] {
    if ($context | str contains "gke") {
        gcloud auth login --no-launch-browser --update-adc
        do --ignore-errors {
            gcloud container clusters get-credentials ($context | split row "_" | get 4) --region ($context | split row "_" | get 3) --project ($context | split row "_" | get 2) | ignore
        }; echo $"ERROR: You don't have ($context) in your ~/.kube/config file."
    }
}

