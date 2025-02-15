{
  config,
  pkgs,
  userSet,
  ...
}: let
  userName = userSet.userName;
in {
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
    # ../../modules/nvf.nix
  ];

  home.homeDirectory = "/home/" + userName;

  wayland.windowManager.hyprland = {
    settings = {
      "exec-once" = [
        "[workspace 10 silent;fullscreen] spotify"
        "[workspace 9 silent] thunderbird rambox"
        # "[workspace 9 silent] rambox"
      ];

      monitor = [
        "DP-1,preferred,5360x600,1, transform,1"
        "DP-2,preferred,0x1255,1"
        "HDMI-A-3,preferred,2747x0,1"
        "DP-3,preferred,1920x1080,1"
      ];
      workspace = [
        "10, monitor:HDMI-A-3, default:true"
        "1, monitor:DP-3, default:true"
        "8, monitor:DP-1, default:true"
        "5, monitor:DP-2, default:true"
        "9, monitor:DP-2, default:false"
      ];
      bind = [
        "$mainMod, z, exec, [monitor DP-3] xournalpp"
        "$mainMod, s, exec, [workspace 10 silent;fullscreen] spotify"
      ];
    };
  };
  programs.fish = {
    shellAbbrs = {
      rebuild = "sudo nixos-rebuild switch --flake ~/nixOS/#desktop";
      update = "sudo nix flake update ~/nixOS/";
    };
  };
}
