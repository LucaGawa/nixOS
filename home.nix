{ config, pkgs, ... }:

{
 home.username = "luca";
 home.homeDirectory = "/home/luca";
 home.stateVersion = "23.05";
 programs.home-manager.enable = true;

}
