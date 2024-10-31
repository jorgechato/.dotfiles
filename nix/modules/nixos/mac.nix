{ self, pkgs, lib, config, ... }:
let
  persistentApps = [
    "/Applications/Brave Browser.app"
    "/Applications/iTerm2.app"
    "/Applications/Scrivener.app"
    "/Applications/DaVinci Resolve.app"
    "/Applications/MacFamilyTree 10.app"
  ];

  workPersistentApps = [
    "/Applications/Google Chrome.app"
  ];
in
{
  config = {
    system.defaults = {
      dock.autohide = true;
      dock.orientation = "right";
      dock.persistent-apps = lib.mkMerge [
        persistentApps
        (lib.mkIf config.isWork workPersistentApps)
      ];

      screencapture.location = "~/Pictures/screenshots";

      finder.FXPreferredViewStyle = "Nlsv";
      finder.AppleShowAllFiles = true;

      NSGlobalDomain.AppleICUForce24HourTime = true;
      NSGlobalDomain.AppleInterfaceStyle = "Dark";
      NSGlobalDomain."com.apple.keyboard.fnState" = true;
    };
  };
}
