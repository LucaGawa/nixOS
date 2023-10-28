{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
	settings = {

  	"exec-once" = [
			"[workspace 10 silent;fullscreen] spotify"
			"[workspace 9 silent] thunderbird rambox"
			# "[workspace 9 silent] rambox"
		];

		monitor = [
			"DP-1,preferred,1241x2364,1.05"
			"DP-2,preferred,3057x1080,0.88"
			"DP-3,preferred,0x1080,1.12"
			"HDMI-A-3,preferred,1870x0,1"
		];
		workspace = [
			"10, monitor:HDMI-A-3, default:true"
			"1, monitor:DP-3, default:true"
			"8, monitor:DP-1, default:true"
			"5, monitor:DP-2, default:true"
			"9, monitor:DP-2, default:false"
		];
		bind = [
			"$mainMod, z, exec, [monitor DP-1] xournalpp"
			"$mainMod, s, exec, [workspace 10 silent;fullscreen] spotify"
		];
};
  };
	}
