# Get the pacman quotas from 1password.
#
# Use to get the full pacman quotas for a specific environment from 1password.
def "pacman" [
    id?: string # 1Password Item ID (defaults: https://t.ly/JLokY).
    --production (-p) # Get production pacman quota. if id is provided, this will be ignored (defaults: false).
    --json (-j) # Output as JSON.
] {
    let id = if $id == null { if $production { "3h3bgoachgz73jak2zaztir7se" } else { "3fe2pshzfloonbmy3tsluj6lga" } } else { $id }

    if $json {
        quotas $id --json
    } else {
        quotas $id
    }
}

# Compare the pacman quotas from 1password.
#
# Use to compare the pacman quotas from 1password and a given local file.
def "pacman compare" [
    id?: string # 1Password Item ID (defaults: https://t.ly/JLokY).
    --production (-p) # Get production pacman quota. if id is provided, this will be ignored (defaults: false).
    --file (-f): string # Local file to compare to.
] {
    if $file == null {
        print "--file (-f) is required"
        return
    }
    let id = if $id == null { if $production { "3h3bgoachgz73jak2zaztir7se" } else { "3fe2pshzfloonbmy3tsluj6lga" } } else { $id }

    quotas compare $id -f $file
}

# Pacman plan.
#
# Use to plan pacman from 1password, a given list of users and it's partner id.
def "pacman plan" [
    partner: string # Partner ID.
    --users (-u): list = [] # List of users.
    --id: string # 1Password Item ID (defaults: https://t.ly/JLokY).
    --production (-p) # Get production quota. if id is provided, this will be ignored.
    --onboarding (-o) # Whether the partner is onboarding and does not have a pacman yet.
    --type (-t): int = 1 # Partner type.
    --name (-n): string = "" # Partner name.
    --project (-x): string = "" # Partner project name.
    --ff: list = [] # Feature flags.
] {
    if $partner == null {
        print "Partner ID is required"
        return
    }
    let id = if $id == null { if $production { "3h3bgoachgz73jak2zaztir7se" } else { "3fe2pshzfloonbmy3tsluj6lga" } } else { $id }
    let file = if $production { $"/tmp/xb-pacman-($partner)-prod.json" } else $"/tmp/xb-pacman-($partner)-sandbox.json"
    let data = pacman -j

    if $onboarding {
        let onboarding_data = {
            "id": $partner,
            "name": $name,
            "project": $project,
            "users": $users,
            "type": $type,
            "feature_flags": $ff
        }
        $data | append $onboarding_data | to json | save -f $file
    } else {
        let new_users = $data | where id == $partner | get users | first | append $users
        $data | each {|it|if $it.id == $partner { $it | update users $new_users} else { $it } } | to json | save -f $file
    }

    print $"Full file saved to: ($file)"
    print "---"
    print "1) Send a message to #xb-team-engineering for approval:"
    print ""
    print $"(ansi white)@xb-demand-growth-be-eng please review. This is (if $production { "production" } else { "sandbox" }):"
    print $"(if $onboarding { ":plus:" } else { ":equal:" }) ($partner)"
    $users | each {|it|print $"    :plus: ($it)"}
    print $"(ansi reset)"
    print $"2) Clutch request: https://clutch.(if $production { "prod" } else { "dev" }).citadelapps.com/carrier/request/service/create"
    print ""
    print $"(ansi yellow)ServiceID: (ansi yellow_bold)mercari-pacman-jp(ansi reset)"
    print $"(ansi yellow)Role: (ansi yellow_bold)roles/secretmanager.admin(ansi reset)"
    print $"(ansi yellow)Kubernetes roles: (ansi yellow_bold)edit(ansi reset)"
    print ""
    print $"3) Make sure you are in the right cluster with (ansi blue_bold)kpuf(ansi reset), only then, update pacman in 1password and gcloud: (ansi blue_bold)pacman apply (if $production { "-p" }) -f ($file)(ansi reset)"
    print ""
    print $"4) Restart the deployment: (ansi blue_bold)kpuf restart (if $production { "mercari-pacman-jp" } else { "mercari-pacman-jp-sandbox" })(ansi reset)"
    print "---"
    pacman compare $id -f $file
}

# Update the pacman quotas from 1password.
#
# Use to update the pacman quotas from 1password and gcloud secrets.
#
# A deployment restart is required after applying the new pacnam quotas.
# If you have kpuf installed, you can use it to restart the deployment (kpuf restart).
def "pacman apply" [
    id?: string # 1Password Item ID (defaults: https://t.ly/JLokY).
    --production (-p) # Get production pacman quota. if id is provided, this will be ignored (defaults: false).
    --file (-f): string # Local file to compare to.
] {
    if $file == null {
        print "--file (-f) is required"
        return
    }

    let id = if $id == null { if $production { "3h3bgoachgz73jak2zaztir7se" } else { "3fe2pshzfloonbmy3tsluj6lga" } } else { $id }

    if $production {
        quotas apply $id -f $file --production --project mercari-pacman-jp
    } else {
        quotas apply $id -f $file --project mercari-pacman-jp
    }
}
