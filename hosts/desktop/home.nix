{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
	settings = {
		monitor = [
			"DP-1,preferred,1241x2364,1.05"
			"DP-2,preferred,3057x1080,0.88"
			"DP-3,preferred,0x1080,1.12"
			"HDMI-A-3,preferred,1870x0,1"
		];
};
  };
	}
