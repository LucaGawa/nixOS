{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
	settings = {

  	"exec-once" = "spotify";

	"windowrulev2" = "fullscreen,class:(Spotify),title:(Spotify),class:(spotify),title: ^ (.)(Spotify)(.)$";
		monitor = [
			"DP-1,preferred,1241x2364,1.05"
			"DP-2,preferred,3057x1080,0.88"
			"DP-3,preferred,0x1080,1.12"
			"HDMI-A-3,preferred,1870x0,1"
		];
		workspace = [
			"10, monitor:HDMI-A-3, default:true"
		];
};
  };
	}
