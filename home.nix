{ config, pkgs, ... }:

{
  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = [
    pkgs.python3Minimal
    pkgs.terraform
    pkgs.kitty
    pkgs.alacritty
    pkgs.atuin
    pkgs.tmux
    pkgs.just
    pkgs.kubectl
    pkgs.awscli2
    pkgs.presenterm
    pkgs.rustc
    pkgs.cargo
    pkgs.fastfetch
    pkgs.dust
    pkgs.earthly
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/kitty".source = ./dotfiles/kitty;
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/meysi/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
    FLAKE = "/Users/meysi/.config/home-manager";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  nix = {
    package = pkgs.nix;
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  programs.fzf = {
    enable = true;
  };

  programs.git = {
    enable = true;
    includes = [ { path = "./dotfiles/git/gitconfig"; } ];
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

  programs.ripgrep = {
    enable = true;
  };

  programs.fd = {
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
}
