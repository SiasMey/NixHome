{pkgs}: {
  home.packages = [
    (import ./scripts/test-nix-script.nix {inherit pkgs;})
  ];
}
