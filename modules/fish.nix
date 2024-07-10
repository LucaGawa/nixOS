{
  programs.fish = {
    enable = true;
    shellAbbrs = {
      wifi = "nmtui";
      latexmk = "latexmk -pdf";
      icat = "kitty +kitten icat";
      cat = "bat";
      update = "sudo nix flake update ~/nixOS/";
      config = "nvim ~/nixOS/configuration.nix";
      home = "nvim ~/nixOS/home.nix";
      hyprland = "nvim ~/nixOS/modules/hyprland/hyprland.nix";
    };
    shellAliases = {
      vf = "bash nixOS/scripts/fzf.sh";
      ls = "exa --icons";
      tree = "exa --tree --icons";
      vim = "nvim";
      vi = "nvim";

      # vf="nvim '$(fzf --preview=''bat --color=always --style=plain {}'' --bind K:preview-up,J:preview-down --prompt ''Please select a file to edit: '')'";
    };

    interactiveShellInit = ''
      if status is-interactive
          # Commands to run in interactive sessions can go here
      end

      zoxide init fish | source
      starship init fish | source
      atuin init fish | source

      fish_vi_key_bindings

      set fish_greeting

      bind -M insert \cy accept-autosuggestion

      ### EXPORT ###
      set -x EDITOR nvim
      set -x VISUAL nvim
      set -x HISTCONTROL ignoreboth:erasedups
      set -x PAGER most
      set -x BROWSER firefox

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
}
