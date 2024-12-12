{
  pkgs,
  home,
  ...
}: {
  home.packages = [
    (import ./scripts/vhm.nix {inherit pkgs;})
    (import ./scripts/vss.nix {
      inherit pkgs;
      inherit home;
    })
    (import ./scripts/vv.nix {inherit pkgs;})
    (import ./scripts/vos.nix {inherit pkgs;})
    (import ./scripts/vt.nix {inherit pkgs;})
  ];
}
