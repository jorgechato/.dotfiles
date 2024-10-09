{ pkgs, config, ... }:
let
  casks = import ../../modules/nixos/deps/casks.nix;
  brews = import ../../modules/nixos/deps/brews.nix;
in
{
  imports = [
    ../../modules/nixos/settings.nix
    ../../modules/nixos/pkgs.nix
    ../../modules/nixos/system.nix
    ../../modules/nixos/defaults.nix
  ];

  homebrew = {
    enable = true;
    brews = brews;
    casks = casks ++ [
      "google-chrome"
    ];
    # masApps = [];
    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
  };

  system.defaults.dock.persistent-apps = [
    "/Applications/Brave Browser.app"
    "/Applications/Chrome.app"
    "${pkgs.iterm2}/Applications/iTerm.app"
  ];
}
