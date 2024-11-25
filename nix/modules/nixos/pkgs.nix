{ self, pkgs, lib, config, ... }: {
  config = {
    environment.systemPackages = lib.mkMerge [
      [
        # CODE
        pkgs.go
        pkgs.zig
        pkgs.lua
        pkgs.protobuf
        pkgs.cue
        pkgs.rustup
        pkgs.fnm
        pkgs.nix
        pkgs.pyenv
        pkgs.pnpm
        pkgs.pre-commit
        # LSP
        pkgs.lua-language-server
        pkgs.cuelsp
        pkgs.htmx-lsp
        # TERMINAL
        pkgs.tmux
        pkgs.curl
        pkgs.neovim
        pkgs.mkalias
        pkgs.nmap
        pkgs.tree
        pkgs.git
        pkgs.fortune
        pkgs.platinum-searcher
        pkgs.silver-searcher
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
        pkgs.grc
        pkgs.nushell
        pkgs.zoxide
        pkgs.carapace
        # pkgs.doctl
        pkgs.atlas
        pkgs.awscli2
        # GUI
        pkgs.kitty
        # pkgs.wezterm
        pkgs.iina
        pkgs.transmission_3
        pkgs.vscode
        pkgs.maltego
        pkgs.sqlitebrowser
        pkgs.raycast
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
      ]

      # Home
      (lib.mkIf (!config.dep.isWork) [
        pkgs.kubectl
      ])

      # Work
      (lib.mkIf config.dep.isWork [
        pkgs.grpcurl
        pkgs.gosec
      ])
    ];

    fonts.packages = [
      pkgs.meslo-lgs-nf
    ];
  };
}
