{
  description = "A very basic flake";
  
  inputs = {
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-colors.url = "github:misterio77/nix-colors";
		# base16.url = "github:SenchoPens/base16.nix";
    xremap-flake.url = "github:xremap/nix-flake";

  base16-schemes = {
    url = "github:base16-project/base16-schemes";
    flake = false;
  };
  base16-zathura = {
    url = "github:haozeke/base16-zathura";
    flake = false;  
  };

  base16-kitty = {
    url = "github:kdrag0n/base16-kitty";
    flake = false;
  };



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

  outputs = { self, nixpkgs, home-manager,  hyprland, ... } @ inputs: 
    let
      system = "x86_64-linux";
      # user = "luca";
			pkgs = import nixpkgs {
			  inherit system;
				config = {
				allowUnfree = true;
				};
				};
    in 
		{
  nixosConfigurations = {
	laptop = nixpkgs.lib.nixosSystem {
				  specialArgs = { inherit inputs; };
          modules = [ 
            ./configuration.nix
				   ./hosts/laptop/configuration.nix 
             home-manager.nixosModules.home-manager {
               home-manager.useGlobalPkgs = true;
               home-manager.useUserPackages = true;
               home-manager.users.luca = {
                 imports = [ ./home.nix ./hosts/laptop/home.nix];
               };
             }
          ];
        };
#	desktop = nixpkgs.lib.nixosSystem {
#				  specialArgs = { inherit inputs; };
 #         modules = [ 
  #          ./configuration.nix
#				   ./hosts/desktop/configuration.nix 
#					 inputs.home-manager.nixosModules.default
 #         ];
  #      };


       desktop = nixpkgs.lib.nixosSystem {
         inherit system;
					 specialArgs = { inherit inputs; };
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
