{ self, pkgs, lib, ... }: {
  programs.fish.plugins = [
    { name = "grc"; src = pkgs.fishPlugins.grc.src; }
    {
      name = "z";
      src = pkgs.fetchFromGitHub {
        owner = "jethrokuan";
        repo = "z";
      };
    }
    {
      name = "fzf";
      src = pkgs.fetchFromGitHub {
        owner = "patrickf1";
        repo = "fzf.fish";
      };
    }
    {
      name = "kubectl";
      src = pkgs.fetchFromGitHub {
        owner = "blackjid";
        repo = "plugin-kubectl";
      };
    }
  ];
}
