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

  nixpkgs.config = {
    allowUnsupportedSystem = true;
    allowBroken = true;
  };

  system.keyboard = {
    enableKeyMapping = false;
    remapCapsLockToEscape = true;
    remapCapsLockToControl = true;
  };

  stylix = {
    image = ../../wallpaper/1.png;
  };

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = false; # default shell on catalina
  programs.fish.enable = true;

  # Set Git commit hash for darwin-version.
  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "x86_64-darwin";

  nixpkgs.config.allowUnfree = true;
}
