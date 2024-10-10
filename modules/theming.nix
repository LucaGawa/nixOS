{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nix-colors.homeManagerModules.default
  ];
  colorScheme = inputs.nix-colors.colorSchemes.nord;
  # colorScheme = {
  #   slug = "pasque";
  #   name = "Pasque";
  #   author = "Gabriel Fontes (https://github.com/Misterio77)";
  #   palette = {
  #     base00 = "#271C3A";
  #     base01 = "#100323";
  #     base02 = "#3E2D5C";
  #     base03 = "#5D5766";
  #     base04 = "#BEBCBF";
  #     base05 = "#DEDCDF";
  #     base06 = "#EDEAEF";
  #     base07 = "#BBAADD";
  #     base08 = "#A92258";
  #     base09 = "#918889";
  #     base0A = "#804ead";
  #     base0B = "#C6914B";
  #     base0C = "#7263AA";
  #     base0D = "#8E7DC6";
  #     base0E = "#953B9D";
  #     base0F = "#59325C";
  #   };
  # };

  gtk = {
    enable = true;
    # cursorTheme = {
    #   package = pkgs.nordzy-cursor-theme;
    #   name = "Nordzy-cursors";
    #   size = 24;
    # };
    # font = {
    #   package = pkgs.nerdfonts.override {fonts = ["Mononoki"];};
    #   name = "Mononoki Nerd Font Regular";
    #   size = 18;
    # };
    iconTheme = {
      # (pkgs.catppuccin-papirus-folders.override { flavor = "mocha"; accent = "peach"; })
      package = pkgs.nordzy-icon-theme.override {nordzy-themes = ["all"];};
      name = "Nordzy";
    };
    # theme = {
    # package = (pkgs.catppuccin-gtk.override { accents = [ "peach" ]; size = "standard"; variant = "mocha"; });
    # name = "Catppuccin-Mocha-Standard-Peach-Dark";
    # };
    # theme = {
    #   package = pkgs.nordic;
    #   name = "Nordic";
    # };
  };

  # qt = {
  #   enable = true;
  #   platformTheme.name = "gtk";
  #   # style.name = "gtk";
  #   style = {
  #     name = "adwaita-dark";
  #     package = pkgs.adwaita-qt;
  #   };
  # };
}
