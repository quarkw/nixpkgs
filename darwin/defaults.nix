{
  system.activationScripts.postUserActivation.text = ''
    # Following line should allow us to avoid a logout/login cycle
    /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
  '';

  #https://macos-defaults.com/
  system.defaults.NSGlobalDomain = {
    "com.apple.trackpad.scaling" = 3.0;
    #AppleInterfaceStyleSwitchesAutomatically = true;
    #AppleMeasurementUnits = "Centimeters";
    #AppleMetricUnits = 1;
    #AppleShowScrollBars = "Automatic";
    #AppleTemperatureUnit = "Celsius";
    InitialKeyRepeat = 30;
    KeyRepeat = 1;
    NSAutomaticCapitalizationEnabled = false;
    NSAutomaticDashSubstitutionEnabled = false;
    NSAutomaticPeriodSubstitutionEnabled = false;
    NSAutomaticQuoteSubstitutionEnabled = false;
    NSAutomaticSpellingCorrectionEnabled = false;
    _HIHideMenuBar = false; # autohide top panel
  };

  # Firewall
  system.defaults.alf = {
    globalstate = 1;
    allowsignedenabled = 1;
    allowdownloadsignedenabled = 1;
    stealthenabled = 1;
  };

  # Dock and Mission Control
  system.defaults.dock = {
    #autohide = true;
    expose-group-by-app = false;
    mru-spaces = false;
    show-process-indicators = true;
    tilesize = 36;
    # Disable all hot corners
    wvous-bl-corner = 1;
    wvous-br-corner = 1;
    wvous-tl-corner = 1;
    wvous-tr-corner = 1;
  };

  # Login and lock screen
  system.defaults.loginwindow = {
    GuestEnabled = false;
    DisableConsoleAccess = true;
  };

  # Spaces
  system.defaults.spaces.spans-displays = false;

  # Trackpad
  system.defaults.trackpad = {
    Clicking = true;
    Dragging = true;
    #
    FirstClickThreshold = 0;
    SecondClickThreshold = 0;
  };

  # Keyboard
  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToControl = true;
  };

  # Finder
  system.defaults.finder = {
    AppleShowAllExtensions = true;
    FXEnableExtensionChangeWarning = false;
    CreateDesktop = false; # disable desktop icons
  };

  system.defaults.CustomSystemPreferences = {
    "com.apple.AppleMultitouchTrackpad" = {
      ActuationStrength = 0;
      TrackpadThreeFingerHorizSwipeGesture = 0;
      TrackpadThreeFingerVertSwipeGesture = 0;
      TrackpadFourFingerVertSwipeGesture = 2;
    };
    "com.apple.driver.AppleBluetoothMultitouch.trackpad" = {
      TrackpadThreeFingerHorizSwipeGesture = 0;
      TrackpadFourFingerVertSwipeGesture = 2;
    };
    "com.apple.dock" = {
      showAppExposeGestureEnabled = true;
      showMissionControlGestureEnabled = true;
    };
    "com.apple.HIToolbox" = {
      AppleFnUsageType = 0; #fn key does nothing
    };
  };
}
