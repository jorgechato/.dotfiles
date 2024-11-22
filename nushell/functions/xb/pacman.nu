def "get pacman" [
    name?: string
    --production (-p)
    --json (-j)
] {
    let name = if $name == null { if $production { "3h3bgoachgz73jak2zaztir7se" } else { "3fe2pshzfloonbmy3tsluj6lga" } } else { $name }

    if $json {
        get quota $name --json
    } else {
        get quota $name
    }
}

def "compare pacman" [
    name?: string
    --production (-p)
    --file (-f): string
] {
    if $file == null {
        print "--file (-f) is required"
        return
    }
    let name = if $name == null { if $production { "3h3bgoachgz73jak2zaztir7se" } else { "3fe2pshzfloonbmy3tsluj6lga" } } else { $name }

    compare quota $name --file $file
}

def "update pacman" [
    name?: string
    --production (-p)
    --file (-f): string
] {
    if $file == null {
        print "--file (-f) is required"
        return
    }

    let name = if $name == null { if $production { "3h3bgoachgz73jak2zaztir7se" } else { "3fe2pshzfloonbmy3tsluj6lga" } } else { $name }

    if $production {
        update quota $name -f $file --production --project mercari-pacman-jp
    } else {
        update quota $name -f $file --project mercari-pacman-jp
    }
}
