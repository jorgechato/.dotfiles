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
      # Auto-update must stay off: Homebrew is pinned by nix-homebrew (see
      # flake.nix brew-src), and running auto-update inside `brew bundle`
      # breaks its mas detection, falsely failing every masApps install.
      onActivation.autoUpdate = false;
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
        { name = "nikitabobko/tap"; trusted = true; } # aerospace
        { name = "libsql/sqld"; trusted = true; } # Turso dependency to run locally
        { name = "osx-cross/avr"; trusted = true; } # keyboard support for my keyboard firmware development
      ];
    };
  };

}

