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
        "eDP-1,2560x1600,2560x0,1"
        "DP-4, 1920x1080, 0x0, 0.75"
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
