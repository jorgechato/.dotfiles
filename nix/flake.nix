{
  description = "Jorge's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew }:
    let
      configuration = { pkgs, config, ... }: {
        nixpkgs.config.allowUnfree = true; # allow install paid apps (require to add license manually in each app)

        environment.systemPackages =
          [
            # TERMINAL
            pkgs.curl
            pkgs.neovim
            pkgs.mkalias
            pkgs.nmap
            pkgs.tree
            pkgs.git
            pkgs.fortune
            pkgs.platinum-searcher
            pkgs.fzf
            pkgs.bat
            pkgs.httpie
            pkgs.grex
            pkgs.direnv
            pkgs.jq
            pkgs.yq
            pkgs.starship
            pkgs.go
            pkgs.protobuf
            pkgs.jwt-cli
            pkgs.gnused
            pkgs.cue
            pkgs.cuelsp
            pkgs.rectangle
            # FISH PLUGINS
            pkgs.fishPlugins.z
            pkgs.fishPlugins.fzf
            # pkgs.fishPlugins.config
            # pkgs.fishPlugins.direnv
            # pkgs.fishPlugins.spark
            # pkgs.fishPlugins.last-working-dir
            # pkgs.fishPlugins.rustup
            # pkgs.fishPlugins.https://github.com/blackjid/plugin-kubectl
            # GUI
            pkgs.iterm2
            pkgs.iina
            pkgs.vscode
          ];

        fonts.packages = [
          pkgs.meslo-lgs-nf
        ];

        homebrew = {
          enable = true;
          brews = [
            "mas"
          ];
          casks = [
            "the-unarchiver"
            "discrod"
            "docker"
            "1password"
            "brave-browser"
            "jetbrains-toolbox"
          ];
          # masApps = [];
          onActivation.cleanup = "zap";
          onActivation.autoUpdate = true;
          onActivation.upgrade = true;
        };

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

        system.defaults = {
          dock.autohide = true;
          dock.orientation = "right";
          dock.persistent-apps = [
            "/Applications/Brave Browser.app"
            "${pkgs.iterm2}/Applications/iTerm.app"
          ];
          finder.FXPreferredViewStyle = "Nlsv";
          NSGlobalDomain.AppleICUForce24HourTime = true;
          NSGlobalDomain.AppleInterfaceStyle = "Dark";
          NSGlobalDomain."com.apple.keyboard.fnState" = true;
        };

        system.keyboard = {
          enableKeyMapping = true;
          remapCapsLockToControl = true;
        };

        # Auto upgrade nix package and the daemon service.
        services.nix-daemon.enable = true;
        # nix.package = pkgs.nix;

        nix.settings.experimental-features = "nix-command flakes";

        programs.fish.enable = true;

        # Set Git commit hash for darwin-version.
        system.configurationRevision = self.rev or self.dirtyRev or null;

        # Used for backwards compatibility, please read the changelog before changing.
        # $ darwin-rebuild changelog
        system.stateVersion = 5;

        # The platform the configuration will be used on.
        nixpkgs.hostPlatform = "x86_64-darwin"; # for Apple Silicon use "aarch64-darwin"
      };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#simple
      darwinConfigurations."ichi" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              user = "jorge";
              autoMigrate = true; # Automatically migrate existing Homebrew installations
            };
          }
        ];
      };

      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations."ichi".pkgs;
    };
}
