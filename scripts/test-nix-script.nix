{pkgs}:
pkgs.writeShellScriptBin "test-nix-script" ''
  echo "hello world"
''
