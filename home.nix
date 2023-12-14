{ config, pkgs, nix-colors, ... }:
# let
# 				
# 				customIcons = import ./icons.nix { inherit pkgs; };
# in
{
 imports = [
				nix-colors.homeManagerModules.default
				];
 #
 # colorScheme = inputs.nix-colors.colorSchemes.nord;
 home.username = "luca";
 home.homeDirectory = "/home/luca";

 home.packages = with pkgs; [
  glib
  gsettings-desktop-schemas
];

 home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
  };

 programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
    ];
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
    extraConfig = {
	pull = {
		ff = "only";
	};
    };
  };

programs.vscode = {
  enable = true;
  # package = pkgs.vscodium;
  extensions = with pkgs.vscode-extensions; [
    #dracula-theme.theme-dracula
    # vscodevim.vim
    yzhang.markdown-all-in-one
    james-yu.latex-workshop
    ms-toolsai.jupyter
    #ms-python.python
  ];
};



  #############################################
  ############# THEMING #######################
  #############################################
  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.nordzy-cursor-theme;
      name = "Nordzy-cursors";
      size = 24;
    };
# font = {
#       package = (pkgs.nerdfonts.override { fonts = [ "Mononoki" ]; });
#       name = "Mononoki Nerd Font Regular";
#       size = 18;
#     };
    iconTheme = {
      # (pkgs.catppuccin-papirus-folders.override { flavor = "mocha"; accent = "peach"; })
			package = (pkgs.nordzy-icon-theme.override { nordzy-themes = [ "all" ]; });
			name  = "Nordzy";
    };
    # theme = {
      # package = (pkgs.catppuccin-gtk.override { accents = [ "peach" ]; size = "standard"; variant = "mocha"; });
      # name = "Catppuccin-Mocha-Standard-Peach-Dark";
    # };
		theme = {
      package = pkgs.nordic;
			name = "Nordic";
    };

  };

  qt = {
    enable = true;
    platformTheme = "gtk";
    # style.name = "gtk";
    style = {
     name = "adwaita-dark";
     package = pkgs.adwaita-qt;
    };
  };
 
  xdg.configFile."mimeapps.list".force = true;
  xdg.mimeApps = {
	enable = true;
	associations.added = {
	"application/pdf" = ["org.gnome.Evince.desktop"];
	"image/vnd.djvu+multipage"=["org.gnome.Evince.desktop"];
	};
	defaultApplications = {
	"application/pdf" = ["org.gnome.Evince.desktop"];
	 "text/html" = ["firefox.desktop"];
    "x-scheme-handler/http" = ["firefox.desktop"];
    "x-scheme-handler/https" = ["firefox.desktop"];
    "x-scheme-handler/about" = ["firefox.desktop"];
    "x-scheme-handler/unknown" = ["firefox.desktop"];
	};
	};
  # xdg.mimeApps.defaultApplications = {
  #   "text/plain" = ["mousepad.desktop"];
  #   "text/tex" = ["mousepad.desktop"];
  #   "application/pdf" = ["evince.desktop"];
  #   "image/*" = ["nomacs.desktop"];
  # };

  programs.neovim = {
  enable = true;
  plugins = with pkgs.vimPlugins; [
  	nvim-treesitter.withAllGrammars # syntax highlighting
	comment-nvim # comment and uncomment code
	nvim-tree-lua # file explorer 
	coc-pyright
	# vim-latex-live-preview
	vimtex # LaTeX plugin
	luasnip # Snipets
	deoplete-nvim
	nvim-lspconfig #communtication with language server	
	nvim-cmp #completion
	cmp-nvim-lsp
	cmp_luasnip
	friendly-snippets # bunch of snippets
	neodev-nvim
	gitsigns-nvim 
	better-escape-nvim
	nord-nvim
  ];
   extraConfig = ''
   	packadd! nvim-tree.lua
	lua require("nvim-tree").setup()
	autocmd FileType nix setlocal commentstring=#\ %s
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
	luafile ${./modules/nvim/nvim.lua}
	colorscheme nord
    '';
};

  programs.fish = {
	enable = true;
	shellAbbrs = {
		wifi = "nmtui";		
		latexmk = "latexmk -pdf";
		vim = "nvim";
		vi = "nvim";
		ls = "exa --icons";
		icat = "kitty +kitten icat";
		cat = "bat";
		update = "sudo nix flake update ~/nixOS/";
		config = "nvim ~/nixOS/configuration.nix";
		home = "nvim ~/nixOS/home.nix";
	};
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

#grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

#add new fonts
alias update-fc='sudo fc-cache -fv'

#check vulnerabilities microcode
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'


#fixes
alias fix-permissions="sudo chown -R $USER:$USER ~/.config ~/.local"


	'';
  };

  home.stateVersion = "23.05";
  programs.home-manager.enable = true;

  xdg.configFile."waybar".source = ./modules/waybar;
  xdg.configFile."swaync".source = ./modules/swaync;
  xdg.configFile."hypr/hyprpaper.conf".source = ./modules/hypr/hyprpaper.conf;
  xdg.configFile."kitty/kitty.conf".source = ./modules/kitty/kitty.conf;
  # xdg.configFile."mako/config".source = ./modules/mako/config;
  xdg.configFile."wlogout".source = ./modules/wlogout;
  xdg.configFile."/home/luca/texmf/tex/latex/commonstuff/pakete.sty".source = ./modules/tex/pakete.sty;
  xdg.configFile."/home/luca/texmf/tex/latex/commonstuff/template_xournalpp.tex".source = ./modules/tex/template_xournalpp.tex;
  xdg.configFile."xournalpp/toolbar.ini".source = ./modules/xournalpp/toolbar.ini;
  xdg.configFile."xournalpp/settings.xml".source = ./modules/xournalpp/settings.xml;
  xdg.configFile."rofi".source = ./modules/rofi;
  xdg.configFile."Code/User/keybindings.json".source = ./modules/code/keybindings.json;
  xdg.configFile."Code/User/settings.json".source = ./modules/code/settings.json;
  xdg.configFile."Thunar/uca.xml".source = ./modules/thunar/uca.xml;
  xdg.configFile."nvim/lua".source = ./modules/nvim/lua;
	


  wayland.windowManager.hyprland = {
  	enable = true;
	xwayland.enable = true;
	settings = {
		
		bindm = [
			"$mainMod, mouse:272, movewindow"
			"$mainMod, mouse:273, resizewindow"
			];
		"$mainMod" = "SUPER";

		bind = [
			"$mainMod, RETURN, exec, kitty"
			"$mainMod, Q, killactive" 
			"$mainMod, M, exec, mathematica"
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
			# "$mainMod, G, exec, kitty"
			
	
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
		binde=[

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
			",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
			",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
			",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
			", XF86AudioPlay, exec, playerctl play-pause"
			", XF86AudioPrev, exec, playerctl previous"
			", XF86AudioNext, exec, playerctl next"
			", XF86MonBrightnessUp, exec, brightnessctl set +5%"
			", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
			 
		];
	};
  	extraConfig = ''

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
		    kb_options = nodeadkeys, caps:escape
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
		    resize_on_border = true
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
		exec-once=wal -i "~/nixOS/wallpaper/road.jpg"
		exec-once=waybar
		exec-once=waybar -c ~/.config/waybar/config_bottom
		exec-once=wal -R
		exec-once=hyprpaper
		exec-once=nm-applet --indicator &
		exec-once=swaync 
		exec-once=wl-paste --watch cliphist store
		exec-once=sleep 1; owncloud
		exec-once=rclone mount --network-mode Gdrive:/ ~/Gdrive/
		exec-once=bash ~/nixOS/scripts/read_cursor_theme.sh
		  '';
	  };
	}
