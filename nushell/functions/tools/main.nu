# Tunel a local port to WAN.
#
# Use to expose a local service to the internet via Cloudflare.
def "lt" [
    port: int, # The local port to tunnel
    hostname: string = "lt.jrg.tools", # The domain to use for the tunnel
    tunnel_name: string = "local" # The name of the tunnel
] {
    let id = cloudflared tunnel list --name local | lines | last | split row ' ' | first
    let credentials_file = $"($nu.home-path)/.cloudflared/($id).json"
    let config_file = (mktemp --tmpdir-path /tmp tmpconfig.XXXXXX.yml)

    let config_content = $"
tunnel: ($tunnel_name)
credentials-file: ($credentials_file)

ingress:
  - hostname: ($hostname)
    service: http://localhost:($port)
  - service: http_status:404
"

    $config_content | save --force $config_file

    print $"🚀 Running tunnel: ($tunnel_name)"
    print $"🌐 Domain: https://($hostname)"
    print $"🔁 Local:  http://localhost:($port)"
    print ""

    ^cloudflared tunnel --config $config_file run $tunnel_name
}

# NTFY shortcut with auth by default
def n [
    --topic (-t): string = "procesos", # The topic to publish to
    --priority (-p): int = 3, # The priority of the message (1-5)
    message: string, # The message to send
    ...args # Captures the remaining input as a list
] {
    let url = $"ntfy.jrg.tools/($topic)"
    let token = (op read "op://JRG/Ntfy Procesos/password")

    ntfy publish --token $token --priority $priority --tag "computer" --title "Nushell Notification" ...$args $url $message
}
