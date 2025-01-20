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
        alt-w = "exec-and-forget $exec-and-forget osascript -e 'tell application \"Safari\" to activate'";
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

        alt-shift-1 = "move-node-to-workspace 1";
        alt-shift-2 = "move-node-to-workspace 2";
        alt-shift-3 = "move-node-to-workspace 3";
        alt-shift-4 = "move-node-to-workspace 4";
        alt-shift-5 = "move-node-to-workspace 5";
        alt-shift-6 = "move-node-to-workspace 6";
        alt-shift-7 = "move-node-to-workspace 7";
        alt-shift-8 = "move-node-to-workspace 8";
        alt-shift-9 = "move-node-to-workspace 9";

        alt-tab = "workspace-back-and-forth";
        alt-shift-tab = "move-workspace-to-monitor --wrap-around next";

        alt-shift-semicolon = "mode service";
      };

      # Default settings related to layouts and normalization
      default-root-container-layout = "tiles"; # 'tiles' or 'accordion'
      default-root-container-orientation = "auto"; # 'horizontal', 'vertical', 'auto'
      accordion-padding = 30;
      enable-normalization-flatten-containers = true;
      enable-normalization-opposite-orientation-for-nested-containers = true;

      # Commands for specific macOS behavior
      after-login-command = [];
      after-startup-command = [];
      start-at-login = false;

      # Mouse behavior when focus changes
      on-focused-monitor-changed = ["move-mouse monitor-lazy-center"];

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
