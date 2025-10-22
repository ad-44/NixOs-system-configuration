{
  description = "My Nixos System";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    
    stylix = {
      url = "github:nix-community/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, stylix, zen-browser, ... }@inputs: {
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
         ./configuration.nix
         stylix.nixosModules.stylix
         home-manager.nixosModules.home-manager
         {
           home-manager.useGlobalPkgs = true ;
           home-manager.useUserPackages = true ;
           home-manager.users.antoine = import ./home.nix;
         }
        ];
    }; 

  };
}
