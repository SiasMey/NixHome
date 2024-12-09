{ pkgs, ... }:
{
  home.stateVersion = "24.05"; # Please read the comment before changing.

  fonts.fontconfig = {
    enable = true;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

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
    pkgs.kitty
    pkgs.kubectl
    pkgs.mermaid-cli
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.nushell
    pkgs.presenterm
    pkgs.python3Minimal
    pkgs.rustc
    pkgs.terraform
    pkgs.uv
    pkgs.zig
  ];

  home.file = {
    ".config/kitty".source = ./dotfiles/kitty;
  };

  programs.home-manager.enable = true;

  nix = {
    package = pkgs.nix;
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  programs.git = {
    enable = true;
    extraConfig = builtins.readFile ./dotfiles/git/gitconfig;
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
