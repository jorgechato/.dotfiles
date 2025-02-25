{ self, config, ... }: {
  security.pam.services.sudo_local.touchIdAuth = true;
}
