{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "meysi";
  home.homeDirectory = "/home/meysi";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  fonts.fontconfig = {
    enable = true;
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    pkgs.python3Minimal
    pkgs.uv
    pkgs.terraform
    pkgs.kitty
    pkgs.alacritty
    pkgs.atuin
    pkgs.just
    pkgs.kubectl
    pkgs.awscli2
    pkgs.mermaid-cli
    pkgs.presenterm
    pkgs.dust
    pkgs.gitui
    pkgs.rustc
    pkgs.cargo
    pkgs.zig
    pkgs.nixfmt-rfc-style
    pkgs.fastfetch

    # fonts
    pkgs.nerd-fonts.jetbrains-mono

    # # gaming
    pkgs.gamescope
    pkgs.mangohud
    pkgs.protonup
    pkgs.lutris
    pkgs.webcord
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
    ".config/kitty".source = ./dotfiles/kitty;
    ".config/aerospace".source = ./dotfiles/aerospace;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
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
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
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
