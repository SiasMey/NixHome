{pkgs, ...}: {
  home.packages = [
    (import ./scripts/vhm.nix {inherit pkgs;})
  ];
}
