{ self, pkgs, lib, ... }: {
  programs.fish.plugins = [
    # { name = "grc"; src = pkgs.fishPlugins.grc.src; }
    { name = "z"; src = pkgs.fishPlugins.z.src; }
    { name = "sponge"; src = pkgs.fishPlugins.sponge.src; }
    { name = "plugin-git"; src = pkgs.fishPlugins.plugin-git.src; }
    { name = "fzf"; src = pkgs.fishPlugins.fzf.src; }
    # { name = "direnv"; src = pkgs.fishPlugins.direnv.src; }
  ];
}
