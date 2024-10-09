{ pkgs, config, ... }: {
  system.defaults = {
    dock.autohide = true;
    dock.orientation = "right";
    dock.persistent-apps = [
      "/Applications/Brave Browser.app"
      "${pkgs.iterm2}/Applications/iTerm.app"
    ];
    finder.FXPreferredViewStyle = "Nlsv";
    NSGlobalDomain.AppleICUForce24HourTime = true;
    NSGlobalDomain.AppleInterfaceStyle = "Dark";
    NSGlobalDomain."com.apple.keyboard.fnState" = true;
  };
}
