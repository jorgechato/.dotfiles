# Generate a short URL.
#
# Use to generate a short URL, copying it to the clipboard and generate a QR code.
def "x" [
    url: string # URL to shorten.
    --qr # Generate a QR code.
] {
    let platform_url = "https://x.jrg.tools/"

    let alias = http post --content-type application/json $platform_url {originUrl:$url} | get Alias

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
    let platform_url = "https://x.jrg.tools/"
    http get $"($platform_url)search?q=($query)" | update cells -c ["Alias"] {|i| $"($platform_url)($i)" }
}

# List all of the short URLs.
#
# Use to list all of the short URLs.
def "x list" [
    --page (-p): int = 1 # Page number.
    --size (-s): int = 10 # Page size.
] {
    let platform_url = "https://x.jrg.tools/"
    http get $"($platform_url)list?page=($page)&size=($size)" | update cells -c ["Alias"] {|i| $"($platform_url)($i)" }
}

# Delete a short URL.
#
# Use to delete a short URL.
def "x delete" [
    alias: string # Alias to delete.
] {
    let platform_url = "https://x.jrg.tools/"
    ^http DELETE $"($platform_url)($alias)" o> /tmp/x.log
}
