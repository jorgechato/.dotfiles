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
      # GUI
      pkgs.iterm2
      pkgs.iina
      pkgs.transmission
    ];

  fonts.packages = [
    pkgs.meslo-lgs-nf
  ];
}
