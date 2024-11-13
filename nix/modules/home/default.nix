{ self, lib, ... }:
let
  home = "/Users/jorge";
in
{
  options = {
    isWork = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Is this a work machine?";
    };
  };

  config = {
    home = {
      username = "jorge";
      homeDirectory = home;
      stateVersion = "24.11"; # https://github.com/nix-community/home-manager/blob/master/modules/misc/version.nix#L10
    };

    targets.darwin = {
      currentHostDefaults."com.apple.controlcenter".BatteryShowPercentage = true;
      defaults = {
        "com.apple.finder".FXRemoveOldTrashItems = true;

        "com.apple.desktopservices" = {
          DSDontWriteNetworkStores = true;
          DSDontWriteUSBStores = true;
        };
      };
    };

    programs.home-manager.enable = true;
  };

  imports = [
    ./pkgs.nix
    ./file.nix
    ./programs.nix
    ./fish.nix
    ./1password.nix
    ./raycast.nix
  ];
}
