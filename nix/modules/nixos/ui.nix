{ pkgs, lib, config, ... }: {
  options = {
    defaults.withChrome = lib.mkEnableOption "Add Chrome to the doc";
  };

  system.defaults = {
    dock.autohide = true;
    dock.orientation = "right";
    dock.persistent-apps = [
      "/Applications/Brave Browser.app"
      "${pkgs.iterm2}/Applications/iTerm.app"
    ];

    dock = lib.mkIf config.defaults.withChrome {
      persistent-apps = dock.persistent-apps ++ [ "/Applications/Google Chrome.app" ];
    };

    finder.FXPreferredViewStyle = "Nlsv";
    NSGlobalDomain.AppleICUForce24HourTime = true;
    NSGlobalDomain.AppleInterfaceStyle = "Dark";
    NSGlobalDomain."com.apple.keyboard.fnState" = true;
  };
}
