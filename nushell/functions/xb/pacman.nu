# Get the pacman quotas from 1password.
#
# Use to get the full pacman quotas for a specific environment from 1password.
def "get pacman" [
    id?: string # 1Password Item ID (defaults: https://t.ly/JLokY).
    --production (-p) # Get production pacman quota. if id is provided, this will be ignored (defaults: false).
    --json (-j) # Output as JSON.
] {
    let id = if $id == null { if $production { "3h3bgoachgz73jak2zaztir7se" } else { "3fe2pshzfloonbmy3tsluj6lga" } } else { $id }

    if $json {
        get quota $id --json
    } else {
        get quota $id
    }
}

# Compare the pacman quotas from 1password.
#
# Use to compare the pacman quotas from 1password and a given local file.
def "compare pacman" [
    id?: string # 1Password Item ID (defaults: https://t.ly/JLokY).
    --production (-p) # Get production pacman quota. if id is provided, this will be ignored (defaults: false).
    --file (-f): string # Local file to compare to.
] {
    if $file == null {
        print "--file (-f) is required"
        return
    }
    let id = if $id == null { if $production { "3h3bgoachgz73jak2zaztir7se" } else { "3fe2pshzfloonbmy3tsluj6lga" } } else { $id }

    compare quota $id --file $file
}

# Update the pacman quotas from 1password.
#
# Use to update the pacman quotas from 1password and gcloud secrets.
#
# A deployment restart is required after applying the new pacnam quotas.
# If you have kpuf installed, you can use it to restart the deployment (kpuf restart).
def "update pacman" [
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
        update quota $id -f $file --production --project mercari-pacman-jp
    } else {
        update quota $id -f $file --project mercari-pacman-jp
    }
}
