{ config, lib, pkgs, ... }: {
  programs.fish.shellAliases = with pkgs; {
    # Basic
    l = "la";
    lsd = "la -d */ | sed -Ee 's,/+$,,";
    sf = "source ~/.config/fish/config.fish";
    fishconfig = "nvim ~/.config/fish/config.fish";
    aliases = "nvim ~/.config/fish/aliases.fish";
    "cd.." = "cd ..";
    ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";
    "....." = "cd ../../../..";
    cx = "chmod +x";
    "c-x" = "chmod -x";

    # Sudo commands
    eject = "sudo eject";
    ifconfig = "sudo ifconfig";
    airodump-ng = "sudo airodump-ng";
    airmon-ng = "sudo airmon-ng";
    setoolkit = "sudo setoolkit";
    sqlmap = "workon sqlmap && python ~/kali/sqlmap-dev/sqlmap.py";
    wireshark = "sudo /Applications/Wireshark.app/Contents/MacOS/Wireshark";

    # VIM
    vim = "nvim";
    vimconfig = "nvim ~/.vimrc";

    # VSCODE insiders
    vs = ''if [ "$#" -eq 1 ]; then code-insiders "$1"; else code-insiders .; fi'';

    # Work env
    g = "git";

    # Docker/Podman
    p = "podman";
    dc = "docker-compose";
    d = "docker";

    # AWS
    awsl = "aws ssm start-session --target";
    awsp = "aws_profiles";

    # K8S
    k = "kubectl";
    kc = "kubie ctx";

    # GCP
    gc = "gcloud";
    gcc = "gcloud container";
    gccc = "gcloud container clusters";

    # Other aliases
    tf = "terraform";
    o = "open";
    parquet = "parquet-tools";
    c = "cargo";
    python = "python3";
    py = "python3";
    pyclean = "rm -rf **/*.pyc";
    sourcelist = "nvim /etc/apt/sources.list";
    hosts = "nvim /etc/hosts";

    # Include additional aliases from another file
    # alias gck8s "gcloud container clusters get-credentials citadel-2g-dev-tokyo-01 --region asia-northeast1 --project mercari-jp-citadel-dev"
  };
}
