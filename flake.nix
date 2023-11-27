{
  description = "A very basic flake";
  
  inputs = {
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    hyprpaper = {
    	url = "github:hyprwm/hyprpaper";
	inputs.nixpkgs.follows = "nixpkgs";
	};
  };

  outputs = { self, nixpkgs, nixpkgs-stable, home-manager, hyprland, ... }: 
    let
      system = "x86_64-linux";
      # user = "luca";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs-stable = import nixpkgs-stable {
	inherit system;
	config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    in {
	# overlays = {
	# 	 add-stable-packages = final: _prev: {
    	         # stable = import nixpkgs-stable {
      		 # inherit system;
    # };
  # };
	# };
      nixosConfigurations = {
	laptop = lib.nixosSystem {
          inherit system;
          modules = [ 
            ./configuration.nix
	    ./hosts/laptop/configuration.nix
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.luca = {
                imports = [ ./home.nix ./hosts/laptop/home.nix ];
              };
            }
          ];
        };

        desktop = lib.nixosSystem {
          inherit system;
          modules = [ 
            ./configuration.nix
	    ./hosts/desktop/configuration.nix
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.luca = {
                imports = [ ./home.nix ./hosts/desktop/home.nix];
              };
            }
          ];
        };
    };
    };
}
