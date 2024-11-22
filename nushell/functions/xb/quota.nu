def "get quota" [
    name?: string
    --production (-p)
    --json (-j)
] {
    let name = if $name == null { if $production { "5dtibmulo4li2tfeogpt6hnqiq" } else { "rgzusoecr4ykmycvxqw4i2cdyi" } } else { $name }

    let value = op item get $name --format json | from json | get fields.value | first
    if $json {
        $value | from json
    } else {
        $value
    }
}

def "compare quota" [
    name?: string
    --production (-p)
    --file (-f): string
] {
    if $file == null {
        print "--file (-f) is required"
        return
    }
    let name = if $name == null { if $production { "5dtibmulo4li2tfeogpt6hnqiq" } else { "rgzusoecr4ykmycvxqw4i2cdyi" } } else { $name }

    get quota $name | save -f /tmp/xb-$name.json
    diff --color /tmp/xb-$name.json $file
    rm /tmp/xb-$name.json
}

def "update quota" [
    name?: string
    --production (-p)
    --file (-f): string
    --project: string = "kouzoh-quota-jp"
] {
    if $file == null {
        print "--file (-f) is required"
        return
    }

    let name = if $name == null { if $production { "5dtibmulo4li2tfeogpt6hnqiq" } else { "rgzusoecr4ykmycvxqw4i2cdyi" } } else { $name }
    let suffix = if $production { "prod" } else { "dev" }
    let config = if $production { "prod" } else { "sandox" }

    let project_name = $"($project)-($suffix)"
    let partners_config = $"partners_config_($config)"

    try {
        print $"gcloud secrets versions add ($partners_config) --data-file=($file) --project ($project_name)"
        gcloud secrets versions add $partners_config --data-file=$"($file)" --project $project_name
        print $"Secret updated on ($project)-($suffix)"
    } catch {
        print $"Error updating ($project)-($suffix)"
        return
    }

    try {
        let content = cat $file
        op item edit $name $"notesPlain=($content)"
        print "Secret updated on 1password"
    } catch {
        print $"Error updating 1password"
        return
    }

    mv $file $"($file).done"
}
