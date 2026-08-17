{
  description = "My Nixos System";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    }; 
    
    stylix = {
      url = "github:nix-community/stylix/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
    };
  };

  outputs = inputs@{
    self,
    nixpkgs,
    home-manager,
    stylix,
    zen-browser,
    ...
  }:
  {  
    nixosConfigurations = {

      #Honor laptop 
      honor-laptop = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
        };
        
        modules = [
          ./hosts/honor-laptop/configuration.nix

          stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager

          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
            
              users.antoine = import ./home/hm-honor-laptop.nix;

              extraSpecialArgs = {
                inherit inputs;
              };
            };
          }

          #Overlays
          (import ./overlays)
        
        ];
      };
      
      # WSL
      wsl = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
        };

        system = "x86_64-linux";
  
        modules = [
	        ./hosts/wsl/configuration.nix

          inputs.nixos-wsl.nixosModules.default
          stylix.nixosModules.stylix

          home-manager.nixosModules.home-manager

          {
            home-manager = {
	            useGlobalPkgs = true;
              useUserPackages = true;

              users.antoine = import ./home/hm-wsl.nix;

              extraSpecialArgs = {
                inherit inputs;
              };
            };
          }

        ];

      };

    };
  };  
  
}
