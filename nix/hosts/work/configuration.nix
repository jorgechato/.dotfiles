{ self, pkgs, lib, config, nixpkgs, nix-homebrew, home-manager, ... }:
let
  user = "mbp287";
in
{
  ui.isWork = true;
  dep.isWork = true;

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
    isWork = true;
    home.homeDirectory = lib.mkForce "/Users/${user}";
    home.username = user;
  };

  home-manager.extraSpecialArgs = { inherit self; };
}
