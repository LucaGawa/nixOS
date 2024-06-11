{
  inputs,
  config,
  pkgs-stable,
  pkgs,
  lib,
  userSet,
  ...
}: let
  userName = userSet.userName;
  my-python-packages = ps:
    with ps; [
      pandas
      numpy
      sympy
      scipy
      dbus-python #needed for eduroam installer
      jupyter
      # python311Packages.jupyter-core
      matplotlib
      pygobject3
      gst-python
      numba
      pint
      jax
      jaxlib-bin
      # jaxlibWithCuda
      tqdm
      # tensorflow
      pytest
      ### Machine Learning
      scikit-learn
      seaborn
      torch
      torchvision
      astropy
      ###
      # timeit
      # tenpy
      #tables
    ];
  latex = pkgs.texlive.combine {
    inherit
      (pkgs.texlive)
      scheme-basic
      german
      mathtools
      hyperref
      standalone
      varwidth
      scontents
      xcolor
      latexmk
      koma-script
      csquotes
      graphics
      physics
      siunitx
      caption
      cleveref
      oberdiek
      txfonts
      pgf
      l3packages
      moreverb
      listings
      autobreak
      booktabs
      tcolorbox
      mhchem
      chemfig
      enumitem
      autonum
      appendix
      cancel
      doublestroke
      wasysym
      tensor
      carlisle
      environ
      tikzfill
      pdfcol
      listingsutf8
      simplekv
      etextools
      textpos
      letltxmacro
      wasy
      helvetic
      times
      braket
      tikz-feynman
      luatex85
      # esint
      
      ulem
      simpler-wick
      simplewick
      underscore
      biblatex
      placeins
      gensymb
      fontspec
      tocloft
      setspace
      biber
      # Arial
      
      texcount
      latexindent
      luainputenc
      luatexbase
      # xelatex
      
      ;
  };
