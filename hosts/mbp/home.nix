{
  pkgs,
  lib,
  userSet,
  ...
}: let
  userName = userSet.userName;
  home = "/Users/${userName}";
in {
  imports = [
    #../../modules/kitty.nix
    ../../modules/fish.nix
    ../../modules/zsh.nix
    ../../modules/git.nix
    #../../modules/zathura.nix
    #../../modules/vscode.nix
    ../../modules/neovim.nix
  ];

  home.homeDirectory = lib.mkForce home;
  home.username = userName;

  home.file = {

    "${home}/.config/sketchybar".source = ../../modules/sketchybar;
    "${home}/.hammerspoon".source = ../../modules/hammerspoon;
  };

  home.stateVersion = "23.05";

  # users.users.${userName} = {
  #   name = "${userName}";
  #   home = "/Users/${userName}";
  #   isHidden = false;
  #   shell = pkgs.fish;
  # };

  programs.home-manager = {
    enable = true;
  };

  # home-manager.users.luca = {
  #   home.packages = with pkgs; [
  #     homebrew
  #   ];
  # };

  # homebrew = {
  #   enable = false;
  #   casks = [
  #     "spotify"
  #     "firefox"
  #   ];
  # };

  programs.alacritty = {
    enable = true;
    # settings = {
    # terminal.shell = {
    # program = "${pkgs.fish}/bin/fish";
    # args = ["starship init fish | source"];
    # };
    # };
  };

  stylix = {
    targets.neovim.enable = false;
  #   # base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
  #   # fonts = {
  #   #   monospace = {
  #   #     package = pkgs.nerdfonts.override {fonts = ["FiraCode"];};
  #   #     name = "FiraCode Nerd Font Mono";
  #   #   };
  #   #   sansSerif = {
  #   #     package = pkgs.fira;
  #   #     name = "Fira Sans Medium";
  #   #   };
  #   #   serif = {
  #   #     package = pkgs.dejavu_fonts;
  #   #     name = "DejaVu Serif";
  #   #   };
  #   #   sizes = {
  #   #     applications = 10;
  #   #     terminal = 20;
  #   #     desktop = 8;
  #   #     popups = 10;
  #   #   };
  #   # };
  #   opacity = {
  #     applications = 1.0;
  #     terminal = 0.9;
  #     desktop = 0.0;
  #     popups = 1.0;
  #   };
  };

  programs.fish = {
    shellAbbrs = {
      rebuild = "darwin-rebuild  switch --flake /Users/luca/nixOS#Lucas-MacBook-Pro";
      update = lib.mkForce "nix flake update /Users/luca/nixOS";
      home = lib.mkForce "nvim /Users/luca/nixOS/hosts/mbp/home.nix";
      config = lib.mkForce "nvim /Users/luca/nixOS/hosts/mbp/configuration.nix";
      aero = lib.mkForce "nvim /Users/luca/nixOS/modules/aerospace.nix";
      flake = lib.mkForce "nvim /Users/luca/nixOS/flake.nix";
    };
  };

  # xdg.configFile."kitty".source = ./modules/kitty;
  xdg.configFile."/home/luca/texmf/tex/latex/commonstuff/pakete.sty".source = ../../modules/tex/pakete.sty;
  xdg.configFile."/home/luca/texmf/tex/bibtex/bib/refs.bib".source = ../../modules/tex/refs.bib;
  xdg.configFile."/home/luca/texmf/tex/latex/commonstuff/template_xournalpp.tex".source = ../../modules/tex/template_xournalpp.tex;
  xdg.configFile."nvim/lua".source = ../../modules/nvim/lua;
  xdg.configFile."nvim/after".source = ../../modules/nvim/after;
  xdg.configFile."vifm/vifmrc".source = ../../modules/vifm/vifmrc;
  xdg.configFile."vifm/colors/nord.vifm".source = ../../modules/vifm/nord.vifm;
}
