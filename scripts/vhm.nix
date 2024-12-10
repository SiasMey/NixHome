{pkgs}:
pkgs.writeShellScriptBin "vhm" ''
  set -e

  cd ~/personal/NixHome/trunk
  nvim .
  git add .
  git commit -m "chore: update home-manager config \nfrom $(uname -no) at $(date -Iseconds)\n$(home-manager generations | head -n 1)"

  nh home build ~/personal/NixHome/trunk

  nh home switch ~/personal/NixHome/trunk

  git push
''
