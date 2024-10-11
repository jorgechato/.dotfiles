{ pkgs, ... }: {
  programs.git = {
    enable = true;

    extraConfig = {
      # Sign all commits using ssh key
      commit.gpgsign = true;
      gpg.format = "ssh";
      gpg.ssh.allowedSignersFile = "/Users/jorge/.ssh/allowed_signers";
      user.signingkey = "/Users/jorge/.ssh/id_github_signinkey.pub";
    };
  };
}
