{pkgs}:
pkgs.writeShellScriptBin "vv" ''
  set -e
  SCRIPT_NAME=$1

  cd ~/personal/NixHome/trunk/dotfiles/nix-nvim/lua

  nvim .
  git add .

  git commit -m "chore: update neovim-config on $(uname -no) at $(date -Iseconds)"

  nh home build ~/personal/NixHome/trunk
  git push

  nh home switch ~/personal/NixHome/trunk
''
