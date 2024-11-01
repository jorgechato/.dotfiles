{ lib
, pkgs
, ...
}: {
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
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMEhMWeOqYCi0yIiAxv58TVUQycWu4v3z0qz89I0Wg4a";
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
