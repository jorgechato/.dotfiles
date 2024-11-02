{ self, ... }:
let
  content = "NixOs hack to create folders ;)";
in
{
  home.file = {
    ".config/1Password" = {
      source = ~/.dotfiles/1Password;
      recursive = true;
    };
    ".config/fish" = {
      source = ~/.dotfiles/fish;
      recursive = true;
    };
    ".config/nvim" = {
      source = ~/.dotfiles/nvim;
      recursive = true;
    };
    ".config/skhd" = {
      source = ~/.dotfiles/skhd;
      recursive = true;
    };
    ".config/starship.toml".source = ~/.dotfiles/starship.toml;
    ".gitconfig".source = ~/.dotfiles/.gitconfig;
    ".editorconfig".source = ~/.dotfiles/.editorconfig;
    ".npmrc".source = ~/.dotfiles/.npmrc;

    "screenshots" = {
      text = content;
      target = "Pictures/screenshots/.keep";
    };
    "github" = {
      text = content;
      target = "/Projects/github/.keep";
    };
  };
}
