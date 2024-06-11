{ pkgs, lib, ... }: {
  imports = [
  ../../modules/kitty.nix
  ../../modules/fish.nix
  ../../modules/git.nix
  ../../modules/zathura.nix
  ../../modules/vscode.nix
  ../../modules/neovim.nix
  ];

  home.homeDirectory = lib.mkForce "/Users/luca";

}

