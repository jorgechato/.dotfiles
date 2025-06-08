{ self, pkgs, lib, config, ... }:
let
  persistentApps = [
    "/Applications/Brave Browser.app"
    "/Applications/Ghostty.app"
  ];

  homePersistentApps = [
    "/Applications/Outerbase Studio.app"
    "/Applications/Scrivener.app"
    "/Applications/DaVinci Resolve.app"
    "/Applications/MacFamilyTree 10.app"
  ];

  workPersistentApps = [
    "/Applications/Google Chrome.app"
    "/Applications/Slack.app"
  ];

  home = "/Users/jorge";
in
{
  config = {
    system = {
      # Keyboard
      keyboard = {
        enableKeyMapping = true;
        remapCapsLockToControl = true;
      };

      defaults = {
        loginwindow.GuestEnabled = false;
        loginwindow.LoginwindowText = "If lost, contact lost@jrg.tools";

        # MenuBar
        NSGlobalDomain._HIHideMenuBar = false;

        # Dock
        dock = {
          autohide = true;
          orientation = "right";
          persistent-apps = lib.mkMerge [
            (lib.mkIf config.ui.isWork workPersistentApps)
            persistentApps
            (lib.mkIf (!config.ui.isWork) homePersistentApps)
          ];
          persistent-others = [
            "${home}/Downloads"
          ];
          show-recents = false;
          largesize = 50;
          tilesize = 40;
          mru-spaces = false;
          expose-group-apps = true;
        };

        # Monitors with different spaces (for aerospace)
        spaces.spans-displays = true;

        SoftwareUpdate.AutomaticallyInstallMacOSUpdates = false;
        screencapture.location = "${home}/Pictures/screenshots";

        # Mouse
        trackpad.Clicking = true;
        NSGlobalDomain."com.apple.trackpad.forceClick" = true;
        NSGlobalDomain."com.apple.trackpad.scaling" = 3.0;
        ".GlobalPreferences"."com.apple.mouse.scaling" = 3.0;

        # Finder
        finder = {
          FXPreferredViewStyle = "Nlsv";
          AppleShowAllFiles = true;
          AppleShowAllExtensions = true;
          CreateDesktop = false;
          FXDefaultSearchScope = "SCcf"; # Search current folder
          _FXSortFoldersFirst = true;
        };

        # Global
        NSGlobalDomain = {
          AppleKeyboardUIMode = 3;
          AppleICUForce24HourTime = true;
          AppleInterfaceStyle = "Dark";
          "com.apple.keyboard.fnState" = true;
          AppleShowAllFiles = true;
          AppleShowAllExtensions = true;

          AppleMeasurementUnits = "Centimeters";
          AppleMetricUnits = 1;
          AppleTemperatureUnit = "Celsius";
          NSAutomaticCapitalizationEnabled = false;
          NSAutomaticDashSubstitutionEnabled = false;
          NSAutomaticPeriodSubstitutionEnabled = false;
          NSAutomaticQuoteSubstitutionEnabled = false;
          NSAutomaticInlinePredictionEnabled = false;
          NSAutomaticSpellingCorrectionEnabled = false;
        };

        # ScreenSaver
        screensaver = {
          askForPassword = true;
          askForPasswordDelay = 0;
        };

        # Window Manager
        WindowManager = {
          # Wallpaper click to show desktop
          EnableStandardClickToShowDesktop = true;
          # hide desktop items
          StandardHideDesktopIcons = true;
          # hide desktop widgets
          StandardHideWidgets = true;
        };
      };
    };
  };
}
