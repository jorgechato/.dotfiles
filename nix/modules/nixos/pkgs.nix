{ self, pkgs, ghostty, lib, config, ... }: {
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
        pkgs.bun
        pkgs.ansible
        pkgs.cf-terraforming
        pkgs.nixpacks
        # ghostty.packages.${pkgs.system}.default # not working for darwin yet, need to use brew for now
        # LSP
        pkgs.lua-language-server
        pkgs.cuelsp
        pkgs.htmx-lsp
        # TERMINAL
        pkgs.cocoapods # Tauri iOS
        pkgs.libimobiledevice # Tauri iOS
        pkgs.ios-deploy # Tauri iOS
        pkgs.sqlite
        pkgs.qrencode
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
        pkgs.grc
        pkgs.nushell
        pkgs.zoxide
        pkgs.carapace
        pkgs.k9s
        pkgs.presenterm
        pkgs.imagemagick
        pkgs.luajitPackages.magick
        pkgs.sqlc
        pkgs.hunspell # spell check
        # GUI
        pkgs.kitty
        pkgs.iina
        pkgs.vscode
        pkgs.maltego
        pkgs.sqlitebrowser
        pkgs.raycast
        pkgs.gimp
        # Nvim
        pkgs.tree-sitter
        # Lua (for nvim)
        pkgs.luajitPackages.luarocks
        # Go (for nvim)
        pkgs.gomodifytags
        pkgs.impl
        pkgs.iferr
        pkgs.gotests
        # Python
        pkgs.uv
        pkgs.python312
        # pkgs.python312Packages.presenterm-export # for presenterm
      ]

      # Home
      (lib.mkIf (!config.dep.isWork) [
        pkgs.kubectl
        pkgs.turso-cli
        pkgs.atlas # DB migration
        pkgs.goose # DB migration
        pkgs.awscli2
        pkgs.cloudflared
        pkgs.stripe-cli
      ])

      # Work
      (lib.mkIf config.dep.isWork [
        pkgs.grpcurl
        pkgs.gosec
        pkgs.pwgen
        pkgs.php81
        pkgs.telepresence2
      ])
    ];

    fonts.packages = [
      pkgs.meslo-lgs-nf
    ];
  };
}
