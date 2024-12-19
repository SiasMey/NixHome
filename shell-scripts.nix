{pkgs, ...}: {
  home.packages = [
    (import ./scripts/vhm.nix {inherit pkgs;})
    (import ./scripts/vss.nix {inherit pkgs;})
    (import ./scripts/vv.nix {inherit pkgs;})
    (import ./scripts/vt.nix {inherit pkgs;})
    (import ./scripts/vm.nix {inherit pkgs;})
    (import ./scripts/palette.nix {inherit pkgs;})
  ];
}
