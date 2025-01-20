{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../../modules/kitty.nix
    ../../modules/fish.nix
    ../../modules/git.nix
    ../../modules/zathura.nix
    ../../modules/vscode.nix
    ../../modules/neovim.nix
  ];

  home.homeDirectory = lib.mkForce "/Users/luca";
 
  #stylix = enable = true;
  #stylix = {
#   base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
#   fonts = {
#     monospace = {
#       package = pkgs.nerdfonts.override {fonts = ["FiraCode"];};
#       name = "FiraCode Nerd Font Mono";
#     };
#     sansSerif = {
#       package = pkgs.fira;
#       name = "Fira Sans Medium";
#     };
#     serif = {
#       package = pkgs.dejavu_fonts;
#       name = "DejaVu Serif";
#     };
#     sizes = {
#       applications = 10;
#       terminal = 14;
#       desktop = 8;
#       popups = 10;
#     };
#   };
#   opacity = {
#     applications = 1.0;
#     terminal = 0.9;
#     desktop = 0.0;
#     popups = 1.0;
#   };
# };
#
  programs.fish = {
    shellAbbrs = {
      rebuild = "sudo darwin-rebuild  switch --flake /Users/luca/nixOS/hosts/mac/#luca";
      update = lib.mkForce "sudo nix flake update /Users/luca/nixOS/hosts/mac/";
    };
  };
}
