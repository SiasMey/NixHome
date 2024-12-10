{pkgs}:
pkgs.writeShellScriptBin "vss" ''
  set -e
  SCRIPT_NAME=$1

  cd ~/personal/NixHome/trunk/scripts
  if [ -f !"$SCRIPT_NAME.nix" ]; then
    echo "{pkgs}:pkgs.writeShellScriptBin \"$SCRIPT_NAME\" \'\'\n\'\'" > "$SCRIPT_NAME.nix"
  fi

  nvim "$SCRIPT_NAME.nix"
  git add "$SCRIPT_NAME.nix"
  git add ../shell-scripts.nix
  git commit -m "chore: update $SCRIPT_NAME config \nfrom $(uname -no) at $(date -Iseconds)\n$(home-manager generations | head -n 1)"

  nh home build ~/personal/NixHome/trunk

  nh home switch ~/personal/NixHome/trunk

  git push
''
