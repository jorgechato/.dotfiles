{ pkgs, lib, config, nixpkgs, nix-homebrew, home-manager, ... }: {
  nixpkgs.hostPlatform = "x86_64-darwin";

  nix-homebrew = {
    enable = true;
    user = "jorge";
    autoMigrate = true; # Automatically migrate existing Homebrew installations
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.jorge = import ../../modules/home;
}
