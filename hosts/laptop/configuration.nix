# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
  ];

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users.luca = {
      imports = [./home.nix ../../home.nix];
    };
  };
  nixpkgs.config.allowUnfree = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # boot.loader = {
  # efi = {
  # canTouchEfiVariables = true;
  # efiSysMountPoint = "/boot/efi";
  # };
  # grub = {
  # efiSupport = true;
  # device = "nodev";
  # };
  # };
  # # Bootloader.
  # boot.loader.efi.canTouchEfiVariables = true;
  # boot.loader.grub.enable = true;
  # boot.loader.grub.device = "nodev";
  # boot.loader.grub.useOSProber = true;
  # boot.loader.grub.efiSupport = false;

  networking.hostName = "laptop"; # Define your hostname.

  # Battery Life Improvemtns
  #Better scheduling for CPU cycles
  #services.system76-scheduler.settings.cfsProfiles.enable = true;
  # services.tlp = {
  # enable = true;
  # settings = {
  # # CPU_BOOST_ON_AC = 1;
  # # CPU_BOOST_ON_BAT = 0;
  # # CPU_SCALING_GOVERNOR_ON_AC = "performance";
  # # CPU_SCALING_GOVERNOR_ON_BAT = "powersaver";
  # };
  # };
  # powerManagement.enable = true;
  # services.power-profiles-daemon.enable = false;
  powerManagement.powertop.enable = true;
  services.thermald.enable = true;

  environment.systemPackages = with pkgs; [
    #	displaylink
  ];

  #wayland.windowManager.hyprland.enableNvidiaPatches = true;
  # Enable OpenGL
  hardware.opengl = {
    enable = true;
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead
    # of just the bare essentials.
    powerManagement.enable = false;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of
    # supported GPUs is at:
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
    # Only available from driver 515.43.04+
    # Currently alpha-quality/buggy, so false is currently the recommended setting.
    open = false;

    # Enable the Nvidia settings menu,
    # accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    prime = {
      sync.enable = true;
      nvidiaBusId = "PCI:1:0:0";
      intelBusId = "PCI:0:2:0";
    };
  };
  services.hardware.bolt.enable = true;
}
