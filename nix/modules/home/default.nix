{ self, lib, ... }: {
  options = {
    isWork = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Is this a work machine?";
    };
  };

  config = {
    home = {
      stateVersion = "25.05"; # https://github.com/nix-community/home-manager/blob/master/modules/misc/version.nix#L10
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
    ./1password.nix
    ./raycast.nix
  ];
}
