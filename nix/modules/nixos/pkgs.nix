{ self, pkgs, ... }: {
  environment.systemPackages =
    [
      # CODE
      pkgs.go
      pkgs.zig
      pkgs.lua
      pkgs.protobuf
      pkgs.cue
      pkgs.cuelsp
      pkgs.rustup
      pkgs.fnm
      pkgs.nix
      pkgs.pyenv
      # LSP
      pkgs.lua-language-server
      # TERMINAL
      pkgs.curl
      pkgs.neovim
      pkgs.mkalias
      pkgs.nmap
      pkgs.tree
      pkgs.git
      pkgs.fortune
      pkgs.platinum-searcher
      pkgs.fzf
      pkgs.bat
      pkgs.httpie
      pkgs.grex
      pkgs.direnv
      pkgs.jq
      pkgs.yq
      pkgs.starship
      pkgs.jwt-cli
      pkgs.gnused
      pkgs.dbmate
      pkgs.gh
      pkgs.ripgrep
      pkgs.turso-cli
      pkgs.yabai
      pkgs.skhd
      pkgs.grc
      pkgs.kubectl
      pkgs.nushell
      pkgs.zoxide
      pkgs.carapace
      # GUI
      pkgs.sketchybar
      pkgs.kitty
      # pkgs.wezterm
      pkgs.iina
      pkgs.transmission_3
      pkgs.vscode
      pkgs.maltego
      pkgs.sqlitebrowser
      # Fish plugins
      pkgs.fishPlugins.z
      pkgs.fishPlugins.fzf
      pkgs.fishPlugins.grc
      pkgs.fishPlugins.sponge
      pkgs.fishPlugins.plugin-git
      # Nvim
      pkgs.tree-sitter
      # Lua (for nvim)
      pkgs.luajitPackages.luarocks
      # Go (for nvim)
      pkgs.gomodifytags
      pkgs.impl
      pkgs.iferr
      pkgs.gotests
    ];

  fonts.packages = [
    pkgs.meslo-lgs-nf
  ];
}
