{pkgs, ...}: {
  home.packages = [
    (import ./scripts/vhm.nix {inherit pkgs;})
    (import ./scripts/vss.nix {inherit pkgs;})
  ];
}
