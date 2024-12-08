{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  }: let
    linux = "x86_64-linux";
  in {
    defaultPackage.${linux} = home-manager.defaultPackage.${linux};

    homeConfigurations."meysi@foot1" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${linux};

      modules = [
        {
          home.username = "meysi";
          home.homeDirectory = "/home/meysi";
        }
        ./gaming.nix
        ./home.nix
        ./unfree.nix
        ./editor.nix
        ./hyprland.nix
      ];
    };
  };
}
