{ self, pkgs, lib, config, nixpkgs, nix-homebrew, home-manager, ... }: {
  ui.isWork = true;
  dep.isWork = true;

  nixpkgs.hostPlatform = "aarch64-darwin";

  nix-homebrew = {
    enable = true;
    user = "mbp287";
    enableRosetta = true;
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.mbp287 = {
    imports = [ ../../modules/home ];
    isWork = true;
    home.homeDirectory = builtins.getEnv "HOME";
    home.username = "mbp287";
  };

  home-manager.extraSpecialArgs = { inherit self; };
}
