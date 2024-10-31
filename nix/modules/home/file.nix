{ self, ... }:

{
  home.file = {
    ".config/fish".source = ../../../fish;
    ".gitconfig".source = ../../../git/.gitconfig;
    ".editorconfig".source = ../../../.editorconfig;
    ".config/nvim".source = ../../../nvim;
    ".config/nix".source = ../../../nix;
    ".config/1Password".source = ../../../1Password;
    ".config/starship.toml".source = ../../../starship/starship.toml;
    ".npmrc".source = ../../../.npmrc;
  };
}
