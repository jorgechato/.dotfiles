{ pkgs, ... }: {
  programs.fish.enable = true;
  # pkgs.fishPlugins.z
  # pkgs.fishPlugins.fzf
  # pkgs.fishPlugins.direnv
  # pkgs.fishPlugins.spark
  # pkgs.fishPlugins.last-working-dir
  # pkgs.fishPlugins.rustup
  programs.fish.plugins = [
    "z"
    "fzf"
    # "direnv"
    {
      name = "plugin-kubectl";
      src = pkgs.fetchFromGitHub {
        owner = "blackjid";
        repo = "plugin-kubectl";
      };
    }
  ];
}
