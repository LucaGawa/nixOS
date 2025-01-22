{pkgs, ...}: {
  services.aerospace = {
    enable = true;

    settings = {
      # Your existing gap settings
      gaps = {
        inner.horizontal = 8;
        inner.vertical = 8;
        outer.left = 8;
        outer.bottom = 8;
        outer.top = 8;
        outer.right = 8;
      };

      # Keybindings in "main" mode (your custom bindings)
      mode.main.binding = {
        alt-h = "focus left";
        alt-j = "focus down";
        alt-k = "focus up";
        alt-l = "focus right";
        alt-enter = "exec-and-forget ${pkgs.alacritty}/bin/alacritty";
        alt-w = "exec-and-forget open -n /Applications/Safari.app";
        # alt-e = "exec-and-forget open -n /Users/luca/";
        alt-m = "exec-and-forget open -n /Applications/Wolfram.app";
        alt-c = "exec-and-forget open -n /Applications/ChatGPT.app";
        alt-f = "fullscreen";
        alt-s = "layout tiles horizontal vertical";
        alt-q = "close --quit-if-last-window";

        alt-ctrl-h = "resize width -50";
        alt-ctrl-l = "resize width +50";

        alt-shift-h = "move left";
        alt-shift-j = "move down";
        alt-shift-k = "move up";
        alt-shift-l = "move right";

        # Adding additional default keybindings from the default .toml
        alt-slash = "layout tiles horizontal vertical";
        alt-comma = "layout accordion horizontal vertical";

        alt-minus = "resize smart -50";
        alt-equal = "resize smart +50";

        # Workspace switcher keybindings (as per the default .toml)
        alt-1 = "workspace 1";
        alt-2 = "workspace 2";
        alt-3 = "workspace 3";
        alt-4 = "workspace 4";
        alt-5 = "workspace 5";
        alt-6 = "workspace 6";
        alt-7 = "workspace 7";
        alt-8 = "workspace 8";
        alt-9 = "workspace 9";
        alt-0 = "workspace 10";

        alt-shift-1 = "move-node-to-workspace 1 --focus-follows-window";
        alt-shift-2 = "move-node-to-workspace 2 --focus-follows-window";
        alt-shift-3 = "move-node-to-workspace 3 --focus-follows-window";
        alt-shift-4 = "move-node-to-workspace 4 --focus-follows-window";
        alt-shift-5 = "move-node-to-workspace 5 --focus-follows-window";
        alt-shift-6 = "move-node-to-workspace 6 --focus-follows-window";
        alt-shift-7 = "move-node-to-workspace 7 --focus-follows-window";
        alt-shift-8 = "move-node-to-workspace 8 --focus-follows-window";
        alt-shift-9 = "move-node-to-workspace 9 --focus-follows-window";
        alt-shift-0 = "move-node-to-workspace 10 --focus-follows-window";

        cmd-h = "focus-monitor left";
        cmd-j = "focus-monitor down";
        cmd-k = "focus-monitor up";
        cmd-l = "focus-monitor right";

        cmd-shift-h = "move-node-to-monitor left --focus-follows-window";
        cmd-shift-j = "move-node-to-monitor down --focus-follows-window";
        cmd-shift-k = "move-node-to-monitor up --focus-follows-window";
        cmd-shift-l = "move-node-to-monitor right --focus-follows-window";

        # cmd-h = []; # Disabel "hide application"
        cmd-alt-h = []; # Disable "hide others"

        alt-tab = "workspace-back-and-forth";
        alt-shift-tab = "move-workspace-to-monitor --wrap-around next ";

        alt-shift-semicolon = "mode service";
      };

      mode.service.binding = {
        esc = ["reload-config" "mode main"];
        alt-shift-h = ["join-with left" "mode main"];
        alt-shift-j = ["join-with down" "mode main"];
        alt-shift-k = ["join-with up" "mode main"];
        alt-shift-l = ["join-with right" "mode main"];
        # alt-h = ["split horizontal" "mode main"];
        # alt-j = ["split vertical" "mode main"];
        # alt-k = ["split vertical" "mode main"];
        # alt-l = ["split horizontal" "mode main"];
      };

      workspace-to-monitor-force-assignment = {
        "1" = 2;
        "2" = 2;
        "3" = 2;
        "4" = 2;

        "5" = 1;
        "6" = 1;
        "7" = 1;

        "8" = 3;
        "9" = 3;
        "10" = 3;

        # "1" = ["2" "1"];
        # "2" = [2 1];
        # "3" = [2 1];
        #
        # "4" = 1;
        # "5" = 1;
        # "6" = 1;
        # "7" = 1;
        #
        # "8" = [3 2 1];
        # "9" = [3 2 1];
        # "10" = ["3" 2 1];
      };
      # Default settings related to layouts and normalization
      default-root-container-layout = "tiles"; # 'tiles' or 'accordion'
      default-root-container-orientation = "auto"; # 'horizontal', 'vertical', 'auto'
      accordion-padding = 50;
      enable-normalization-flatten-containers = true;
      enable-normalization-opposite-orientation-for-nested-containers = true;

      # Commands for specific macOS behavior
      after-login-command = [];
      after-startup-command = ["exec-and-forget sketchybar"];
      #   exec-on-workspace-change = ["/bin/bash -c
      # # sketchybar --trigger aerospace_workspace_change FOCUSED_WORKSPACE=$AEROSPACE_FOCUSED_WORKSPACE"];
      # start-at-login = true;

      # Mouse behavior when focus changes
      # on-focused-monitor-changed = ["move-mouse, monitor-lazy-center"];

      # macOS behavior for hiding apps
      automatically-unhide-macos-hidden-apps = false;

      # Key-mapping preset (qwerty or dvorak)
      key-mapping = {
        preset = "qwerty";
      };

      # Window and focus behavior settings (additional settings from the default .toml)
      # window = {
      #   auto_tile = true; # Automatically tile new windows
      #   focus_on_click = true; # Focus window on click
      #   raise_on_focus = true; # Raise window when focused
      # };

      # Border settings
      # border = {
      #   width = 2; # Border width for windows
      #   color = "#00FF00"; # Border color (e.g., green in this case)
      #   focused = "#FF00FF"; # Border color for focused windows
      # };
      #
      # # Miscellaneous options
      # misc = {
      #   click_to_focus = true; # Focus window by clicking
      #   center_on_new_window = true; # Center new windows when created
      # };
    };
  };
}
