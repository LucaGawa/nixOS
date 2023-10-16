# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, config, pkgs, ... }:

let
  #unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
{

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
     # <home-manager/nixos>
    ];

  # Bootloader.
#   boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.efiSupport = true;

  networking.hostName = "nixos"; # Define your hostname.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable scanning
  hardware.sane.enable = true;
  hardware.sane.extraBackends = [ pkgs.hplipWithPlugin ];
  # Network scanning
  services.avahi = {
      enable = true;
      nssmdns = true;
      publish = {
        enable = true;
        addresses = true;
        userServices = true;
      };
    };

   
  #warn-dirty = false;

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
  services.xserver.displayManager.sddm = {
    enable = true;
    autoNumlock = true;
  };
  #services.xserver.desktopManager.gnome.enable = true;
  #services.xserver.windowManager.xmonad = {
#	enable = true;
#	enableContribAndExtras=true;
#};
  services.xserver.displayManager.defaultSession = "hyprland";
  programs.hyprland = {
  	enable = true;
	xwayland.enable = true;
#	enableNvidiaPatches = false;
	};
  #programs.waybar.package = inputs.hyprland.packages.${system}.waybar-hyprland;
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

  system.autoUpgrade = {
    enable = true;
    channel = "https://nixos.org/channels/nixos-unstable";
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "altgr-intl";
    xkbOptions = "nodeadkeys";
  };

  # Configure console keymap
  console.keyMap = "us-acentos";

  # Enable CUPS to print documents.
  services.printing.enable = true;

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

#wayland.windowManager.hyprland.enableNvidiaPatches = true;
# Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
	vulkan-validation-layers
    ];
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia" "intel"];

  hardware.nvidia = {

    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    powerManagement.enable = true;
    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of 
    # supported GPUs is at: 
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
    # Only available from driver 515.43.04+
    # Do not disable this unless your GPU is unsupported or if you have a good reason to.
    open = true;

    # Enable the Nvidia settings menu,
	# accessible via `nvidia-settings`.
    nvidiaSettings = true;
    # perhabs solve tearing issue
    #forceFullCompositionPipeline = true;
    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.beta;

    prime = {
    	#sync.enable = true;
	intelBusId = "PCI:0:2:0";
	nvidiaBusId = "PCI:1:0:0";
    };
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
    extraGroups = [ "networkmanager" "wheel" "scanner" "lp" ];
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

  #environment.sessionVariables = {
  #Hint electron apps to use wayland
  #NIXOS_OZONE_WL = "1";
  #};
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
 	#neovim 
  	wget
	brave
	firefox-wayland
	thunderbird
	spotify
	xwayland
	sddm
	kitty
	git
	gparted
	hyprland
	onlyoffice-bin
	# xfce.thunar
        waybar
#	eww-wayland
	mako #notification deamon
	libnotify #dependency for deamon
	rofi-wayland 	
	networkmanagerapplet
	killall
	xfce.mousepad #text edior
        #vscode-with-extensions
	flameshot
	hyprpicker
	unzip
	pavucontrol
	libgccjit # GNU Compiler Collection
        binutils
	python3Full
	gtk3
	pywal
	hyprpaper
        mathematica
	wlogout
	fish
	starship
	eza #ls replacement
	bat #cat replacement
	neofetch
	wlr-randr
	wdisplays
	lshw
        libsForQt5.qt5ct
        libsForQt5.qt5.qtwayland
        qt6.qtwayland
	libva
	zoom-us
	cliphist
	wl-clipboard
	playerctl
	brightnessctl
	libreoffice-still
	wireplumber
        vifm
        #libsForQt5.polkit-kde-agent #todo muss glaub noch in hyprland aktiviert werden
        (texlive.combine { inherit (texlive) scheme-basic mathtools hyperref standalone varwidth scontents xcolor latexmk koma-script csquotes graphics physics siunitx caption cleveref oberdiek txfonts pgf l3packages moreverb listings autobreak booktabs tcolorbox mhchem chemfig enumitem autonum appendix cancel doublestroke wasysym tensor carlisle environ tikzfill pdfcol listingsutf8 simplekv etextools textpos letltxmacro wasy helvetic times ; })
        xournalpp
        rclone
        gnome.adwaita-icon-theme
	#papirus-icon-theme
        most #remove perhabs and use alias to map on other pager
        owncloud-client
        libgnome-keyring
        home-manager
        evince
        nomacs
        gimp
        #jdownloader
        upower
	libimobiledevice-glue
	pdfarranger
];	

  nixpkgs.overlays = [
    (self: super: {
      waybar = super.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      });
    })
    (self: super: {
      nextcloud-client = super.nextcloud-client.override {
        withGnomeKeyring = true;
        libgnome-keyring = self.gnome.libgnome-keyring;
      };
    } )
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
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

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
  # networking.firewall.enable = false;


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
