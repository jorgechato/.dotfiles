{ pkgs, config, self, nixpkgs, home-manager, ... }:
let
  home = "/Users/jorge";
in
{
  # Add apps to spotlight for mac
  system.activationScripts.applications.text =
    let
      env = pkgs.buildEnv {
        name = "system-applications";
        paths = config.environment.systemPackages;
        pathsToLink = "/Applications";
      };
    in
    pkgs.lib.mkForce ''
      # Set up applications.
      echo "setting up /Applications..." >&2
      rm -rf /Applications/Nix\ Apps
      mkdir -p /Applications/Nix\ Apps
      find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
      while read src; do
        app_name=$(basename "$src")
        echo "copying $src" >&2
        ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
      done
    '';

  system.defaults.SoftwareUpdate.AutomaticallyInstallMacOSUpdates = false;

  # Keyboard settings
  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToControl = true;
  };

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  users.users.jorge.home = home;

  programs.fish.enable = true;
  programs.zsh.enable = false;
  programs.bash.enable = false;

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  nixpkgs.config.allowUnfree = true; # allow install paid apps (require to add license manually in each app)

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.auto-optimise-store = true;

  home-manager.backupFileExtension = "backup";

  # Services
  services.yabai.enable = true;
  services.yabai.package = pkgs.yabai;
  services.skhd.enable = true;
  services.skhd.package = pkgs.skhd;
  # services.sketchybar.enable = true;
  # services.sketchybar.package = pkgs.sketchybar;

  environment.variables = {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
  };
}

