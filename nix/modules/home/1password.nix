{ lib, pkgs, config, ... }:
let
  homePK = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINvmtszHUi0Na/nhc4rNQJu1YVhwRcS6Qt2ZOjDEOUa6";
  workPK = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII4oPEdKmaRnMkP2CMpK5HyqMdYHYOj/fzDXKoSWWl6T";
in
{
  programs.ssh = {
    enable = true;
    extraConfig = lib.mkMerge [
      (lib.mkIf pkgs.stdenv.isLinux ''
        IdentityAgent "~/.1password/agent.sock"
      '')
      (lib.mkIf pkgs.stdenv.isDarwin ''
        IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
      '')
    ];
  };

  programs.git = {
    signing = {
      key = if config.isWork then workPK else homePK;
      signByDefault = true;
    };
    extraConfig = {
      gpg = { format = "ssh"; };
      gpg."ssh".program = lib.mkMerge [
        (lib.mkIf pkgs.stdenv.isLinux "${pkgs._1password-gui}/bin/op-ssh-sign")
        (lib.mkIf pkgs.stdenv.isDarwin "/Applications/1Password.app/Contents/MacOS/op-ssh-sign")
      ];
    };
  };
}
