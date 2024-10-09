{ pkgs, ... }: {
  programs.git = {
    enable = true;

    extraConfig = {
      # Sign all commits using ssh key
      commit.gpgsign = true;
      gpg.format = "ssh";
      gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
      user.signingkey = "~/.ssh/id_github_signinkey.pub";
    };
  };
}
