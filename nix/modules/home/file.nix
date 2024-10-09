{ ... }:

{
  home.file = {
    ".config/fish".source = ~/.dotfiles/fish;
    ".gitconfig".source = ~/.dotfiles/git/.gitconfig;
    ".editorconfig".source = ~/.dotfiles/.editorconfig;
    ".config/nvim".source = ~/.dotfiles/nvim;
    ".config/nix".source = ~/.dotfiles/nix;
    ".config/fish".source = ~/.dotfiles/fish;
    ".config/1Password".source = ~/.dotfiles/1Password;
    ".config/starship.toml".source = ~/.dotfiles/starship.toml;
    ".npmrc".source = ~/.dotfiles/.npmrc;
  };
}
