<<<<<<< HEAD
{ pkgs, inputs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        with pkgs; [ 
                neovim
                starship
                zoxide
                eza
                bat
                atuin
        ];

programs.bash = {
  interactiveShellInit = ''
    if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
    then
      shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
      exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
    fi
  '';
};

      
  stylix = {
    enable = false;
    image = /Users/luca/nixOS/wallpaper/1.png;
  #   base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
  #  # cursor = {
  #   #   package = pkgs.nordzy-cursor-theme;
  #   #   name = "Nordzy-cursors";
  #   # };
  #   fonts = {
  #     monospace = {
  #       package = pkgs.nerdfonts.override {fonts = ["FiraCode"];};
  #       name = "FiraCode Nerd Font Mono";
  #     };
  #     sansSerif = {
  #       package = pkgs.fira;
  #       name = "Fira Sans Medium";
  #     };
  #     serif = {
  #       package = pkgs.dejavu_fonts;
  #       name = "DejaVu Serif";
  #     };
  #     sizes = {
  #       applications = 10;
  #       terminal = 14;
  #       desktop = 8;
  #       popups = 10;
  #     };
  #   };
    # opacity = {
    #   applications = 1.0;
    #   terminal = 0.9;
    #   desktop = 0.0;
    #   popups = 1.0;
    # };
  };

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      nix.package = pkgs.nix;
=======
{
  pkgs,
  inputs,
  ...
}: {
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  imports = [
    ../../system/programs_basic.nix
    ../../system/python.nix
  ];
  # environment.systemPackages =
  #   [
  #           pkgs.neovim
  #   ];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;
>>>>>>> refs/remotes/origin/master

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

<<<<<<< HEAD
      # Create /etc/zshrc that loads the nix-darwin environment.
      # programs.zsh.enable = true;  # default shell on catalina
      programs.fish.enable = true;
=======
  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = false; # default shell on catalina
  # programs.fish.enable = true;
>>>>>>> refs/remotes/origin/master

  # Set Git commit hash for darwin-version.
  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "x86_64-darwin";

  nixpkgs.config.allowUnfree = true;
}
