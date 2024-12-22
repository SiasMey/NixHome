{pkgs, ...}: {
  home.packages = [
    # # gaming
    pkgs.gamescope
    pkgs.mangohud
    pkgs.protonup
    pkgs.lutris
    pkgs.webcord
    # pkgs.wineWowPackages.unstable
    pkgs.winetricks
    pkgs.wineWowPackages.waylandFull
  ];

  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };
}
