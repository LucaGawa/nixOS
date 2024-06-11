{ pkgs, lib, ... }: {
  home.packages = [ pkgs.atool pkgs.httpie ];
  programs.bash.enable = true;

  home.username = "luca";
  home.homeDirectory = lib.mkForce "/Users/luca";

  programs.git = {
  enable = true;
  userName = "Luca Gawalleck";
  userEmail = "luca.gawalleck@gmail.com";
  };

  programs.kitty = {
  enable = true;
  settings = {
  enable_audio_bell = false;
  };
  };

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "24.05";
  programs.home-manager = {
  enable = true;
  };
}
