{pkgs, ...}: {
  home.stateVersion = "24.05"; # Please read the comment before changing.

  fonts.fontconfig = {
    enable = true;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  fonts.packages = [
  ];

  home.packages = [
    pkgs.alacritty
    pkgs.atuin
    pkgs.awscli2
    pkgs.bottom
    pkgs.cargo
    pkgs.dust
    pkgs.earthly
    pkgs.fastfetch
    pkgs.gitui
    pkgs.just
    pkgs.kubectl
    pkgs.mermaid-cli
    pkgs.presenterm
    pkgs.python3Minimal
    pkgs.rustc
    pkgs.terraform
    pkgs.uv
    pkgs.zig
  ];

  home.file = {
    # ".config/kitty".source = ./dotfiles/kitty;
  };


  programs.home-manager.enable = true;

  programs.kitty = {
    enable = true;
    pkgs.nerd-fonts.jetbrains-mono
  };

  nix = {
    package = pkgs.nix;
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  programs.git = {
    enable = true;
    userName = "Sias Mey";
    userEmail = "siasmey@gmail.com";
    extraConfig = {
      init.defaultBranch = "trunk";
      push.autoSetupRemote = true;
      pull.rebase = true;
      diff.tool = "nvim -d";
      core = {
        editor = "nvim";
        autocrlf = false;
        eol = "lf";
      };
    };
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.zsh = {
    enable = true;
    initExtra = builtins.readFile ./dotfiles/zsh/zshrc;
  };

  programs.starship = {
    enable = true;
  };

  programs.bat = {
    enable = true;
  };

  programs.zoxide = {
    enable = true;
  };

  programs.lsd = {
    enable = true;
    enableAliases = true;
  };

  programs.nh = {
    enable = true;
  };

  programs.jq = {
    enable = true;
  };

  programs.k9s = {
    enable = true;
  };

  programs.tealdeer = {
    enable = true;
  };

  programs.go = {
    enable = true;
  };

  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile ./dotfiles/tmux/tmux.conf;
  };
}
