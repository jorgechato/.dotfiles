{ self, pkgs, ... }: {
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
      # pkgs.rectangle
      pkgs.dbmate
      pkgs.fnm
      pkgs.gh
      pkgs.ripgrep
      pkgs.rustup
      pkgs.nix
      pkgs.turso-cli
      pkgs.yabai
      pkgs.skhd
      pkgs.grc
      pkgs.kubectl
      pkgs.nushell
      pkgs.zoxide
      pkgs.carapace
      # GUI
      pkgs.iterm2
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
    ];

  fonts.packages = [
    pkgs.meslo-lgs-nf
  ];
}
