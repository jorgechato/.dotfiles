$env.EDITOR = "nvim"
$env.VISUAL = "nvim"
$env.PAGER = "bat"
$env.XDG_CONFIG_HOME = $"($env.HOME)/.config"
$env.SVN_EDITOR = "nvim"
$env.LC_CTYPE = "en_US.UTF-8"
$env.LANG = "en_US.UTF-8"
$env.LANGUAGE = "en_US.UTF-8"
$env.DIRENV_LOG_FORMAT = ""
$env.LC_TERMINAL = "Ghostty"

$env.DOTHOME = $"($env.HOME)/.dotfiles"

$env.ENV_CONVERSIONS = {
    "PATH": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
    "Path": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
}

$env.NU_LIB_DIRS = [
    ($nu.default-config-dir | path join 'scripts') # add <nushell-config-dir>/scripts
    ($nu.data-dir | path join 'completions') # default home for nushell completions
]

$env.NU_PLUGIN_DIRS = [
    ($nu.default-config-dir | path join 'plugins') # add <nushell-config-dir>/plugins
]

# PATH
$env.PATH = ($env.PATH | split row (char esep) | prepend '/usr/local/bin')
$env.PATH = ($env.PATH | split row (char esep) | prepend $"($env.HOME)/bin")
$env.PATH = ($env.PATH | split row (char esep) | prepend '/usr/local/sbin')
$env.PATH = ($env.PATH | split row (char esep) | prepend '/usr/local/opt/libpq/bin')
$env.PATH = ($env.PATH | split row (char esep) | prepend '/opt/homebrew/bin') # Brew
$env.PATH = ($env.PATH | split row (char esep) | prepend $"($env.HOME)/.local/bin") # .local
$env.PATH = ($env.PATH | split row (char esep) | prepend '/run/current-system/sw/bin') # NixOS

# GO
$env.GOPATH = $"($env.HOME)/.go"
$env.GOMODCACHE = $"($env.HOME)/.go/pkg/mod"
$env.PATH = ($env.PATH | split row (char esep) | prepend $"($env.GOPATH)/bin")
$env.GOPRIVATE = "github.com/garajonai/*,github.com/kouzoh/*"
$env.GONOPROXY = "github.com/garajonai/*,github.com/kouzoh/*"
$env.GONOSUMDB = "github.com/garajonai/*,github.com/kouzoh/*"

# PROMPT INDICATORS
$env.PROMPT_INDICATOR = ""
#$env.PROMPT_INDICATOR_VI_INSERT = $"(ansi w) (ansi reset)"
#$env.PROMPT_INDICATOR_VI_NORMAL = $"(ansi w) (ansi reset)"
#$env.PROMPT_MULTILINE_INDICATOR = $"(ansi w)󰸶 (ansi reset)"
$env.PROMPT_INDICATOR_VI_INSERT = ""
$env.PROMPT_INDICATOR_VI_NORMAL = ""
$env.PROMPT_MULTILINE_INDICATOR = ""

# TMUX
if (which tmux | is-not-empty) and ($env.TMUX? | is-empty) {
    let sessions = (try { tmux list-sessions o+e> /tmp/tmux.log } catch { [] })
    if ($sessions | is-empty) {
        tmux new-session -s main
    } else {
        tmux attach-session
    }
}

# Node
let FNM_MULTISHELL_PATH = (fnm env --shell bash | lines | split column '"' | get 1 | get column2)
$env.FNM_MULTISHELL_PATH = $FNM_MULTISHELL_PATH
$env.PATH = ($env.PATH | split row (char esep) | prepend $"($env.HOME)/.fnm")
$env.PATH = ($env.PATH | prepend $"($env.FNM_MULTISHELL_PATH)/bin")

# Rust
$env.PATH = ($env.PATH | prepend $"($env.HOME)/.cargo/bin")

# Nvim mason
$env.PATH = ($env.PATH | prepend $"($env.HOME)/.local/share/nvim/mason/bin")

# Mermaid
$env.PUPPETEER_CACHE_DIR = $"($env.HOME)/.cache/puppeteer"

# Presenterm
$env.XDG_CONFIG_HOME = $"($env.HOME)/.config"

# Work Kubectl
$env.USE_GKE_GCLOUD_AUTH_PLUGIN = true
$env.KPUF_CONFIG_FILE = $"($env.HOME)/.config/kpuf.yaml"

# STARSHIP
$env.STARSHIP_SHELL = "nu"
mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu

# Z
zoxide init nushell | save -f ~/.zoxide.nu

# Autocomplete with Carapace
$env.CARAPACE_BRIDGES = 'zsh,bash,inshellisense' # optional
mkdir ~/.cache/carapace
carapace _carapace nushell | save --force ~/.cache/carapace/init.nu
