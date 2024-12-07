{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }:
    let
      linux = "x86_64-linux";
    in
    {
      defaultPackage.${linux} = home-manager.defaultPackage.${linux};

      homeConfigurations.meysi = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${linux};
        modules = [
          ./home.nix
          ./unfree.nix
          ./editor.nix
          ./hyprland.nix
        ];
      };
    };
}
