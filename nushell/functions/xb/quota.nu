# Get the quotas from 1password.
#
# Use to get the full quotas for a specific environment from 1password.
def "quotas" [
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
def "quotas compare" [
    id?: string # 1Password Item ID (defaults: https://t.ly/JLokY).
    --production (-p) # Get production quota. if id is provided, this will be ignored (defaults: false).
    --file (-f): string # Local file to compare to.
] {
    if $file == null {
        print "--file (-f) is required"
        return
    }
    let id = if $id == null { if $production { "5dtibmulo4li2tfeogpt6hnqiq" } else { "rgzusoecr4ykmycvxqw4i2cdyi" } } else { $id }

    quotas $id | save -f $"/tmp/xb-($id).json"
    diff --color -c -C 3 $"/tmp/xb-($id).json" $file
    rm $"/tmp/xb-($id).json"
}

# Plan the quotas.
#
# Use to plan the quotas from 1password and a given partner ID.
def "quotas plan" [
    partner: string # Partner ID.
    --id: string # 1Password Item ID (defaults: https://t.ly/JLokY).
    --values (-v): any = {short_max_count: 2400, long_max_count: 144000, short_width_secs: 60, long_width_secs: 3600}
    --production (-p) # Get production quota. if id is provided, this will be ignored (defaults: false).
] {
    if $partner == null {
        print "Partner ID is required"
        return
    }
    let id = if $id == null { if $production { "5dtibmulo4li2tfeogpt6hnqiq" } else { "rgzusoecr4ykmycvxqw4i2cdyi" } } else { $id }
    let file = if $production { $"/tmp/xb-($partner)-prod.json" } else { $"/tmp/xb-($partner)-sandbox.json" }
    let new_quota = {$partner: $values}

    if $production {
        quotas -j -p $id | update partners { |$it | merge $new_quota } | to json | save -f $file
    } else {
        quotas -j $id | update partners { |$it | merge $new_quota } | to json | save -f $file
    }
    print $"Full file saved to: ($file)"
    print "---"
    print "1) Send a message to #xb-team-engineering for approval:"
    print ""
    print $"(ansi white)@xb-demand-growth-be-eng please review. This is (if $production { "production" } else { "sandbox" }):"
    print $":plus: ($partner)(ansi reset)"
    print ""
    print $"2) Clutch request: https://clutch.(if $production { "prod" } else { "dev" }).citadelapps.com/carrier/request/service/create"
    print ""
    print $"(ansi yellow)ServiceID: (ansi yellow_bold)kouzoh-quota-jp(ansi reset)"
    print $"(ansi yellow)Role: (ansi yellow_bold)roles/secretmanager.admin(ansi reset)"
    print $"(ansi yellow)Kubernetes roles: (ansi yellow_bold)roles/edit(ansi reset)"
    print ""
    print $"3) Make sure you are in the right cluster with (ansi blue_bold)kpuf(ansi reset), only then, update the quotas in 1password and gcloud: (ansi blue_bold)quotas apply (if $production { "-p" }) -f ($file)(ansi reset)"
    print ""
    print $"4) Restart the deployment: (ansi blue_bold)kpuf restart (if $production { "grpc" } else { "grpc-sandbox" })(ansi reset)"
    print "---"
    quotas compare $id -f $file
}

# Update the quotas.
#
# Use to update the quotas from 1password and gcloud secrets.
#
# A deployment restart is required after applying the new quotas.
# If you have kpuf installed, you can use it to restart the deployment (kpuf restart).
def "quotas apply" [
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
    let config = if $production { "prod" } else { "sandbox" }

    let project_id = $"($project)-($suffix)"
    let partners_config = $"partners_config_($config)"

    try {
        print $"gcloud secrets versions add ($partners_config) --data-file=($file) --project ($project_id)"
        let output = gcloud secrets versions add $partners_config --data-file=$"($file)" --project $project_id  o+e> /tmp/xb.log
        print $"Secret updated on ($project)-($suffix)"
    } catch {
        print $"Error updating ($project)-($suffix), for details see /tmp/xb.log"
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
