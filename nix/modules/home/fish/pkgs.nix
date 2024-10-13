{ pkgs, ... }: {
  programs.fish.enable = true;
  programs.fish.plugins = [
    {
      name = "spark";
      src = pkgs.fetchFromGitHub {
        owner = "jorgebucaran";
        repo = "spark.fish";
      };
    }
    {
      name = "fzf";
      src = pkgs.fetchFromGitHub {
        owner = "PatrickF1";
        repo = "fzf.fish";
      };
    }
    {
      name = "z";
      src = pkgs.fetchFromGitHub {
        owner = "jethrokuan";
        repo = "z";
      };
    }
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
      name = "rustup";
      src = pkgs.fetchFromGitHub {
        owner = "oh-my-fish";
        repo = "plugin-rustup";
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
