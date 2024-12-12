{
  pkgs,
  home,
}:
pkgs.writeShellScriptBin "vss" ''
  set -e
  SCRIPT_NAME=$1

  cd "${home.homeDir}/personal/NixHome/trunk"
  if [ -f !"$SCRIPT_NAME.nix" ]; then
    echo "{pkgs}:pkgs.writeShellScriptBin \"$SCRIPT_NAME\" \'\'\n\'\'" > "$SCRIPT_NAME.nix"
  fi

  nvim "$SCRIPT_NAME.nix"
  git add .

  temp_file=$(mktemp)
  echo "chore: update shell script $SCRIPT_NAME" >> $temp_file
  echo "" >> $temp_file
  echo "" >> $temp_file
  echo "from: $(uname -no)" >> $temp_file
  echo "$(home-manager generations | head -n 1)" >> $temp_file

  git commit -F $temp_file
  rm $temp_file

  nh home build ${home.homeDir}/personal/NixHome/trunk

  nh home switch ${home.homeDir}/personal/NixHome/trunk

  git push
''
