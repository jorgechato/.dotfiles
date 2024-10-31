{ self, config, ... }: {
  security.pam.enableSudoTouchIdAuth = true;
}
