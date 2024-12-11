{
  config,
  pkgs,
  inputs,
  pkgs-stable,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    # package = pkgs-stable.hyprland;
    settings = {
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
      "$mainMod" = "SUPER";

      bind = [
        "$mainMod, RETURN, exec, kitty"
        "$mainMod, Q, killactive"
        "$mainMod, M, exec, Wolfram"
        "$mainMod, E, exec, thunar"
        "$mainMod, W, exec, firefox"
        "$mainMod, S, exec, spotify"
        "$mainMod, c, exec, brave --app=https://chat.openai.com"
        "$mainMod, V, togglefloating"
        "$mainMod, R, exec, wofi --show drun"
        "$mainMod, P, pseudo" # dwindle
        "$mainMod, SPACE, togglesplit" # dwindle
        "$mainMod, F, fullscreen, 1" #maximize
        "$mainMod SHIFT, F, fullscreen" #fullscreen
        "$mainMod, X, exec, wlogout"
        "$mainMod SHIFT, RETURN, exec, bash ~/nixOS/scripts/rofi_drun.sh"
        "$mainMod SHIFT, R, exec, bash ~/nixOS/scripts/reload.sh"
        "$mainMod, B, exec, pkill waybar || waybar"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Change focus of Monitor
        # "$mainMod ALT, 1, focusonmonitor, 1"
        # "$mainMod ALT, 2, focusonmonitor, 2"
        # "$mainMod ALT, 3, focusonmonitor, 3"
        # "$mainMod ALT, 4, focusonmonitor, 4"

        # Cycle through Monitors
        "$mainMod, Tab, focusmonitor, +1"
        "$mainMod SHIFT, Tab, focusmonitor, -1"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        # ## Screenshot
        ", Print, exec, grimshot --notify save active" # All visible outputs
        "SHIFT, Print, exec, grimshot --notify save area" # All visible outputs
        # "SHIFT Print, exec, grimshot --notify save area $(~/Pictures/$(TZ=utc date +'screenshot_%Y-%m-%d-%H%M%S.%3N.png')" # Manually select a region
        # "Alt+Print exec ${grimshot} --notify save active $(${xdg-user-dir} PICTURES)/$(TZ=utc date +'screenshot_%Y-%m-%d-%H%M%S.%3N.png')"; # Currently active window
        # "Shift+Alt+Print" = "exec ${grimshot} --notify save window $(${xdg-user-dir} PICTURES)/$(TZ=utc date +'screenshot_%Y-%m-%d-%H%M%S.%3N.png')"; # Manually select a window
        # "Ctrl+Print" = "exec ${grimshot} --notify copy screen";
        # "Ctrl+Shift+Print" = "exec ${grimshot} --notify copy area";
        # "Ctrl+Alt+Print" = "exec ${grimshot} --notify copy active";
        # "Ctrl+Shift+Alt+Print" = "exec ${grimshot} --notify copy window";
      ];
      # bindings with repetition
      binde = [
        # Move focus
        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, K , movefocus, u"
        "$mainMod, J, movefocus, d"

        # Resize active Window
        "$mainMod CONTROL, l, resizeactive, 10 0"
        "$mainMod CONTROL, h, resizeactive, -10 0"
        "$mainMod CONTROL, k, resizeactive, 0 -10"
        "$mainMod CONTROL, j, resizeactive, 0 10"

        # move active window
        "$mainMod SHIFT, l, movewindow, r"
        "$mainMod SHIFT, h, movewindow, l"
        "$mainMod SHIFT, k, movewindow, u"
        "$mainMod SHIFT, j, movewindow, d"

        # Multimedia Keys
        ",XF86AudioRaiseVolume, exec, volumectl -u up"
        ",XF86AudioLowerVolume, exec, volumectl -u down"
        ",XF86AudioMute, exec, volumectl toggle-mute"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86MonBrightnessUp, exec, brightnessctl set +5%"
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        # "col.inactive_border" = "rgba(${config.colorScheme.colors.base03}ff)";
        # "col.active_border" = "rgba(${config.colorScheme.colors.base07}ff)";
        layout = "dwindle";
        resize_on_border = true;
      };
      # See https://wiki.hyprland.org/Configuring/Keywords/ for more
      exec-once = [
        # "wal -i '~/nixOS/wallpaper/nordic-mountain-wallpaper.jpg'"
        # "waybar"
        # "waybar -c ~/.config/waybar/config_bottom"
        # "wal -R"
        "swaybg -i ~/nixOS/wallpaper/nordic-mountain-wallpaper.jpg"
        "nm-applet --indicator &"
        "swaync"
        "wl-paste --watch cliphist store"
        "sleep 1; owncloud"
        "rclone mount --network-mode Gdrive:/ ~/Gdrive/"
        "bash ~/nixOS/scripts/read_cursor_theme.sh"
        "lxqt-policykit-agent"
        "avizo-service"
        # "sleep5; bash ~/nixOS/scripts/reload.sh"
      ];

      input = {
        kb_layout = "us";
        kb_variant = "altgr-intl";
        # kb_model =
        kb_options = "nodeadkeys";
        # kb_rules =

        follow_mouse = 1;

        numlock_by_default = true;
        touchpad = {
          natural_scroll = "yes";
        };
        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
      };
      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };

      decoration = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more

        rounding = 10;
        #  blur = yes
        #  blur_size = 3
        #  blur_passes = 1
        #  blur_new_optimizations = on

        # drop_shadow = false;
        # shadow_range = 4;
        # shadow_render_power = 3;
        # "col.shadow" = "rgba(1a1a1aee)";
      };

      animations = {
        enabled = true;

        # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        # new_is_master = true;
        new_status = "master";
      };

      gestures = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more
        workspace_swipe = true;
      };

      env = [
        "WLR_NO_HARDWARE_CURSORS,1"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
      ];
    };
  };
}
