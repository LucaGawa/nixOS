{
  config,
  pkgs,
  stable,
  inputs,
  userSet,
  ...
}: let
  userName = userSet.userName;
  # customIcons = import ./icons.nix { inherit pkgs; };
in {
  nixpkgs.config.allowUnfree = true;
  home.username = userName;

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
  };

  # todo find out, why this gives an stack overflow error in the hyprland modul
  wayland.windowManager.hyprland.plugins = [
    inputs.Hyprspace.packages.x86_64-linux.Hyprspace
    # inputs.Hyprspace.packages.x86_64-linux.Hyprspace
<<<<<<< HEAD
    # inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
=======
>>>>>>> refs/remotes/origin/master
    # inputs.hyprland-plugins.packages.${pkgs.system}.hyprexpo
  ];

  home.stateVersion = "23.05";
  programs.home-manager = {
    enable = true;
    # backupFileExtension = true;
  };

  xdg.configFile."waybar/scripts".source = ./modules/waybar/scripts;
  xdg.configFile."swaync".source = ./modules/swaync;
  # xdg.configFile."kitty".source = ./modules/kitty;
  xdg.configFile."wlogout".source = ./modules/wlogout;
  xdg.configFile."/home/luca/texmf/tex/latex/commonstuff/pakete.sty".source = ./modules/tex/pakete.sty;
  xdg.configFile."/home/luca/texmf/tex/bibtex/bib/refs.bib".source = ./modules/tex/refs.bib;
  xdg.configFile."/home/luca/texmf/tex/latex/commonstuff/template_xournalpp.tex".source = ./modules/tex/template_xournalpp.tex;
  xdg.configFile."xournalpp/toolbar.ini".source = ./modules/xournalpp/toolbar.ini;
  xdg.configFile."xournalpp/settings.xml".source = ./modules/xournalpp/settings.xml;
  xdg.configFile."xournalpp/palette.gpl".source = ./modules/xournalpp/palette.gpl;
  # xdg.configFile."rofi".source = ./modules/rofi;
  xdg.configFile."Code/User/keybindings.json".source = ./modules/code/keybindings.json;
  # xdg.configFile."Code/User/settings.json".source = ./modules/code/settings.json;
  xdg.configFile."Thunar/uca.xml".source = ./modules/thunar/uca.xml;
  xdg.configFile."nvim/lua".source = ./modules/nvim/lua;
  xdg.configFile."nvim/after".source = ./modules/nvim/after;
  xdg.configFile."OpenTabletDriver/settings.json".source = ./modules/opentablet/settings.json;
  xdg.configFile."vifm/vifmrc".source = ./modules/vifm/vifmrc;
  xdg.configFile."vifm/colors/nord.vifm".source = ./modules/vifm/nord.vifm;
}
