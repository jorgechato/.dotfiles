{ self, pkgs, lib, config, nixpkgs, nix-homebrew, home-manager, ... }: {
  nixpkgs.hostPlatform = "aarch64-darwin";

  nix-homebrew = {
    enable = true;
    user = "jorge";
    enableRosetta = true;
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.jorge = import ../../modules/home;
  home-manager.extraSpecialArgs = { inherit self; };
}
