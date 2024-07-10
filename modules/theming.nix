{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nix-colors.homeManagerModules.default
  ];
  colorScheme = inputs.nix-colors.colorSchemes.nord;
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

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    # style.name = "gtk";
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };
}
