{

  description = "Adathor's flake - just manages my fleet";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11"; 
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {self, nixpkgs, home-manager, ...}:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      defaultPackage.${system} = home-manager.defaultPackage.x86_64-linux;
    in {
    homeConfigurations = {
      apinter = inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        configuration.imports = [ ./home.nix ];
        homeDirectory = "/home/apinter/"
      };
    };
  };
}
