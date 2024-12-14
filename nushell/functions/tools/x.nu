# Generate a short URL.
#
# Use to generate a short URL, copying it to the clipboard and generate a QR code.
def "x" [
    url: string # URL to shorten.
    --qr # Generate a QR code.
] {
    let platform_url = "https://x.jrg.tools/admin/"
    let token = x jwt

    let alias = http post --content-type application/json --headers [Authorization $"Bearer ($token)"] $platform_url {originUrl:$url} | get Alias

    echo $"($platform_url)($alias)" | pbcopy
    print $"Short URL: (ansi yellow_bold)($platform_url)($alias)(ansi reset)"

    if $qr {
        let file = "/tmp/qr.png"
        qrencode -s 6 -l H -o $file $"($platform_url)($alias)" o+e> /tmp/x.log
        print $"QR code:"
        wezterm imgcat $file e> /tmp/x.log
    }
}

# Search for a short URL.
#
# Use to search for a short URL.
def "x search" [
    query: string # Query to search for.
] {
    let platform_url = "https://x.jrg.tools/admin/"
    let token = x jwt
    http get --headers [Authorization $"Bearer ($token)"] $"($platform_url)search?q=($query)" | update cells -c ["Alias"] {|i| $"($platform_url)($i)" }
}

# List all of the short URLs.
#
# Use to list all of the short URLs.
def "x list" [
    --page (-p): int = 1 # Page number.
    --size (-s): int = 10 # Page size.
] {
    let platform_url = "https://x.jrg.tools/admin/"
    let token = x jwt
    http get --headers [Authorization $"Bearer ($token)"] $"($platform_url)list?page=($page)&size=($size)" | update cells -c ["Alias"] {|i| $"($platform_url)($i)" }
}

# Delete a short URL.
#
# Use to delete a short URL.
def "x delete" [
    alias: string # Alias to delete.
] {
    let platform_url = "https://x.jrg.tools/admin/"
    let token = x jwt
    ^http DELETE -A bearer -a $token $"($platform_url)($alias)" o> /tmp/x.log
}

# Generate JWT tokens.
#
# Use to generate JWT tokens.
def "x jwt" [
    --exp (-e): int = 3600 # Expiration time in seconds.
    --secret (-s): string # Secret to use.
] {
    let sub = "https://x.jrg.tools/"
    let name = hostname
    let token = if $secret != null { $secret } else { op item get bqbczwomg2n5d2hul74wxqagfq --format json | from json | get fields | where id == "credential" | get value | first }

    let now = ^date +%s | into int
    let exp = $now + $exp

    let body = $'{"name":"($name)","exp":"($exp)","sub":"($sub)"}'

    jwt encode --secret $token $body
}
