{
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = [
    #../../system/programs_basic.nix
    ../../modules/aerospace.nix
    ../../system/python.nix
    # ../../modules/zsh.nix
  ];
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    #vim
    #texliveFull
    #spotify
    #firefox
    mkalias
    alacritty
    starship
    eza
    bat
    zoxide
    neofetch
    atuin
    speedtest-cli
    zotero
    sketchybar
    fzf
    lua-language-server
    # ghostty
    # sciebo
    # owncloud-client
    # jankyborders
  ];

  services.jankyborders = {
    enable = true;
    hidpi = true;
    inactive_color = "0x00FFFFFF";
  };

  system.defaults = { 
    NSGlobalDomain = {
      "com.apple.swipescrolldirection" = true;
      NSWindowShouldDragOnGesture = true;
    };
  # "com.apple.SoftwareUpdate" = {
  #   AutomaticCheckEnabled = true;
  #   ScheduleFrequency = 1;
  #   AutomaticDownload = 1;
  #   CriticalUpdateInstall = 1;
  # };
  };

  # services.sketchybar = {
  #   enable = true;
#     config = ''
#       sketchybar --bar 
#                         height=24    \
#                         position=right \ 
#        --update \
#        --add event aerospace_workspace_change \
#
# for sid in $(aerospace list-workspaces --all); do
#     sketchybar --add item space.$sid left \
#         --subscribe space.$sid aerospace_workspace_change \
#         --set space.$sid \
#         background.color=0x44ffffff \
#         background.corner_radius=5 \
#         background.height=20 \
#         background.drawing=off \
#         label="$sid" \
#         click_script="aerospace workspace $sid" \
#         script="$CONFIG_DIR/plugins/aerospace.sh $sid"
# done
#
#
# sketchybar --add item clock right
#     '';
  # };

  # services.libinput.mouse = {
  #   naturalScrolling = true;
  # };

  # options.services.jankyborders = {
  #   enable = true;
  # };

  programs.zsh.interactiveShellInit = ''
    # Set up zoxide.
    # eval "$(zoxide init zsh)"
    # eval "$(atuin init zsh)"
    # eval "$(starship init zsh)"
    fish
  '';

  homebrew = {
    enable = true;
    # taps = [
    #   "FelixKratz/formulae"
    # ];
    brews = [
      "mas"
    ];
    casks = [
      "spotify"
      "firefox"
      "bitwarden"
      "google-drive"
      # "bettertouchtool"
      "geekbench"
      "chatgpt"
      "ukelele"
      "owncloud"
      "hammerspoon"
      "ghostty"
      # "displaylink"
    ];
    # taps = [
    #   "FelixKratz/formulae"
    # ];
    masApps = {
      "whatsapp" = 310633997;
      "goodnotes" = 1444383602;
      "primevideo" = 545519333;
      "keynote" = 409183694;
      "kdeconnect" = 1580245991;
      "pages" = 409201541;
      "numbers" = 409203825;
      "wipr" = 1662217862; 
    };
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
  };

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";
  nixpkgs.config = {
    allowUnfree = true;
  };

  # Enable alternative shell support in nix-darwin.
  # programs.fish.enable = true;
  # users.users = {
  #   luca = {
  #     shell = pkgs.fish;
  #   };
  # };
  #
  # environment.shells = [pkgs.fish];
  #
  # environment.shellInit = "fish";

  # nix-homebrew = {
  #   enable = true;
  #   enableRosetta = true;
  #   user = "luca";
  #   autoMigrate = true;
  # };

  # Set Git commit hash for darwin-version.
  #system.configurationRevision = self.rev or self.dirtyRev or null;

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToEscape = true;
  };

  security.pam.enableSudoTouchIdAuth = true;

  system.activationScripts.applications.text = let
    env = pkgs.buildEnv {
      name = "system-applications";
      paths = config.environment.systemPackages;
      pathsToLink = "/Applications";
    };
  in
    pkgs.lib.mkForce ''
      # Set up applications.
      echo "setting up /Applications..." >&2
      rm -rf /Applications/Nix\ Apps
      mkdir -p /Applications/Nix\ Apps
      find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
      while read -r src; do
        app_name=$(basename "$src")
        echo "copying $src" >&2
        ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
      done
    '';

  system.defaults = {
    dock.autohide = true;
    dock.expose-group-apps = true;
  };

  # programs.fish.enable = true;

  stylix = {
    enable = true;
    image = ../../../../wallpaper/1.png;
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
    base16Scheme = {
      "base00" = "#2E3440";
      "base01" = "#3B4252";
      "base02" = "#434C5E";
      "base03" = "#4C566A";
      "base04" = "#D8DEE9";
      "base05" = "#E5E9F0";
      "base06" = "#ECEFF4";
      "base07" = "#8FBCBB";
      "base08" = "#BF616A";
      "base09" = "#D08770";
      "base0A" = "#EBCB8B";
      "base0B" = "#A3BE8C";
      "base0C" = "#88C0D0";
      "base0D" = "#81A1C1";
      "base0E" = "#B48EAD";
      "base0F" = "#5E81AC";
    };
    fonts = {
      monospace = {
        #   # package = pkgs.nerdfonts.override {fonts = ["FiraCode"];};
        package = pkgs.nerd-fonts.fira-code;
        name = "FiraCode Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.fira;
        name = "Fira Sans Medium";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
      sizes = {
        # applications = 20;
        terminal = 14;
        # desktop = 8;
        # popups = 10;
      };
    };
    opacity = {
      applications = 0.9;
      terminal = 0.9;
      # desktop = 0.0;
      # popups = 1.0;
    };
    # targets."neovim".enable = false;
  };

  power.sleep = {
    computer = "never";
    display = 20;
  };

  system.defaults.controlcenter = {
    BatteryShowPercentage = true;
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
}
