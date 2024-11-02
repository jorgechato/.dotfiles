{ self, pkgs, lib, ... }: {
  programs.fish.plugins = [
    { name = "grc"; src = pkgs.fishPlugins.grc.src; }
    { name = "z"; src = pkgs.fishPlugins.z.src; }
    { name = "sponge"; src = pkgs.fishPlugins.sponge.src; }
    { name = "plugin-git"; src = pkgs.fishPlugins.plugin-git.src; }
    { name = "fzf"; src = pkgs.fishPlugins.fzf.src; }
    # { name = "direnv"; src = pkgs.fishPlugins.direnv.src; }
    {
      name = "lwd";
      src = pkgs.fetchFromGitHub {
        owner = "kfkonrad";
        repo = "last-working-dir-fish-pkg";
        rev = "c7acb4b7dc965ad5b56c791eed1b4ebdee773a13";
        sha256 = "sha256-GWTMrQ8xFjgKCnAWIdw/iZ1rYQBvgf2HjKdCv5G4Mfc=";
      };
    }
  ];
}
