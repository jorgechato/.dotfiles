{ self, config, lib, ... }:
let
  content = "NixOs hack to create folders ;)";
  onePasswordHome = ''
    [[ssh-keys]]
    vault = "Private"
  '';
  onePasswordWork = ''
    [[ssh-keys]]
    vault = "Private"
  '';

  safePath = path: builtins.path {
    name = "safe-${lib.strings.sanitizeDerivationName path}";
    path = self + "/../${path}";
  };
in
{
  home.file = {
    ".config/1Password" = {
      target = ".config/1Password/ssh/agent.toml";
      text = if config.isWork then onePasswordWork else onePasswordHome;
    };
    ".config/nvim" = {
      source = safePath "nvim";
      recursive = true;
    };
    ".config/aerospace" = {
      source = safePath "aerospace";
      recursive = true;
    };
    ".config/ghostty" = {
      source = safePath "ghostty";
      recursive = true;
    };
    ".config/nushell" = {
      source = safePath "nushell";
      recursive = true;
    };
    ".config/nushell/functions" = {
      source = safePath "nushell/functions";
      recursive = true;
    };
    ".config/wezterm" = {
      source = safePath "wezterm";
      recursive = true;
    };
    ".config/presenterm" = {
      text = ''
        defaults:
          theme: terminal-dark
          terminal_font_size: 20
          image_protocol: kitty-local
      '';
      target = ".config/presenterm/config.yaml";
    };
    ".config/starship.toml".source = safePath "starship.toml";
    ".gitconfig".source = safePath ".gitconfig";
    ".editorconfig".source = safePath ".editorconfig";
    ".npmrc".source = safePath ".npmrc";

    ".hushlogin" = {
      text = content;
      target = ".hushlogin";
    };
    "screenshots" = {
      text = content;
      target = "Pictures/screenshots/.keep";
    };
    "go" = {
      text = content;
      target = ".go/.keep";
    };
    "github" = {
      text = content;
      target = "Projects/github/.keep";
    };
    "fnm" = {
      text = content;
      target = ".fnm/.keep";
    };
  };
}
