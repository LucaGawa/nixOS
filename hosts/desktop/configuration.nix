# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix 
      ./vm.nix
    ];
  
  environment.systemPackages = with pkgs; [ 
	piper # config mouse
  ];
  
  services.ratbagd.enable = true; # nessesary for piper

  # Bootloader.
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.efiSupport = false;

  networking.hostName = "desktop"; # Define your hostname.

}
