{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = ''

      @define-color color0 #${config.colorScheme.colors.base00};
      @define-color color1 #${config.colorScheme.colors.base01};
      @define-color color2 #${config.colorScheme.colors.base02};
      @define-color color3 #${config.colorScheme.colors.base03};
      @define-color color4 #${config.colorScheme.colors.base04};
      @define-color color5 #${config.colorScheme.colors.base05};
      @define-color color6 #${config.colorScheme.colors.base06};
      @define-color color7 #${config.colorScheme.colors.base07};
      @define-color color8 #${config.colorScheme.colors.base08};
      @define-color color9 #${config.colorScheme.colors.base09};
      @define-color color10 #${config.colorScheme.colors.base0A};
      @define-color color11 #${config.colorScheme.colors.base0B};
      @define-color color12 #${config.colorScheme.colors.base0C};
      @define-color color13 #${config.colorScheme.colors.base0D};
      @define-color color14 #${config.colorScheme.colors.base0E};
      @define-color color15 #${config.colorScheme.colors.base0F};


      * {


          font-family: "Fira Sans Semibold", FontAwesome, Roboto, Helvetica, Arial, sans-serif;
          border: none;
          border-radius: 0px;
      }

      window#waybar {
          background-color: rgba(0,0,0,0.8);
          border-bottom: 0px solid @color4;
          background: transparent;
          transition-property: background-color;
          transition-duration: .5s;
      }

      /* -----------------------------------------------------
       * Workspaces
       * ----------------------------------------------------- */

      #workspaces {
          background: @color4;
          margin: 2px 1px 3px 1px;
          padding: 0px 1px;
          border-radius: 15px;
          border:0px;
          font-weight: bold;
          font-style: normal;
          opacity:0.8;
          font-size:16px;
          color: @color4;
      }

      #workspaces button {
          padding: 1px 9px;
          margin: 3px 3px;
          border-radius: 15px;
          border:0px;
          color: @color4;
          background-color: @color3;
          transition: all 0.3s ease-in-out;
          opacity:0.4;
      }

      #workspaces button.active {
          color: @color4;
          background: @color3;
       border-radius: 15px;
          min-width: 40px;
          transition: all 0.3s ease-in-out;
          opacity:1.0;
      }

      #workspaces button.visible{
      	background: @color3;
      	opacity:1.0;
      }

      #workspaces button:hover {
          color: @color4;
          background: @color3;
          border-radius: 15px;
          opacity:0.7;
      }

      /* -----------------------------------------------------
       * Tooltips
       * ----------------------------------------------------- */

      tooltip {
          border-radius: 10px;
          background-color: @color7;
          opacity:0.8;
          padding:20px;
          margin:0px;
      }

      tooltip label {
          color: @color4;
      }

      /* -----------------------------------------------------
       * Window
       * ----------------------------------------------------- */

      #window {
          background: @color3;
          margin: 5px 15px 5px 0px;
          padding: 2px 10px 0px 10px;
          border-radius: 12px;
          color:@background;
          font-size:16px;
          font-weight:normal;
          opacity:0.8;
      }

      window#waybar.empty #window {
          background-color:transparent;
      }

      /* -----------------------------------------------------
       * Taskbar
       * ----------------------------------------------------- */

      #taskbar {
          background: @color3;
          margin: 3px 15px 3px 0px;
          padding:0px;
          border-radius: 15px;
          font-weight: normal;
          font-style: normal;
          opacity:0.8;
          border: 3px solid @color4;
      }

      #taskbar button {
          margin:0;
          padding: 0px 5px 0px 5px;
      }

      /* -----------------------------------------------------
       * Modules
       * ----------------------------------------------------- */

      .modules-left > widget:first-child > #workspaces {
          margin-left: 0;
      }

      .modules-right > widget:last-child > #workspaces {
          margin-right: 0;
      }

      /* -----------------------------------------------------
       * Custom Quicklinks
       * ----------------------------------------------------- */

       #custom-cliphist, #custom-notification {
          margin-right:20px;
          font-size:20px;
          font-weight:bold;
          opacity:0.8;
          color:@color4;
      }


      /* -----------------------------------------------------
       * Custom Modules
       * ----------------------------------------------------- */

      #custom-appmenu {
          background-color: @color3;
          font-size: 16px;
          color: @color4;
          border-radius: 15px;
          padding: 0px 10px 0px 10px;
          margin: 3px 15px 3px 14px;
          opacity:0.8;
          border:3px solid @color4;
      }

      /* -----------------------------------------------------
       * Custom Exit
       * ----------------------------------------------------- */

      #custom-exit {
          margin: 0px 15px 0px 0px;
          padding:0px;
          font-size:20px;
          color:@color4;
      }


      #custom-spotify {
      	margin-left:10px;
      	padding:0px;
      	font-size:16px;
      	color: @color4;
      }

      /* -----------------------------------------------------
       * Hardware Group
       * ----------------------------------------------------- */

      #disk,#memory,#cpu,#temperature {
          margin:0px;
          padding:0px;
          font-size:16px;
          color:@color4;
      }

      /* -----------------------------------------------------
       * Clock
       * ----------------------------------------------------- */

      #clock {
          background-color: @color3;
          font-size: 16px;
          color: @color4;
          border-radius: 15px;
          padding: 1px 10px 0px 10px;
          margin: 3px 15px 3px 0px;
          opacity:0.8;
          border:3px solid @color4;
      }


      #keyboard-state {
          /* background-color: @color3; */
          font-size: 16px;
          color: @color4;
          /* border-radius: 15px; */
          padding: 1px 10px 0px 10px;
          margin: 3px 15px 3px 0px;
          opacity:0.8;
          /* border:3px solid @color4; */
      }

      /* -----------------------------------------------------
       * Pulseaudio
       * ----------------------------------------------------- */

      #pulseaudio {
          background-color: @color3;
          font-size: 16px;
          color: @color4;
          border-radius: 15px;
      		border-color: @color4;
          padding: 2px 10px 0px 10px;
          margin: 5px 15px 5px 0px;
          opacity:0.8;
      		border: 3px solid @color4

      }

      #pulseaudio.muted {
          background-color: @color3;
          color: @color4;
      }

      /* -----------------------------------------------------
       * Network
       * ----------------------------------------------------- */

      #network {
          background-color: @color3;
          font-size: 16px;
          color: @color4;
          border-radius: 15px;
          padding: 2px 10px 0px 10px;
          margin: 3px 10px 3px 0px;
          opacity:0.8;
          border: 3px solid @color4
      }

      #network.ethernet {
          background-color: @color3;
          color:@color4;
      }

      #network.wifi {
          background-color: @color3;
          color:@color4;
      }

      /* -----------------------------------------------------
       * Bluetooth
       * ----------------------------------------------------- */

      #bluetooth.on, #bluetooth.connected {
          background-color: @color3;
          font-size: 16px;
          color: @color4;
          border-radius: 15px;
          padding: 2px 10px 0px 10px;
          margin: 5px 15px 5px 0px;
          opacity:0.8;
          border:3px solid @color4;
      }

      #bluetooth.off {
          background-color: transparent;
          padding: 0px;
          margin: 0px;
      }

      /* -----------------------------------------------------
       * Battery
       * ----------------------------------------------------- */

      #battery {
          background-color: @color3;
          font-size: 16px;
          color: @color4;
          border-radius: 15px;
          padding: 2px 15px 0px 10px;
          margin: 5px 15px 5px 0px;
          opacity:0.8;
          border:3px solid @color4;
      }

      #battery.charging, #battery.plugged {
          color: @color6;
          background-color: @color3;
      }

      @keyframes blink {
          to {
              background-color: @color6;
              color: @color0;
          }
      }

      #battery.critical:not(.charging) {
          background-color: @color8;
          color: @color6;
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
      }

      /* -----------------------------------------------------
       * Tray
       * ----------------------------------------------------- */

      #tray {
          background-color: @color3;
      		background: @color3;
          font-size: 16px;
          color: @color6;
          border-radius: 15px;
          padding: 1px 10px 0px 10px;
          margin: 3px 15px 3px 0px;
          opacity:0.8;
          border:3px solid @color4;
      }

      #tray > .passive {
          -gtk-icon-effect: dim;
      }

      #tray > .needs-attention {
          -gtk-icon-effect: highlight;
          background-color: @color8;
      }

      /* -----------------------------------------------------
       * Other
       * ----------------------------------------------------- */

      label:focus {
          background-color: @color0;
      }

      #backlight {
          background-color: @color3;
          font-size: 16px;
          color: @color4;
          border-radius: 15px;
          padding: 2px 15px 0px 10px;
          margin: 5px 15px 5px 0px;
          opacity:0.8;
          border:3px solid @color4;
      }

      #network {
          background-color: @color3;
      }

      #network.disconnected {
          background-color: @color8;
      }
    '';
    settings = [
      {
        height = 16;
        layer = "top";
        position = "bottom";
        margin-top = 0;
        margin-bottom = 14;
        margin-left = 0;
        margin-right = 0;
        spacing = 0;

        modules-left = [
          "custom/spotify"
        ];

        modules-right = [
          "disk"
          "cpu"
          "memory"
          "temperature"
          "keyboard-state"
        ];

        "group/quicklinks" = {
          "orientation" = "horizontal";
          "modules" = [
            "custom/filemanager"
            "custom/brave"
          ];
        };
        "custom/spotify" = {
          "format" = "{} ";
          "exec" = "~/.config/waybar/scripts/mediaplayer.sh";
          "return-type" = "json";
          "on-click" = "playerctl -p spotify play-pause";
          "on-scroll-up" = "playerctl -p spotify next";
          "on-scroll-down" = "playerctl -p spotify previous";
          "exec-if" = "pgrep spotfiy";
        };

        "cpu" = {
          "format" = " 󰍛 {usage}% ";
          "on-click" = "alacritty -e htop";
        };

        "memory" = {
          "format" = "   {}% ";
          "on-click" = "alacritty -e htop";
        };

        "disk" = {
          "interval" = 30;
          "format" = "   {percentage_used} %";
          "path" = "/";
          "on-click" = "alacritty -e htop";
        };
        # // Keyboard State
        "keyboard-state" = {
          "numlock" = true;
          "capslock" = false;
          "format" = "{icon}";
          "format-icons" = {
            "locked" = "";
            "unlocked" = "";
          };
        };

        "temperature" = {
          "hwmon-path" = ["/sys/class/hwmon/hwmon2/temp1_input" "/sys/class/thermal/thermal_zone0/temp"];
          "format" = "  {temperatureC}°C ";
        };
      }
      {
        height = 16;
        layer = "top";
        position = "top";
        margin-top = 14;
        margin-bottom = 0;
        margin-left = 0;
        margin-right = 0;
        spacing = 0;
        modules-center = ["hyprland/workspaces"];
        modules-left = ["custom/appmenu" "wlr/taskbar" "hyprland/window"];
        modules-right = [
          "pulseaudio"
          "bluetooth"
          "battery"
          "backlight"
          "custom/cliphist"
          "network"
          "sway/language"
          "tray"
          "clock"
          "custom/notification"
          "custom/exit"
        ];

        "hyprland/workspaces" = {
          "on-click" = "activate";
          "active-only" = false;
          "all-outputs" = false;
          "format" = "{}";
          "format-icons" = {
            "urgent" = "";
            "active" = "";
            "default" = "";
          };
        };

        "wlr/taskbar" = {
          "format" = "{icon}";
          "icon-size" = 18;
          "tooltip-format" = "{title}";
          "on-click" = "activate";
          "on-click-middle" = "close";
          "ignore-list" = [
            "kitty"
          ];
          "app_ids-mapping" = {
            "firefoxdeveloperedition" = "firefox-developer-edition";
          };
          "rewrite" = {
            "Firefox Web Browser" = "Firefox";
            "Foot Server" = "Terminal";
          };
        };

        # // Hyprland Window
        "hyprland/window" = {
          "rewrite" = {
            "(.*) - Brave" = "$1";
            "(.*) - Chromium" = "$1";
            "(.*) - Brave Search" = "$1";
            "(.*) - Outlook" = "$1";
            "(.*) Microsoft Teams" = "$1";
          };
          "separate-outputs" = true;
        };

        # // Cliphist
        "custom/cliphist" = {
          "format" = "";
          "on-click" = "sleep 0.1 && bash ~/nixOS/scripts/cliphist.sh";
          "on-click-right" = "sleep 0.1 && bash ~/nixOS/scripts/cliphist.sh d";
          "on-click-middle" = "sleep 0.1 && bash ~/nixOS/scripts/cliphist.sh w";
          "tooltip" = false;
        };

        "custom/notification" = {
          "tooltip" = false;
          "format" = "{icon}";
          "format-icons" = {
            "notification" = "<span foreground='red'><sup></sup></span>";
            "none" = "";
            "dnd-notification" = "<span foreground='red'><sup></sup></span>";
            "dnd-none" = "";
            "inhibited-notification" = "<span foreground='red'><sup></sup></span>";
            "inhibited-none" = "";
            "dnd-inhibited-notification" = "<span foreground='red'><sup></sup></span>";
            "dnd-inhibited-none" = "";
          };
          "return-type" = "json";
          "exec-if" = "which swaync-client";
          "exec" = "swaync-client -swb";
          "on-click" = "swaync-client -t -sw";
          "on-click-right" = "swaync-client -d -sw";
          "escape" = true;
        };

        # // Rofi Application Launcher
        "custom/appmenu" = {
          "format" = " ";
          "on-click" = "bash ~/nixOS/scripts/rofi_drun.sh";
          "tooltip" = false;
        };

        # // Power Menu
        "custom/exit" = {
          "format" = "";
          "on-click" = "wlogout";
          "tooltip" = false;
        };

        "tray" = {
          "spacing" = 10;
        };

        "clock" = {
          "tooltip-format" = "<big>{=%Y %B}</big>\n<tt><small>{calendar}</small></tt>"; #todo string wrong
          "format-alt" = "{=%Y-%m-%d}";
        };

        "network" = {
          "format" = "{ifname}";
          "format-wifi" = "   {signalStrength}%";
          "format-ethernet" = "󰈀  {ipaddr}";
          "format-disconnected" = "";
          "tooltip-format" = " {ifname} via {gwaddri}";
          "tooltip-format-wifi" = "   {essid} ({signalStrength}%)";
          "tooltip-format-ethernet" = "  {ifname} ({ipaddr}/{cidr})";
          "tooltip-format-disconnected" = "Disconnected";
          "max-length" = 50;
        };

        "battery" = {
          "states" = {
            "warning" = 30;
            "critical" = 15;
          };
          "format" = "{icon}   {capacity}%";
          "format-charging" = "󰂄  {capacity}%";
          "format-plugged" = "󱟢 {capacity}%";
          "format-alt" = "{icon}  {time}";
          "format-icons" = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂂" "󰁹"];
        };

        # Pulseaudio
        "pulseaudio" = {
          "format" = "{icon} {volume}% {format_source}";
          "format-bluetooth" = "{volume}% {icon} {format_source}";
          "format-bluetooth-muted" = "󰝟 {icon} {format_source}";
          "format-muted" = "󰝟 {format_source}";
          "format-source" = "{volume}% ";
          "format-source-muted" = "";
          "format-icons" = {
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = ["" "" " "];
          };
          "on-click" = "pavucontrol";
        };

        "backlight" = {
          "format" = "{icon} {percent}%";
          "format-icons" = {
            "default" = [" "];
          };
          "on-click" = "pavucontrol";
        };

        "bluetooth" = {
          "format" = "󰂯";
          "format-connected" = "󰂱";
          "format-disabled" = "";
          "format-off" = "󰂲";
          "interval" = 30;
          "on-click" = "blueman-manager";
        };
      }
    ];
  };
}
