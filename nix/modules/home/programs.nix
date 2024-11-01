{ self, pkgs, lib, ... }: {
  programs = {
    direnv = {
      enable = true;
      # enableFishIntegration = true;
      nix-direnv.enable = true;
    };

    fish.enable = true;

    git.enable = true;

    z-lua.enable = true;
  };
}
