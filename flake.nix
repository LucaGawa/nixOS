{
  description = "A very basic flake";
  
  inputs = {
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

  outputs = { self, nixpkgs, home-manager, hyprland, ... }: 
    let
      system = "x86_64-linux";
      # user = "luca";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
	laptop = lib.nixosSystem {
          inherit system;
          modules = [ 
            ./configuration.nix
	    ./laptop.nix
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.luca = {
                imports = [ ./home.nix ];
              };
            }
          ];
        };

        desktop = lib.nixosSystem {
          inherit system;
          modules = [ 
            ./configuration.nix
	    ./desktop.nix
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.luca = {
                imports = [ ./home.nix ];
              };
            }
          ];
        };
    };
    };
}
