{ config, pkgs, ... }:

{
 home.username = "luca";
 home.homeDirectory = "/home/luca";

 home.packages = with pkgs; [
  # htop
];

 home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "brave";
  };

 
  #xsession.numlock.enable = true;

  home.file = {

  };

  programs.git = {
    enable = true;
    userName = "Luca Gawalleck";
    userEmail = "luca.gawalleck@gmail.com";
    aliases = {
      pu = "push";
      co = "checkout";
      cm = "commit -m";
    };
  };

programs.vscode = {
  enable = true;
  extensions = with pkgs.vscode-extensions; [
    #dracula-theme.theme-dracula
    vscodevim.vim
    yzhang.markdown-all-in-one
    james-yu.latex-workshop
  ];
};



  #############################################
  ############# THEMING #######################
  #############################################
  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Classic";
    };
    theme = {
      package = pkgs.adw-gtk3;
      name = "adw-gtk3";
    };
    iconTheme = {
      package = pkgs.deepin.deepin-icon-theme;
      name = "deepin-icon-theme";
    };
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
    style.name = "gtk";
    # style = {
    #  name = "adwaita-dark";
    #  package = pkgs.adwaita-qt;
    # };
  };

  xdg.mimeApps.defaultApplications = {
    "text/plain" = ["mousepad.desktop"];
    "text/tex" = ["mousepad.desktop"];
    "application/pdf" = ["evince.desktop"];
    "image/*" = ["nomacs.desktop"];
  };

  programs.neovim = {
  enable = true;
#  plugins = with pkgs.vimPlugins; [
#  	nvim-treesitter
#	];
   extraConfig = ''
      set number
      set cc=80 
      set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
      if &diff
        colorscheme blue
      endif
    '';
};

  home.stateVersion = "23.05";
  programs.home-manager.enable = true;

  wayland.windowManager.hyprland.extraConfig = ''
  '';
  }
