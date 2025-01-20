{
  description = "A very basic flake";

  inputs = {
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nix-colors.url = "github:misterio77/nix-colors";
    # base16.url = "github:SenchoPens/base16.nix";
    xremap-flake.url = "github:xremap/nix-flake";
    # stylix.url = "github:danth/stylix";
    stylix.url = "github:danth/stylix/cf8b6e2d4e8aca8ef14b839a906ab5eb98b08561";
    hardware.url = "github:nixos/nixos-hardware";
    nix-darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";

    nvf.url = "github:notashelf/nvf";

    home-manager = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
      # inputs.nixpkgs-stable.follows = "nixpkgs-stable";
    };
    hyprland = {
      # url = "github:hyprwm/Hyprland";
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # hyprpaper = {
    #   url = "github:hyprwm/hyprpaper";
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   # inputs.nixpkgs-stable.follows = "nixpkgs-stable";
    # };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    Hyprspace = {
      url = "github:KZDKM/Hyprspace";
      inputs.hyprland.follows = "hyprland";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    hyprland,
    # hyprland-plugins,
    nix-darwin,
    nix-homebrew,
    nvf,
    ...
  } @ inputs: let
    #system = "x86_64-linux";
    system = "arch64-darwin";
    userSet = {
      userName = "luca";
    };
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${system};
    pkgs-stable = nixpkgs-stable.legacyPackages.${system};
    nixpkgs.hostPlatform = system;
  in {
    darwinConfigurations."Lucas-MacBook-Pro" = nix-darwin.lib.darwinSystem {
      modules = [
        ./hosts/mbp/configuration.nix
        inputs.stylix.darwinModules.stylix
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            enableRosetta = true;
            user = userSet.userName;
            autoMigrate = true;
          };
        }
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = {
            inherit pkgs-stable;
            inherit userSet;
          };
          home-manager.users.luca = {
            imports = [./hosts/mbp/home.nix];
          };
        }
      ];
    };

    # darwinConfigurations."air" = nix-darwin.lib.darwinSystem {
    #   modules = [./hosts/mac/configuration.nix];
    # };
    # darwinPackages = self.darwinConfigurations."mac".pkgs;
    nixosConfigurations = {
      laptop = lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          inherit userSet;
          inherit pkgs-stable;
        };
        modules = [
          ./configuration.nix
          ./hosts/laptop/configuration.nix
          inputs.stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.extraSpecialArgs = {
              inherit pkgs-stable;
              inherit userSet;
            };
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
          inputs.stylix.nixosModules.stylix
          # nvf.nixosModules.default
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.extraSpecialArgs = {
              inherit pkgs-stable;
              inherit userSet;
            };
            home-manager.users.${userSet.userName} = {
              imports = [./home.nix ./hosts/desktop/home.nix nvf.homeManagerModules.default];
            };
          }
        ];
      };
    };
  };
}
