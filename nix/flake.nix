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

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, home-manager }:
    {
      darwinConfigurations."ichi" = nix-darwin.lib.darwinSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/intel/configuration.nix
          ./modules/nixos
          nix-homebrew.darwinModules.nix-homebrew
          home-manager.darwinModules.home-manager
        ];
      };
      darwinConfigurations."ni" = nix-darwin.lib.darwinSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/silicon/configuration.nix
          ./modules/nixos
          nix-homebrew.darwinModules.nix-homebrew
          home-manager.darwinModules.home-manager
        ];
      };

      darwinConfigurations."work" = nix-darwin.lib.darwinSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/work/configuration.nix
          ./modules/nixos
          nix-homebrew.darwinModules.nix-homebrew
          home-manager.darwinModules.home-manager
        ];
      };

      # Expose the package set, including overlays, for convenience.
      # darwinPackages."ichi" = self.darwinConfigurations."ichi".pkgs;
      # darwinPackages."ni" = self.darwinConfigurations."ni".pkgs;
      # darwinPackages."work" = self.darwinConfigurations."work".pkgs;
    };
}
