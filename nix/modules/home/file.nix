{ self, ... }:

{
  home.file = {
    ".config/1Password".source = ~/.dotfiles/1Password;
    ".config/fish".source = ~/.dotfiles/fish;
    ".config/nvim".source = ~/.dotfiles/nvim;
    ".config/skhd".source = ~/.dotfiles/skhd;
    ".config/starship.toml".source = ~/.dotfiles/starship.toml;
    ".gitconfig".source = ~/.dotfiles/.gitconfig;
    ".editorconfig".source = ~/.dotfiles/.editorconfig;
    ".npmrc".source = ~/.dotfiles/.npmrc;
  };
}
