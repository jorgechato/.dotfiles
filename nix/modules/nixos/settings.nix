{ nixpkgs, home-manager, ... }: {
  nixpkgs.config.allowUnfree = true; # allow install paid apps (require to add license manually in each app)

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.auto-optimise-store = true;

  home-manager.backupFileExtension = "backup";
}
