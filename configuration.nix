{
  inputs,
  config,
  pkgs,
  pkgs-stable,
  lib,
  ...
}: let
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
      #tables
    ];
  latex = pkgs.texlive.combine {
    inherit
      (pkgs.texlive)
      scheme-basic
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
      ;
  };
in {
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable scanning
  hardware.sane.enable = true;
  hardware.sane.extraBackends = [pkgs.hplipWithPlugin pkgs.epkowa];
  # Network scanning
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    publish = {
      enable = true;
      addresses = true;
      userServices = true;
    };
    openFirewall = true;
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
  users.groups.vinput.members = ["luca"];
  users.groups.input.members = ["luca"];

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

  # Enable the GNOME Desktop Environment.
  # services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.sddm = {
    enable = true;
    autoNumlock = true;
    theme = "${import ./modules/sddm/sddm-theme.nix {inherit pkgs;}}";
    #autoLogin.enable = true;
    #autoLogin.user = luca;
  };

  services.xserver.displayManager.defaultSession = "hyprland";
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
    layout = "us";
    xkbVariant = "altgr-intl";
    xkbOptions = "nodeadkeys";
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
  };
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = [
    # pkgs.#neovim
    pkgs.sway-contrib.grimshot
    pkgs.wget
    pkgs.brave
    pkgs.firefox-wayland
    pkgs.thunderbird
    pkgs.spotify
    pkgs.xwayland
    pkgs.sddm
    pkgs.kitty
    pkgs.alacritty
    pkgs.git
    pkgs.gparted
    pkgs.hyprland
    pkgs.onlyoffice-bin
    # pkgs.# xfce.thunar
    pkgs.waybar
    # pkgs.#eww-wayland
    pkgs.mako #notification deamon
    pkgs.libnotify #dependency for deamon
    pkgs.rofi-wayland
    pkgs.networkmanagerapplet
    pkgs.killall
    pkgs.xfce.mousepad #text edior
    # pkgs.#vscode-with-extensions
    pkgs.flameshot
    pkgs.hyprpicker
    pkgs.unzip
    pkgs.pavucontrol
    pkgs.libgccjit # gnu compiler collection
    pkgs.binutils
    pkgs.gtk3
    pkgs.pywal
    pkgs.hyprpaper
    pkgs.mathematica
    pkgs.octaveFull
    pkgs.wlogout
    pkgs.fish
    pkgs.starship
    pkgs.eza #ls replacement
    pkgs.bat #cat replacement
    pkgs.zoxide #cd replacement
    pkgs.entr # run code on every save
    pkgs.tldr
    pkgs.neofetch
    pkgs.wlr-randr
    pkgs.wdisplays
    pkgs.lshw
    pkgs.libsForQt5.qt5ct
    pkgs.libsForQt5.qt5.qtwayland
    pkgs.qt6.qtwayland
    pkgs.libsForQt5.qt5.qtgraphicaleffects
    pkgs.libsForQt5.qt5.qtquickcontrols2
    pkgs.libva
    pkgs.zoom-us
    pkgs.cliphist
    pkgs.wl-clipboard
    pkgs.playerctl
    pkgs.brightnessctl
    pkgs.libreoffice-still
    pkgs.wireplumber
    pkgs.vifm
    # pkgs.libsForQt5.polkit-kde-agent #todo muss glaub noch in hyprland aktiviert werden
    pkgs.lxqt.lxqt-policykit
    (pkgs.python3.withPackages my-python-packages)
    latex
    # pkgs.# stable.xournalpp
    pkgs.rclone
    pkgs.gnome.adwaita-icon-theme
    # pkgs.#papirus-icon-theme
    pkgs.most #remove perhabs and use alias to map on other pager
    pkgs.owncloud-client
    pkgs.libgnome-keyring
    pkgs.home-manager
    pkgs.evince
    pkgs.nomacs
    pkgs.gimp
    # pkgs.#jdownloader
    pkgs.upower
    pkgs.libimobiledevice-glue
    pkgs.pdfarranger
    pkgs.zathura
    pkgs.xdotool #vimtex forword search dependency
    pkgs.way-displays
    pkgs.qutebrowser
    pkgs.rambox
    # pkgs.#nvd #shows nixos diff packages
    pkgs.htop
    pkgs.swaynotificationcenter
    pkgs.xournalpp
    pkgs.feh
    pkgs.pywal
    pkgs.lynx
    pkgs.lua-language-server
    pkgs.nix-prefetch-git
    pkgs.xdg-desktop-portal-hyprland
    pkgs.swaylock-effects
    pkgs.nordic
    pkgs.scribus
    pkgs.swaybg
    pkgs.ripgrep # for grep with nvim
    pkgs.julia-bin
    pkgs.fzf
    pkgs.poppler
    pkgs.termpdfpy
    pkgs.helvetica-neue-lt-std
    pkgs.ltex-ls
    pkgs.discord
    pkgs.fd
    pkgs.pstree
    # python nvim setup
    pkgs.nodePackages_latest.pyright
    pkgs.mypy
    pkgs.ruff
    pkgs.black
    pkgs.python311Packages.debugpy
    pkgs.alejandra
    pkgs.nil
    pkgs.zip

    # pkgs.perl536Packages.LatexIndent #latex formatter
    pkgs.luaformatter
    pkgs.ltex-ls #lsp server latex
    pkgs.texlab #lsp server latex
    pkgs.tectonic
    pkgs.pplatex
    pkgs.entr
    pkgs.python311Packages.python-lsp-server
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
  fonts.packages = with pkgs; [
    nerdfonts
    font-awesome
    google-fonts
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
