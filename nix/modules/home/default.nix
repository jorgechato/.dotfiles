{ self, ... }:
let
  home = "/Users/jorge";
in
{
  home.username = "jorge";
  home.homeDirectory = home;
  home.stateVersion = "24.11"; # https://github.com/nix-community/home-manager/blob/master/modules/misc/version.nix#L10

  # home.sessionVariables = { };
  # home.sessionPath = [ ];

  programs.home-manager.enable = true;

  imports = [
    ./pkgs.nix
    ./file.nix
    ./programs.nix
    ./1password.nix
    ./fish.nix
  ];
}
