{ config, pkgs, inputs, ... }:
# let
# 				
# 				customIcons = import ./icons.nix { inherit pkgs; };
# in
{
 imports = [
				inputs.nix-colors.homeManagerModules.default
				./modules/hyprland/hyprland.nix
				./modules/waybar.nix
				./modules/rofi/rofi.nix
				];
 #

 nixpkgs.config.allowUnfree = true; 
 colorScheme = inputs.nix-colors.colorSchemes.nord;
 home.username = "luca";
 home.homeDirectory = "/home/luca";

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

programs.zathura = {
				enable = true;
				options = {
				"window-title-home-tilde" = true;
				"statusbar-home-tilde" = true;
				"synctex-editor-command" = "nvr --remote-silent %f -c %l";
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

# programs.qutebrowser = {
#       enable = true;
#       colors = {
#         # Becomes either 'dark' or 'light', based on your colors!
#         webppage.preferred_color_scheme = "${config.colorScheme.kind}";
#         tabs.bar.bg = "#${config.colorScheme.colors.base00}";
#         keyhint.fg = "#${config.colorScheme.colors.base05}";
#         # ...
#       };
#     };


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
	telescope-nvim
	harpoon
	undotree
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
	let g:vimtex_compiler_progname = 'nvr'
  let g:tex_flavor = 'latex'
	luafile ${./modules/nvim/nvim.lua}
	colorscheme nord
    '';
};


# programs.kitty.
programs.kitty = {
				enable = true;
				  # extraConfig = builtins.readFile (config.scheme inputs.base16-kitty);
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
		hyprland = "nvim ~/nixOS/modules/hyprland/hyprland.nix";
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

  xdg.configFile."waybar/scripts".source = ./modules/waybar/scripts;
  xdg.configFile."swaync".source = ./modules/swaync;
  xdg.configFile."kitty".source = ./modules/kitty;
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
  xdg.configFile."OpenTabletDriver/settings.json".source = ./modules/opentablet/settings.json;
	


  	}
