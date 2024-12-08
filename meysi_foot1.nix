{pkgs, ...}: {
  home.username = "meysi";
  home.homeDirectory = "/home/meysi";

  home.packages = [
    # # gaming
    pkgs.gamescope
    pkgs.mangohud
    pkgs.protonup
    pkgs.lutris
    pkgs.webcord
  ];

  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };
}
