$env.EDITOR = "nvim"
$env.VISUAL = "nvim"
$env.PAGER = "bat"

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
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

# Directories to search for scripts when calling source or use
# The default for this is $nu.default-config-dir/scripts
$env.NU_LIB_DIRS = [
    ($nu.default-config-dir | path join 'scripts') # add <nushell-config-dir>/scripts
    ($nu.data-dir | path join 'completions') # default home for nushell completions
]

# Directories to search for plugin binaries when calling register
# The default for this is $nu.default-config-dir/plugins
$env.NU_PLUGIN_DIRS = [
    ($nu.default-config-dir | path join 'plugins') # add <nushell-config-dir>/plugins
]

$env.DOTHOME = "$HOME/.dotfiles"
$env.PATH = ($env.PATH | split row (char esep) | prepend '/opt/homebrew/bin')

$env.STARSHIP_SHELL = "nu"

# PROMPT INDICATORS
$env.PROMPT_INDICATOR = ""
#$env.PROMPT_INDICATOR_VI_INSERT = $"(ansi w) (ansi reset)"
#$env.PROMPT_INDICATOR_VI_NORMAL = $"(ansi w) (ansi reset)"
#$env.PROMPT_MULTILINE_INDICATOR = $"(ansi w)󰸶 (ansi reset)"
$env.PROMPT_INDICATOR_VI_INSERT = ""
$env.PROMPT_INDICATOR_VI_NORMAL = ""
$env.PROMPT_MULTILINE_INDICATOR = ""

# STARSHIP
mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu
