{pkgs}:
pkgs.writeShellScriptBin "vhm" ''
  set -e

  cd ~/personal/NixHome/trunk
  ${pkgs.neovim}/bin/nvim .
  ${pkgs.git}/bin/git add .
  ${pkgs.git}/bin/git commit -m "chore: update from $(uname -no) at $(date -Iseconds)"

  ${pkgs.nh}/bin/nh home build ~/personal/NixHome/trunk
  ${pkgs.git}/bin/git push

  ${pkgs.nh}/bin/nh home switch ~/personal/NixHome/trunk
''
