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

    quotas compare $id --file $file
}

# Pacman plan.
#
# Use to plan pacman from 1password, a given list of users and it's partner id.
def "pacman plan" [
    ...users: list # List of users.
    --partner: string # Partner ID.
    --id: string # 1Password Item ID (defaults: https://t.ly/JLokY).
    --production (-p) # Get production quota. if id is provided, this will be ignored (defaults: false).
    --new (-n) # Create a new partner with it's users.
] {
    if $partner == null {
        print "Partner ID is required"
        return
    }
    if $users == null {
        print "At least one user is required"
        return
    }
    let id = if $id == null { if $production { "5dtibmulo4li2tfeogpt6hnqiq" } else { "rgzusoecr4ykmycvxqw4i2cdyi" } } else { $id }
    let file = if $production { $"/tmp/xb-($partner)-prod.json" } else $"/tmp/xb-($partner)-sandbox.json"
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
