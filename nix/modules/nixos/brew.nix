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
      global.brewfile = true;
      masApps = lib.mkIf (!config.dep.isWork) appstoreHome;
      onActivation.cleanup = "zap";
      onActivation.autoUpdate = true;
      onActivation.upgrade = true;
      brews = lib.mkMerge [
        brews
        (lib.mkIf config.dep.isWork brewsWork)
        (lib.mkIf (!config.dep.isWork) brewsHome)
      ];
      casks = lib.mkMerge [
        casks
        (lib.mkIf config.dep.isWork casksWork)
        (lib.mkIf (!config.dep.isWork) casksHome)
      ];

      taps = [
        # custom
        "nikitabobko/tap" # aerospace
        "libsql/sqld" # Turso dependency to run locally
      ];
    };
  };

}

