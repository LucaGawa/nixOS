{
  config,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    settings = {
      "exec-once" = [
        "[workspace 10 silent;fullscreen] spotify"
        "[workspace 9 silent] thunderbird rambox"
        # "[workspace 9 silent] rambox"
      ];

      monitor = [
        "DP-1,preferred,0x1080,1"
        "DP-3,preferred,850x2520,1"
        "DP-2,preferred,3440x1190,1"
        "HDMI-A-3,preferred,2130x0,1"
      ];
      workspace = [
        "1, monitor:DP-1, default:true"
        "10, monitor:HDMI-A-3, default:true"
        "8, monitor:DP-3, default:true"
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
