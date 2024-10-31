{ self, pkgs, lib, config, ... }:
let
  casks = import ./deps/casks.nix;
  casksWork = import ./deps/casks-work.nix;
  casksHome = import ./deps/casks-home.nix;

  brews = import ./deps/brews.nix;
  brewsWork = import ./deps/brews-work.nix;
  brewsHome = import ./deps/brews-home.nix;

  appstoreHome = import ./deps/appstore-home.nix;
in
{
  config = {
    homebrew = {
      enable = true;
      masApps = lib.mkIf (!config.isWork) appstoreHome;
      onActivation.cleanup = "zap";
      onActivation.autoUpdate = true;
      onActivation.upgrade = true;
      brews = lib.mkMerge [
        brews
        (lib.mkIf config.isWork brewsWork)
        (lib.mkIf (!config.isWork) brewsHome)
      ];
      casks = lib.mkMerge [
        casks
        (lib.mkIf config.isWork casksWork)
        (lib.mkIf (!config.isWork) casksHome)
      ];
    };
  };

}

