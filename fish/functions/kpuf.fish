function kpuf
    set -l selected_cluster (yq eval '.[] | (.alias // .cluster)' "$KPUF_CONFIG_FILE" | sort -n | fzf)
    eval_esc "$selected_cluster"
    set -l selected_namespace (yq eval '.[] | select(.alias == "'$selected_cluster'" or .cluster == "'$selected_cluster'").namespaces[]' "$KPUF_CONFIG_FILE" | fzf)
    eval_esc "$selected_namespace"
    set -l selected_ctx (yq eval '.[] | select(.alias == "'$selected_cluster'" or .cluster == "'$selected_cluster'").cluster' "$KPUF_CONFIG_FILE")

    gke_gcloud_login $selected_ctx

    command kubectl config use-context $selected_ctx >/dev/null 2>/dev/null || echo "ERROR: You don't have $selected_ctx in your ~/.kube/config file."
    command kubectl config set-context --current --namespace=$selected_namespace >/dev/null 2>/dev/null
end


function eval_esc
    if test -z "$argv"
        kill -INT $fish_pid
    end
end


function gke_gcloud_login
    set -l selected_metadata (string split _ $argv[1])
    if contains "gke" $selected_metadata
        gcloud auth login --no-launch-browser --update-adc
        gcloud container clusters get-credentials $selected_metadata[4] --region $selected_metadata[3] --project $selected_metadata[2] >/dev/null 2>/dev/null || echo "ERROR: You don't have $selected_ctx in your ~/.kube/config file."
    end
end
