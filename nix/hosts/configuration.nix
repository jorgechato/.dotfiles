{ pkgs, config, ... }:
let
  casks = import ../modules/nixos/deps/casks.nix;
  brews = import ../modules/nixos/deps/brews.nix;
in
{
  imports = [
    ../modules/nixos/settings.nix
    ../modules/nixos/pkgs.nix
    ../modules/nixos/system.nix
    ../modules/nixos/defaults.nix
  ];

  homebrew = {
    enable = true;
    brews = brews;
    casks = casks ++ [
      "discord"
      "dropbox"
      "telegram"
      "ente"
      "ledger-live"
    ];
    # masApps = [];
    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
  };
}
