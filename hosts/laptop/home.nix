{
 wayland.windowManager.hyprland = {
	settings = {
		monitor = [
			"eDP-1,2560x1600,2560x0,1.10"
			"dp-4, 1920x1080, 0x0, 0.75"
		];
		bind = [
			"$mainMod, z, exec, xournalpp"
		];
	};
	};
	
programs.fish = {
	shellAbbrs = {
		rebuild = "sudo nixos-rebuild switch --flake ~/nixOS/#laptop";
	};
  };
}
