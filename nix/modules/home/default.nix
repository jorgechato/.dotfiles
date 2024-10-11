{ ... }: {
  home.username = "jorge";
  home.homeDirectory = "/Users/jorge";
  home.stateVersion = "24.11"; # https://github.com/nix-community/home-manager/blob/master/modules/misc/version.nix#L10

  # home.sessionVariables = { };
  # home.sessionPath = [ ];

  programs.home-manager.enable = true;

  home.file.".ssh/allowed_signers".text = "* ${builtins.readFile /Users/jorge/.ssh/id_github_signinkey.pub}";

  imports = [
    ./pkgs.nix
    ./file.nix
    ./fish.nix
    ./git.nix
  ];
}
