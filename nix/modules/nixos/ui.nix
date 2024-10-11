{ self, pkgs, lib, config, ... }:
let
  persistentApps = [
    "/Applications/Brave Browser.app"
    "${pkgs.iterm2}/Applications/iTerm.app"
  ];

  workPersistentApps = [
    "/Applications/Google Chrome.app"
  ];
in
{
  options = {
    isWork = {
      enable = lib.mkOption {
        default = false;
        type = with lib.types; bool;
        description = "Is this a work machine?";
      };
    };
  };

  config = {
    system.defaults = {
      dock.autohide = true;
      dock.orientation = "right";
      dock.persistent-apps = lib.mkMerge [
        persistentApps
        (lib.mkIf config.isWork workPersistentApps)
      ];

      finder.FXPreferredViewStyle = "Nlsv";
      NSGlobalDomain.AppleICUForce24HourTime = true;
      NSGlobalDomain.AppleInterfaceStyle = "Dark";
      NSGlobalDomain."com.apple.keyboard.fnState" = true;
    };
  };
}
