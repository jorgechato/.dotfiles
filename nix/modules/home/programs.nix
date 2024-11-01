{ self, pkgs, ... }: {
  programs = {
    direnv = {
      enable = true;
      # enableFishIntegration = true;
      nix-direnv.enable = true;
    };

    fish.enable = true;

    git.enable = true;
  };
}
