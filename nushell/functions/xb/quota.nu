# Get the quotas from 1password.
#
# Use to get the full quotas for a specific environment from 1password.
def "get quota" [
    id?: string # 1Password Item ID (defaults: https://t.ly/JLokY).
    --production (-p) # Get production quota. if id is provided, this will be ignored (defaults: false).
    --json (-j) # Output as JSON.
] {
    let id = if $id == null { if $production { "5dtibmulo4li2tfeogpt6hnqiq" } else { "rgzusoecr4ykmycvxqw4i2cdyi" } } else { $id }

    let value = op item get $id --format json | from json | get fields.value | first
    if $json {
        $value | from json
    } else {
        $value
    }
}

# Compare the quotas from 1password.
#
# Use to compare the quotas from 1password and a given local file.
def "compare quota" [
    id?: string # 1Password Item ID (defaults: https://t.ly/JLokY).
    --production (-p) # Get production quota. if id is provided, this will be ignored (defaults: false).
    --file (-f): string # Local file to compare to.
] {
    if $file == null {
        print "--file (-f) is required"
        return
    }
    let id = if $id == null { if $production { "5dtibmulo4li2tfeogpt6hnqiq" } else { "rgzusoecr4ykmycvxqw4i2cdyi" } } else { $id }

    get quota $id | save -f /tmp/xb-$id.json
    diff --color /tmp/xb-$id.json $file
    rm /tmp/xb-$id.json
}

# Update the quotas.
#
# Use to update the quotas from 1password and gcloud secrets.
#
# A deployment restart is required after applying the new quotas.
# If you have kpuf installed, you can use it to restart the deployment (kpuf restart).
def "update quota" [
    id?: string # 1Password Item ID (defaults: https://t.ly/JLokY).
    --production (-p) # Get production quota. if id is provided, this will be ignored (defaults: false).
    --file (-f): string # Local file to compare to.
    --project: string = "kouzoh-quota-jp" # Project ID, (defaults: kouzoh-quota-jp).
] {
    if $file == null {
        print "--file (-f) is required"
        return
    }

    let id = if $id == null { if $production { "5dtibmulo4li2tfeogpt6hnqiq" } else { "rgzusoecr4ykmycvxqw4i2cdyi" } } else { $id }
    let suffix = if $production { "prod" } else { "dev" }
    let config = if $production { "prod" } else { "sandox" }

    let project_id = $"($project)-($suffix)"
    let partners_config = $"partners_config_($config)"

    try {
        print $"gcloud secrets versions add ($partners_config) --data-file=($file) --project ($project_id)"
        gcloud secrets versions add $partners_config --data-file=$"($file)" --project $project_id
        print $"Secret updated on ($project)-($suffix)"
    } catch {
        print $"Error updating ($project)-($suffix)"
        return
    }

    try {
        let content = cat $file
        op item edit $id $"notesPlain=($content)"
        print "Secret updated on 1password"
    } catch {
        print $"Error updating 1password"
        return
    }

    mv $file $"($file).done"
}
