{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    sway-contrib.grimshot
    wget
    firefox-wayland
    xwayland
    sddm
    gparted
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
    # octaveFull
    mate.atril
    wlogout
    # fish
    entr # run code on every save
    tldr
    wlr-randr
    wdisplays
    lshw
    libsForQt5.qt5ct
    libsForQt5.qt5.qtwayland
    qt6.qtwayland
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5.qtquickcontrols2
    libva
    cliphist
    wl-clipboard
    playerctl
    brightnessctl
    libreoffice-still
    wireplumber
    # pkgs.libsForQt5.polkit-kde-agent #todo muss glaub noch in hyprland aktiviert werden
    lxqt.lxqt-policykit
    # latex
    # pkgs.# stable.xournalpp
    rclone
    adwaita-icon-theme
    # pkgs.#papirus-icon-theme
    most #remove perhabs and use alias to map on other pager
    libgnome-keyring
    # home-manager
    evince
    nomacs
    gimp
    upower
    libimobiledevice-glue
    pdfarranger
    xdotool #vimtex forword search dependency
    way-displays
    pkgs.rambox
    # pkgs.#nvd #shows nixos diff packages
    htop
    btop
    swaynotificationcenter
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
    poppler
    termpdfpy
    # helvetica-neue-lt-std
    ltex-ls
    fd
    pstree
    # python nvim setup
    # nodePackages_latest.pyright
    nil
    zip
    tectonic
    pplatex
    entr
    python311Packages.python-lsp-server
    zotero
    zulu17
    python311Packages.pint
    fityk
    libstdcxx5
    powertop
    kitty
    rofi-wayland
  ];
}
