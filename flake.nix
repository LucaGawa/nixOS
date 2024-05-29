{
  description = "A very basic flake";

  inputs = {
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
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
      # inputs.nixpkgs-stable.follows = "nixpkgs-stable";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    hyprpaper = {
      url = "github:hyprwm/hyprpaper";
      inputs.nixpkgs.follows = "nixpkgs";
      # inputs.nixpkgs-stable.follows = "nixpkgs-stable";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    hyprland,
    hyprland-plugins,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    userSet = {
      userName = "luca";
    };
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${system};
    pkgs-stable = nixpkgs-stable.legacyPackages.${system};
    # user = "luca";
    # pkgs = import nixpkgs {
    #   inherit system;
    #   config = {
    #     allowUnfree = true;
    #   };
    # };
    # stable = import nixpkgs-stable {
    #   inherit system;
    #   config = {
    #     allowUnfree = true;
    #   };
    # };
  in {
    # overlays = {
    #   pkg-sets = (
    #     final: prev: {
    #       stable = import inputs.nixpkgs-stable {inherit system;};
    #     }
    #   );
    # };

    nixosConfigurations = {
      laptop = lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./configuration.nix
          ./hosts/laptop/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.luca = {
              imports = [./home.nix ./hosts/laptop/home.nix];
            };
          }
        ];
      };

      desktop = lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          inherit userSet;
          inherit pkgs-stable;
        };
        modules = [
          ./configuration.nix
          ./hosts/desktop/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              inherit pkgs-stable;
              inherit userSet;
            };
            home-manager.users.${userSet.userName} = {
              imports = [./home.nix ./hosts/desktop/home.nix];
            };
          }
        ];
      };
    };
  };
}
