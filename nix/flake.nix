{
  description = "Jorge's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew }:
    {
      darwinConfigurations."ichi" = nix-darwin.lib.darwinSystem {
        modules = [
          ./hosts/configuration.nix
          {
            nixpkgs.hostPlatform = "x86_64-darwin";
          }
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              user = "jorge";
              autoMigrate = true; # Automatically migrate existing Homebrew installations
            };
          }
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.jorge = import ./modules/home/core.nix;
          }
        ];
      };
      darwinConfigurations."ni" = nix-darwin.lib.darwinSystem {
        modules = [
          ./hosts/configuration.nix
          {
            nixpkgs.hostPlatform = "aarch64-darwin";
          }
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              user = "jorge";
            };
          }
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.jorge = import ./modules/home/core.nix;
          }
        ];
      };

      darwinConfigurations."work" = nix-darwin.lib.darwinSystem {
        modules = [
          ./hosts/work/configuration.nix
          {
            nixpkgs.hostPlatform = "aarch64-darwin";
          }
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              user = "jorge";
            };
          }
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.jorge = import ./modules/home/core.nix;
          }
        ];
      };

      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations."ichi".pkgs;
      darwinPackages = self.darwinConfigurations."ni".pkgs;
      darwinPackages = self.darwinConfigurations."work".pkgs;
    };
}
