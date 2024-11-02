{ self, ... }:
let
  home = "/Users/jorge";
in
{
  home = {
    username = "jorge";
    homeDirectory = home;
    stateVersion = "24.11"; # https://github.com/nix-community/home-manager/blob/master/modules/misc/version.nix#L10
  };

  targets.darwin = {
    currentHostDefaults."com.apple.controlcenter".BatteryShowPercentage = true;
    defaults = {
      "com.apple.finder".FXRemoveOldTrashItems = true;

      "com.googlecode.iterm2".CopySelection = true;

      "com.apple.desktopservices".DSDontWriteNetworkStores = true;
      "com.apple.desktopservices".DSDontWriteUSBStores = true;

      NSGlobalDomain = {
        AppleMeasurementUnits = "Centimeters";
        AppleMetricUnits = true;
        AppleTemperatureUnit = "Celsius";
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticInlinePredictionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
      };
    };
  };

  programs.home-manager.enable = true;

  imports = [
    ./pkgs.nix
    ./file.nix
    ./programs.nix
    ./fish.nix
    ./1password.nix
  ];
}