in {
  # Enable networking
  networking.networkmanager.enable = true;

  # Enable scanning
  hardware.sane.enable = true;
  hardware.sane.extraBackends = [pkgs.hplipWithPlugin pkgs.epkowa];
  # Network scanning
  # services.avahi = {
  #   enable = true;
  #   nssmdns4 = true;
  #   publish = {
  #     enable = true;
  #     addresses = true;
  #     userServices = true;
  #   };
  #   openFirewall = true;
  # };

  stylix = {
    enable = true;
    image = /home/luca/nixOS/wallpaper/1.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
    cursor = {
      package = pkgs.nordzy-cursor-theme;
      name = "Nordzy-cursors";
    };
    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override {fonts = ["FiraCode"];};
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
        applications = 10;
        terminal = 14;
        desktop = 8;
        popups = 10;
      };
    };
    opacity = {
      applications = 1.0;
      terminal = 0.9;
      desktop = 0.0;
      popups = 1.0;
    };
  };

  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    browsing = true;
  };
  #support for wacom tablet
  hardware.opentabletdriver = {
    enable = true;
    daemon.enable = true;
  };

  hardware.uinput.enable = true;
  users.groups.vinput.members = [userName];
  users.groups.input.members = [userName];

  #Enable bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  services.upower.enable = true;

  services.displayManager.sddm = {
    enable = true;
    autoNumlock = true;
    theme = "${import ./modules/sddm/sddm-theme.nix {inherit pkgs;}}";
    #autoLogin.enable = true;
    #autoLogin.user = luca;
  };

  # services.xserver.displayManager.lightdm = {
  #   enable = true;
  # };

  services.displayManager.defaultSession = "hyprland";
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.fish.enable = true;

  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
      thunar-media-tags-plugin
    ];
  };
  services.tumbler.enable = true; # Thumbnail support for images

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "altgr-intl";
    xkb.options = "nodeadkeys";
  };

  # Configure console keymap
  console.keyMap = "us-acentos";

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.sddm.enableGnomeKeyring = true;
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  security.polkit.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.luca = {
    isNormalUser = true;
    description = "Luca";
    extraGroups = ["networkmanager" "wheel" "scanner" "lp" "input"];
    shell = pkgs.fish;
    packages = with pkgs; [
      #  firefox
      #  thunderbird
    ];
  };

  # Allow unfree packages
  nixpkgs.config = {
    allowUnfree = true;
  };

  environment.sessionVariables = {
    #Hint electron apps to use wayland
    # NIXOS_OZONE_WL = "1";
    LD_LIBRARY_PATH = ["${pkgs.stdenv.cc.cc.lib}/lib"];
  };
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    sway-contrib.grimshot
    wget
    brave
    firefox-wayland
    thunderbird
    spotify
    xwayland
    sddm
    # kitty
    alacritty
    git
    gparted
    # pkgs-stable.hyprland
    onlyoffice-bin
    waybar
    mako #notification deamon
    libnotify #dependency for deamon
    rofi-wayland
    networkmanagerapplet
    killall
    xfce.mousepad #text edior
    flameshot
    hyprpicker
    unzip
    pavucontrol
    libgccjit # gnu compiler collection
    gcc-unwrapped
    binutils
    gtk3
    pywal
    hyprpaper
    mathematica
    octaveFull
    mate.atril
    wlogout
    fish
    starship
    eza #ls replacement
    bat #cat replacement
    zoxide #cd replacement
    entr # run code on every save
    tldr
    neofetch
    wlr-randr
    wdisplays
    lshw
    libsForQt5.qt5ct
    libsForQt5.qt5.qtwayland
    qt6.qtwayland
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5.qtquickcontrols2
    libva
    zoom-us
    cliphist
    wl-clipboard
    playerctl
    brightnessctl
    libreoffice-still
    wireplumber
    vifm
    # pkgs.libsForQt5.polkit-kde-agent #todo muss glaub noch in hyprland aktiviert werden
    lxqt.lxqt-policykit
    (python3.withPackages my-python-packages)
    # latex
    texliveFull
    # pkgs.# stable.xournalpp
    rclone
    gnome.adwaita-icon-theme
    # pkgs.#papirus-icon-theme
    most #remove perhabs and use alias to map on other pager
    owncloud-client
    libgnome-keyring
    home-manager
    evince
    nomacs
    gimp
    inkscape
    upower
    libimobiledevice-glue
    pdfarranger
    zathura
    xdotool #vimtex forword search dependency
    way-displays
    pkgs.rambox
    # pkgs.#nvd #shows nixos diff packages
    htop
    btop
    swaynotificationcenter
    xournalpp
    feh
    pywal
    lynx
    lua-language-server
    nix-prefetch-git
    xdg-desktop-portal-hyprland
    swaylock-effects
    nordic
    scribus
    swaybg
    ripgrep # for grep with nvim
    # pkgs.julia-bin
    fzf
    poppler
    termpdfpy
    helvetica-neue-lt-std
    ltex-ls
    discord
    fd
    pstree
    # python nvim setup
    # nodePackages_latest.pyright
    mypy
    ruff
    black
    python311Packages.debugpy
    python311Packages.pip
    python311Packages.cython
    alejandra
    nil
    zip
    neovim-remote #backwards search latex
    luaformatter
    ltex-ls #lsp server latex
    texlab #lsp server latex
    tectonic
    pplatex
    entr
    python311Packages.python-lsp-server
    zotero
    zulu17
    vlc
    python311Packages.pint
    fityk
    libstdcxx5
    atuin # replacement for upkey history
    powertop
    # pkgs-stable.chromium
    # pkgs-stable.epoll-shim
    ###############################################33
    # pkgs.pdftotext
    # pkgs.swaylock
  ];
  # with pkgs-stable;
  # [
  # 	stable.xournalpp
  # ];

  security.sudo.configFile = ''
    luca ALL = (ALL) ALL
           luca ALL = (root) NOPASSWD: /run/current-system/sw/bin/nixos-rebuild
  '';

  # boot.extraModulePackages = with config.boot.kernelPackages; [v4l2loopback];
  # boot.kernelModules = [
  #   "v4l2loopback"
  # ];
  # boot.extraModprobeConfig = ''
  #   options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
  # '';

  nixpkgs.overlays = [
    # (outputs.add-stable-packages)
    (self: super: {
      waybar = super.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
      });
    })
    (self: super: {
      nextcloud-client = super.nextcloud-client.override {
        withGnomeKeyring = true;
        libgnome-keyring = self.gnome.libgnome-keyring;
      };
    })
    (
      self: super: {
        zoomUsFixed = pkgs.zoom-us.overrideAttrs (old: {
          postFixup =
            old.postFixup
            + ''
              wrapProgram $out/bin/zoom-us --unset XDG_SESSION_TYPE
            '';
        });
        zoom = pkgs.zoom-us.overrideAttrs (old: {
          postFixup =
            old.postFixup
            + ''
              wrapProgram $out/bin/zoom --unset XDG_SESSION_TYPE
            '';
        });
      }
    )
  ];

  fonts.fontDir.enable = true;
  fonts.enableDefaultPackages = true;
  fonts.enableGhostscriptFonts = true;
  fonts.packages = with pkgs; [
    nerdfonts
    font-awesome
    google-fonts
    corefonts
    inconsolata
    libertine
    noto-fonts
    source-code-pro
    source-sans-pro
    powerline-fonts
  ];

  #USB Sticks mounting
  services.devmon.enable = true;
  services.udisks2.enable = true;
  services.gvfs.enable = true;

  # communication between Apps (screen sharing, opening links,...)
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  #networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
  };
}
