{ pkgs, ... }: {
  programs.fish.plugins = [
    {
      name = "last-working-dir";
      src = pkgs.fetchFromGitHub {
        owner = "kfkonrad";
        repo = "last-working-dir-fish-pkg";
      };
    }
    {
      name = "direnv";
      src = pkgs.fetchFromGitHub {
        owner = "oh-my-fish";
        repo = "plugin-direnv";
      };
    }
    {
      name = "plugin-kubectl";
      src = pkgs.fetchFromGitHub {
        owner = "blackjid";
        repo = "plugin-kubectl";
      };
    }
  ];
}
