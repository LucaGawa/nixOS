{
  description = "A very basic flake";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    home-manager = {
      url = https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: 
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        luca = lib.nixosSystem {
          inherit system;
          modules = [ 
            ./configuration.nix
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
      hmConfig = {
        luca = home-manager.lib.homeManagerConfiguration {
          inherit system pkgs;
          username = "luca";
          homeDirectory = "/home/luca";
          configuration = {
            imports = [
              ./home.nix
            ];
          };
        };
      };
    };
}
