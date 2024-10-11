{ pkgs, lib, config, ... }:
let
  casks = import ./deps/casks.nix;
  brews = import ./deps/brews.nix;
in
{
  options = {
    defaults.isWork = lib.mkEnableOption "Is this a work machine?";
  };

  homebrew = {
    enable = true;
    # masApps = [];
    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
  };

  hombrew = lib.mkIf config.defaults.isWork {
    brews = brews;
    casks = casks;
  };
}

