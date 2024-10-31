{ pkgs, ... }: {
  environment.systemPackages =
    [
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
      pkgs.go
      pkgs.protobuf
      pkgs.jwt-cli
      pkgs.gnused
      pkgs.cue
      pkgs.cuelsp
      pkgs.rectangle
      pkgs.ollama
      pkgs.dbmate
      pkgs.fnm
      pkgs.gh
      pkgs.ripgrep
      pkgs.rustup
      pkgs.nix
      pkgs.turso-cli
      pkgs.maltego
      pkgs.sqlitebrowser
      # GUI
      pkgs.iterm2
      pkgs.iina
      pkgs.transmission
      pkgs.vscode
      # Fish plugins
      fishPlugins.z
      fishPlugins.fzf
      fishPlugins.grc
      fishPlugins.sponge
      fishPlugins.plugin-git
    ];

  fonts.packages = [
    pkgs.meslo-lgs-nf
  ];
}
