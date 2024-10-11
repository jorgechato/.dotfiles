{ pkgs, lib, config, nixpkgs, nix-homebrew, home-manager, ... }: {
  nixpkgs.hostPlatform = "aarch64-darwin";

  nix-homebrew = {
    enable = true;
    user = "jorge";
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.jorge = import ../../modules/home;
}
