{
  description = "Example Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
        home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:danth/stylix";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, stylix, ... }:
  let
	system = "x86_64-darwin";
	userSet = {
	userName = "luca";
	};
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#luca
    darwinConfigurations."luca" = nix-darwin.lib.darwinSystem {
      inherit system;
      specialArgs = {
          inherit inputs;
	  inherit userSet;
      };
      modules = [ ./configuration.nix
      stylix.darwinModules.stylix
	home-manager.darwinModules.home-manager
{
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
		home-manager.backupFileExtension = "backup";
		home-manager.extraSpecialArgs = {
			inherit userSet;
			};
            home-manager.users.luca =
		{
		 imports = [
		 ../../home.nix 
		 ./home.nix];
		};
          } ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."luca".pkgs;
  };
}
