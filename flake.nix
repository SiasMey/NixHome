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
  }: {
    defaultPackage.aarch64-darwin = home-manager.defaultPackage.aarch64-darwin;
    defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;

    homeConfigurations."meysi@foot1" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;

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

    homeConfigurations."meysi@HPE-LFL6NJ14KD" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages."aarch64-darwin";
      modules = [
        {
          home.username = "meysi";
          home.homeDirectory = "/Users/meysi";
        }
        ./home.nix
        ./unfree.nix
        ./editor.nix
        ./mac.nix
      ];
    };
  };
}
