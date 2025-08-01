{ self, pkgs, lib, config, nixpkgs, nix-homebrew, home-manager, ... }:
let
  user = "jorge";
in
{
  nixpkgs.hostPlatform = "aarch64-darwin";

  nix-homebrew = {
    enable = true;
    user = user;
    enableRosetta = true;
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.${user} = {
    imports = [ ../../modules/home ];
    home.homeDirectory = "/Users/${user}";
    home.username = user;
  };
  home-manager.extraSpecialArgs = {
    inherit self;
  };
}
