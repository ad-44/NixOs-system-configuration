{
  description = "My Nixos System";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
         ./configuration.nix

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
