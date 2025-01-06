{ config, pkgs, lib, ... }:
let
  raycastSettings = {
    "global" = {
      "theme" = "auto";
      "soundEffects" = false;
      "showGettingStarted" = false;
      "analyticsEnabled" = false;
      "darkThemeAppearance" = "dark";
      "lightThemeAppearance" = "light";
    };
    "quicklinks" = {
      "openInBrowser" = true;
    };
    "extensions" = {
      "enabledStores" = [
        "Raycast Store"
      ];
    };
    "search" = {
      "defaultActionOnEnter" = "show-details";
      "enableRecentSearches" = true;
    };
  };
in
{
  home.file.".config/raycast/settings.json".text = builtins.toJSON raycastSettings;

  home.file.".config/raycast/config.json".text = builtins.toJSON {
    hotkey = "cmd+space";
    showInMenuBar = false;
    enableAutomaticUpdate = true;
  };
}
