{
  imports = [
    ../../modules/hyprland/hyprland.nix
    ../../modules/waybar.nix
    ../../modules/kitty.nix
    ../../modules/avizo.nix
    ../../modules/xremap.nix
    ../../modules/rofi/rofi.nix
    ../../modules/fish.nix
    ../../modules/git.nix
    ../../modules/zathura.nix
    ../../modules/vscode.nix
    ../../modules/theming.nix
    ../../modules/fonts.nix
    ../../modules/mimeapps.nix
    ../../modules/neovim.nix
  ];
  wayland.windowManager.hyprland = {
    settings = {
      monitor = [
        "eDP-1,2560x1600@240,2560x438,1.6,"
        "DP-4, 3840x2160, 0x0, 1.5"
      ];
      bind = [
        "$mainMod, z, exec, xournalpp"
      ];
    };
  };

  programs.fish = {
    shellAbbrs = {
      rebuild = "sudo nixos-rebuild switch --flake ~/nixOS/#laptop";
    };
  };
}
