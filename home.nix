{ config, pkgs, ... }:

{
 home.username = "luca";
 home.homeDirectory = "/home/luca";

 home.packages = with pkgs; [
  # htop
];

 home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "brave";
  };

 
  #xsession.numlock.enable = true;

  home.file = {

  };

  programs.git = {
    enable = true;
    userName = "Luca Gawalleck";
    userEmail = "luca.gawalleck@gmail.com";
    aliases = {
      pu = "push";
      co = "checkout";
      cm = "commit -m";
    };
  };

programs.vscode = {
  enable = true;
  extensions = with pkgs.vscode-extensions; [
    #dracula-theme.theme-dracula
    vscodevim.vim
    yzhang.markdown-all-in-one
    james-yu.latex-workshop
  ];
};



  #############################################
  ############# THEMING #######################
  #############################################
  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Classic";
    };
    theme = {
      package = pkgs.adw-gtk3;
      name = "adw-gtk3";
    };
    iconTheme = {
      package = pkgs.deepin.deepin-icon-theme;
      name = "deepin-icon-theme";
    };
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
    style.name = "gtk";
    # style = {
    #  name = "adwaita-dark";
    #  package = pkgs.adwaita-qt;
    # };
  };

  xdg.mimeApps.defaultApplications = {
    "text/plain" = ["mousepad.desktop"];
    "text/tex" = ["mousepad.desktop"];
    "application/pdf" = ["evince.desktop"];
    "image/*" = ["nomacs.desktop"];
  };

  programs.neovim = {
  enable = true;
  plugins = with pkgs.vimPlugins; [
  	nvim-treesitter.withAllGrammars
	vim-commentary
	nvim-tree-lua
	coc-pyright
	# vim-latex-live-preview
	vimtex
	# luasnip
	deoplete-nvim
  ];
   extraConfig = ''
   	packadd! nvim-tree.lua
	lua require("nvim-tree").setup()
	autocmd FileType nix setlocal commentstring=#\ %s
      	set number
      	set cc=80 
      	set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
      	if &diff
        	colorscheme blue
      	endif
      	" This is necessary for VimTeX to load properly. The "indent" is optional.
	" Note that most plugin managers will do this automatically.
	filetype plugin indent on

	" This enables Vim's and neovim's syntax-related features. Without this, some
	" VimTeX features will not work (see ":help vimtex-requirements" for more
	" info).
	syntax enable
	" Use Zathura as the default VimTeX PDF viewer
	let g:vimtex_view_method = 'zathura'
    '';
};

  programs.fish = {
	enable = true;
	interactiveShellInit = ''
		if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

set fish_greeting

### EXPORT ###
set -x EDITOR nvim 
set -x VISUAL nvim
set -x HISTCONTROL ignoreboth:erasedups
set -x PAGER most
set -x BROWSER brave

function ex
    switch $argv[1]
      case '*.tar.bz2'
        tar xjf $argv[1]
      case '*.tar.gz'
        tar xzf $argv[1]
      case '*.bz2'
        bunzip2 $argv[1]
      case '*.rar'
        unrar x $argv[1]
      case '*.gz'
        gunzip $argv[1]
      case '*.tar'
        tar xf $argv[1]
      case '*.tbz2'
        tar xjf $argv[1]
      case '*.tgz'
        tar xzf $argv[1]
      case '*.zip'
        unzip $argv[1]
      case '*.Z'
        uncompress $argv[1]
      case '*.7z'
        7z x $argv[1]
      case '*.deb'
        ar x $argv[1]
      case '*.tar.xz'
        tar xf $argv[1]
      case '*.tar.zst'
        tar xf $argv[1]
      case '*'
        echo "'$argv[1]' cannot be extracted via ex()"
    end
end

alias rotate-right="mogrify -rotate -90"

alias rotate-left="mogrify -rotate 90"

#clean up dependencies
alias clean-dependencies="pacman -Qstq | sudo pacman -Rs -"

#grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

#add new fonts
alias update-fc='sudo fc-cache -fv'

#check vulnerabilities microcode
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'

#get fastest mirrors in your neighborhood
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"

alias wifi='nmtui'
alias latexmk='latexmk -pdf'

#fixes
alias fix-permissions="sudo chown -R $USER:$USER ~/.config ~/.local"
alias fix-keys="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fix-pacman-conf="/usr/local/bin/arcolinux-fix-pacman-conf"
alias fix-pacman-keyserver="/usr/local/bin/arcolinux-fix-pacman-gpg-conf"

alias reload="sudo nixos-rebuild switch --flake ~/nixOS/#luca"

alias vim="nvim"
alias vi="nvim"
alias cat="bat"
alias update="paru"
alias ls="exa --icons"
alias icat="kitty +kitten icat"
# alias cd="z"
# zoxide init fish | source
	'';
  };

  home.stateVersion = "23.05";
  programs.home-manager.enable = true;

  xdg.configFile."waybar/config".source = ./modules/waybar/config;
  xdg.configFile."waybar/modules.json".source = ./modules/waybar/modules.json;
  xdg.configFile."waybar/style.css".source = ./modules/waybar/style.css;
  xdg.configFile."waybar/scripts/cliphist.sh".source = ./modules/waybar/scripts/cliphist.sh;
  xdg.configFile."waybar/scripts/reload.sh".source = ./modules/waybar/scripts/reload.sh;

  xdg.configFile."hypr/hyprpaper.conf".source = ./modules/hypr/hyprpaper.conf;

  wayland.windowManager.hyprland = {
  	enable = true;
	xwayland.enable = true;
  	extraConfig = ''
		monitor=eDP-1,preferred,auto,1
		monitor=DP-3,preferred,auto,1 
		monitor=HDMI-A-1,preferred,auto,1
		# Source a file (multi-file configs)center
		# source = ~/.config/hypr/myColors.conf

		# Some default env vars.
		env = XCURSOR_SIZE,24
		#nvidia fixes
		#env = LIBVA_DRIVER_NAME,nvidia
		#env = XDG_SESSION_TYPE,wayland
		#env = GBM_BACKEND,nvidia-drm
		#env = __GLX_VENDOR_LIBRARY_NAME,nvidia
		env = WLR_NO_HARDWARE_CURSORS,1

		misc {
			 disable_hyprland_logo = true
			 disable_splash_rendering = true
		}

		# For all categories, see https://wiki.hyprland.org/Configuring/Variables/
		input {
		    kb_layout = us
		    kb_variant = altgr-intl
		    kb_model =
		    kb_options = nodeadkeys
		    kb_rules =

		    follow_mouse = 1
		    
		    numlock_by_default = true
			    touchpad {
				natural_scroll = no
			    }

			    sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
			}

			general {
			    # See https://wiki.hyprland.org/Configuring/Variables/ for more

			    gaps_in = 5
			    gaps_out = 20
			    border_size = 2
			    col.active_border = rgba(33ccffee)
			    col.inactive_border = rgba(595959aa)

			    layout = dwindle
			}

			decoration {
			    # See https://wiki.hyprland.org/Configuring/Variables/ for more

			    rounding = 10
			  #  blur = yes
			  #  blur_size = 3
			  #  blur_passes = 1
			  #  blur_new_optimizations = on

			    drop_shadow = yes
			    shadow_range = 4
			    shadow_render_power = 3
			    col.shadow = rgba(1a1a1aee)
			}

			animations {
			    enabled = yes

			    # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

			    bezier = myBezier, 0.05, 0.9, 0.1, 1.05

			    animation = windows, 1, 7, myBezier
			    animation = windowsOut, 1, 7, default, popin 80%
			    animation = border, 1, 10, default
			    animation = borderangle, 1, 8, default
			    animation = fade, 1, 7, default
			    animation = workspaces, 1, 6, default
			}

			dwindle {
			    # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
			    pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
			    preserve_split = yes # you probably want this
			}

			master {
			    # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
			    new_is_master = true
			}

			gestures {
			    # See https://wiki.hyprland.org/Configuring/Variables/ for more
			    workspace_swipe = on
			}

			# Example per-device config
			# See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
			device:epic-mouse-v1 {
			    sensitivity = -0.5
			}

			# Example windowrule v1
			# windowrule = float, ^(kitty)$
			# Example windowrule v2
			# windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
		# See https://wiki.hyprland.org/Configuring/Window-Rules/ for more


		# See https://wiki.hyprland.org/Configuring/Keywords/ for more
		$mainMod = SUPER

		# Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
		bind = $mainMod, RETURN, exec, kitty
		bind = $mainMod, Q, killactive, 
		bind = $mainMod, M, exit, 
		bind = $mainMod, E, exec, thunar
		bind = $mainMod, W, exec, brave
		bind = $mainMod, S, exec, spotify
		bind = $mainMod, V, togglefloating, 
		bind = $mainMod, R, exec, wofi --show drun
		bind = $mainMod, P, pseudo, # dwindle
		bind = $mainMod, SPACE, togglesplit, # dwindle
		bind = $mainMod, F, fullscreen
		bind = $mainMod, X, exec, wlogout
		bind = $mainMod SHIFT, RETURN, exec, rofi -modi run -show drun
		bind = $mainMod SHIFT, R, exec, bash ~/.config/waybar/scripts/reload.sh

		# Move focus 
		bind = $mainMod, H, movefocus, l
		bind = $mainMod, L, movefocus, r
		bind = $mainMod, K , movefocus, u
		bind = $mainMod, J, movefocus, d

		# Resize active Window
		bind = $mainMod CONTROL, l, resizeactive, 10 0
		bind = $mainMod CONTROL, h, resizeactive, -10 0
		bind = $mainMod CONTROL, k, resizeactive, 0 -10
		bind = $mainMod CONTROL, j, resizeactive, 0 10

		# move active window
		bind = $mainMod SHIFT, l, movewindow, r
		bind = $mainMod SHIFT, h, movewindow, l
		bind = $mainMod SHIFT, k, movewindow, u
		bind = $mainMod SHIFT, j, movewindow, d

		# Switch workspaces with mainMod + [0-9]
		bind = $mainMod, 1, workspace, 1
		bind = $mainMod, 2, workspace, 2
		bind = $mainMod, 3, workspace, 3
		bind = $mainMod, 4, workspace, 4
		bind = $mainMod, 5, workspace, 5
		bind = $mainMod, 6, workspace, 6
		bind = $mainMod, 7, workspace, 7
		bind = $mainMod, 8, workspace, 8
		bind = $mainMod, 9, workspace, 9
		bind = $mainMod, 0, workspace, 10

		# Move active window to a workspace with mainMod + SHIFT + [0-9]
		bind = $mainMod SHIFT, 1, movetoworkspace, 1
		bind = $mainMod SHIFT, 2, movetoworkspace, 2
		bind = $mainMod SHIFT, 3, movetoworkspace, 3
		bind = $mainMod SHIFT, 4, movetoworkspace, 4
		bind = $mainMod SHIFT, 5, movetoworkspace, 5
		bind = $mainMod SHIFT, 6, movetoworkspace, 6
		bind = $mainMod SHIFT, 7, movetoworkspace, 7
		bind = $mainMod SHIFT, 8, movetoworkspace, 8
		bind = $mainMod SHIFT, 9, movetoworkspace, 9
		bind = $mainMod SHIFT, 0, movetoworkspace, 10

		# Scroll through existing workspaces with mainMod + scroll
		bind = $mainMod, mouse_down, workspace, e+1
		bind = $mainMod, mouse_up, workspace, e-1

		# Move/resize windows with mainMod + LMB/RMB and dragging
		bindm = $mainMod, mouse:272, movewindow
		bindm = $mainMod, mouse:273, resizewindow

		# Multimedia Keys
		bind =, XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
		bind =, XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
		bind =, XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
		bind =, XF86AudioPlay, exec, playerctl play-pause
		bind =, XF86AudioPrev, exec, playerctl previous
		bind =, XF86AudioNext, exec, playerctl next
		bind =, XF86MonBrightnessUp, exec, brightnessctl set +5%
		bind =, XF86MonBrightnessDown, exec, brightnessctl set 5%-



		exec-once=waybar
		exec-once=wal -R
		exec-once=hyprpaper
		exec-once=nm-applet --indicator &
		exec-once=mako
		exec-once=wl-paste --watch cliphist store
		exec-once=owncloud
		exec-once=rclone mount --network-mode Gdrive:/ ~/Gdrive/
		  '';
	  };
	}
