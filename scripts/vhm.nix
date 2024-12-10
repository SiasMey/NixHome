{pkgs}:
pkgs.writeShellScriptBin "vhm" ''
  set -e

  cd ~/personal/NixHome/trunk
  nvim .
  git add .
  git commit -m "chore: update from $(uname -no) at $(date -Iseconds)"

  nh home build ~/personal/NixHome/trunk

  nh home switch ~/personal/NixHome/trunk

  git push
''
