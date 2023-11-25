# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix 
    ];

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
  powerManagement.enable = true;
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
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
#	vulkan-validation-layers
    ];
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia" "intel" ];

  hardware.nvidia = {

    # Modesetting is required.
   modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # powerManagement.enable = true;
    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    #powerManagement.finegrained = false;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of 
    # supported GPUs is at: 
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
    # Only available from driver 515.43.04+
    # Do not disable this unless your GPU is unsupported or if you have a good reason to.
    open = true;

    # Enable the Nvidia settings menu,
	# accessible via `nvidia-settings`.
    #nvidiaSettings = true;
    # perhabs solve tearing issue
    #forceFullCompositionPipeline = true;
    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.beta;

    prime = {
    	sync.enable = true;
	intelBusId = "PCI:0:2:0";
	nvidiaBusId = "PCI:1:0:0";
   };
 };


   services.hardware.bolt.enable = true;


}
