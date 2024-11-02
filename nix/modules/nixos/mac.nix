{ self, pkgs, lib, config, ... }:
let
  persistentApps = [
    "/Applications/Brave Browser.app"
    "/Applications/iTerm.app"
    "/Applications/Scrivener.app"
    "/Applications/DaVinci Resolve.app"
    "/Applications/MacFamilyTree 10.app"
  ];

  workPersistentApps = [
    "/Applications/Google Chrome.app"
  ];

  home = "/Users/jorge";
in
{
  config = {
    system = {
      # Keyboard
      keyboard.enableKeyMapping = true;
      keyboard.remapCapsLockToControl = true;

      defaults = {
        loginwindow.GuestEnabled = false;
        loginwindow.LoginwindowText = "If lost, contact lost.8euto@passmail.net";

        # Dock
        dock.autohide = true;
        dock.orientation = "right";
        dock.persistent-apps = lib.mkMerge [
          persistentApps
          (lib.mkIf config.isWork workPersistentApps)
        ];
        dock.persistent-others = [
          "${home}/Downloads"
        ];
        dock.show-recents = false;
        dock.largesize = 50;
        dock.tilesize = 40;
        dock.mru-spaces = false;

        SoftwareUpdate.AutomaticallyInstallMacOSUpdates = false;
        screencapture.location = "${home}/Pictures/screenshots";

        # Mouse
        trackpad.Clicking = true;
        NSGlobalDomain."com.apple.trackpad.forceClick" = true;
        NSGlobalDomain."com.apple.trackpad.scaling" = 3.0;
        ".GlobalPreferences"."com.apple.mouse.scaling" = 3.0;

        # Finder
        finder.FXPreferredViewStyle = "Nlsv";
        finder.AppleShowAllFiles = true;
        finder.AppleShowAllExtensions = true;
        finder.CreateDesktop = false;
        finder.FXDefaultSearchScope = "SCcf"; # Search current folder
        finder._FXSortFoldersFirst = true;

        # Global
        NSGlobalDomain.AppleKeyboardUIMode = 3;
        NSGlobalDomain.AppleICUForce24HourTime = true;
        NSGlobalDomain.AppleInterfaceStyle = "Dark";
        NSGlobalDomain."com.apple.keyboard.fnState" = true;
        NSGlobalDomain.AppleShowAllFiles = true;
        NSGlobalDomain.AppleShowAllExtensions = true;

        # ScreenSaver
        screensaver = {
          askForPassword = true;
          askForPasswordDelay = 0;
        };

        # Custom
        # CustomSystemPreferences = { };

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
