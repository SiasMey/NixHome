{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    ghostty = {
      url = "github:ghostty-org/ghostty";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    zen-browser,
    ghostty,
    ...
  } @ inputs: {
    defaultPackage.aarch64-darwin = home-manager.defaultPackage.aarch64-darwin;
    defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;

    homeConfigurations."meysi@foot1" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [
        {
          home.packages = [
            inputs.zen-browser.packages.x86_64-linux.default
            inputs.ghostty.packages.x86_64-linux.default
          ];
          home.username = "meysi";
          home.homeDirectory = "/home/meysi";
          workloads.cad.enabled = false;
        }
        ./home.nix
        ./unfree.nix
        ./terminal.nix
        ./editor.nix
        ./shell-scripts.nix
        ./hyprland.nix
        ./cad
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
        ./terminal.nix
        ./editor.nix
        ./shell-scripts.nix
        ./mac.nix
      ];
    };
  };
}
