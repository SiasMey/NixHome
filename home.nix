{pkgs, ...}: {
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
    pkgs.kubectl
    pkgs.mermaid-cli
    pkgs.presenterm
    pkgs.python3Minimal
    pkgs.rustc
    pkgs.terraform
    pkgs.uv
    pkgs.zig
    pkgs.nerd-fonts.jetbrains-mono
  ];

  home.file = {
    # ".config/kitty".source = ./dotfiles/kitty;
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

  programs.kitty = {
    enable = true;
    font = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font";
      size = 18;
    };
    settings = {
      hide_window_decorations = true;
      macos_option_as_alt = true;
      macos_quit_when_last_window_closed = true;
    };
    themeFile = "Catppuccin-Mocha";
  };

  programs.alacritty = {
    enable = true;
    settings = {
      live_config_reload = true;
      window = {
        decorations = "buttonless";
        startup_mode = "Fullscreen";
        option_as_alt = "Both";
        padding = {
          x = 0;
          y = 0;
        };
      };
      font = {
        normal = {
          family = "JetBrainsMono Nerd Font Mono";
          style = "Regular";
        };
        bold = {
          family = "JetBrainsMono Nerd Font Mono";
          style = "Bold";
        };
        italic = {
          family = "JetBrainsMono Nerd Font Mono";
          style = "Italic";
        };
        size = 18;
        offset = {
          x = 0;
          y = 0;
        };
        glyph_offset = {
          x = 0;
          y = 0;
        };
      };
      keydoard.binings = [
        {
          key = "F";
          mods = "Control|Command";
          action = "ToggleFullscreen";
        }
        {
          key = "Q";
          mods = "Command";
          action = "ReceiveChar";
        }
        {
          key = "N";
          mods = "Command";
          action = "ReceiveChar";
        }
        {
          key = "W";
          mods = "Command";
          action = "ReceiveChar";
        }

        # scrollback
        {
          key = "PageUp";
          mods = "Shift";
          mode = "~Alt";
          action = "ReceiveChar";
        }
        {
          key = "PageDown";
          mods = "Shift";
          mode = "~Alt";
          action = "ReceiveChar";
        }
        {
          key = "Home";
          mods = "Shift";
          mode = "~Alt";
          action = "ReceiveChar";
        }
        {
          key = "End";
          mods = "Shift";
          mode = "~Alt";
          action = "ReceiveChar";
        }
        {
          key = "K";
          mods = "Command";
          mode = "~Vi|Search";
          action = "ReceiveChar";
        }

        # searching
        {
          key = "F";
          mods = "Control|Shift";
          mode = "~Search";
          action = "ReceiveChar";
        }
        {
          key = "F";
          mods = "Command";
          mode = "~Search";
          action = "ReceiveChar";
        }
        {
          key = "B";
          mods = "Control|Shift";
          mode = "~Search";
          action = "ReceiveChar";
        }
        {
          key = "B";
          mods = "Command";
          mode = "~Search";
          action = "ReceiveChar";
        }

        # copy/paste
        {
          key = "Paste";
          action = "ReceiveChar";
        }
        {
          key = "Copy";
          action = "ReceiveChar";
        }
        {
          key = "V";
          mods = "Control|Shift";
          mode = "~Vi";
          action = "ReceiveChar";
        }
        {
          key = "V";
          mods = "Command";
          action = "Paste";
        }

        {
          key = "C";
          mods = "Control|Shift";
          action = "ReceiveChar";
        }
        {
          key = "C";
          mods = "Command";
          action = "ReceiveChar";
        }
        {
          key = "V";
          mods = "Command|Shift";
          mode = "~Vi";
          action = "ReceiveChar";
        }
        {
          key = "C";
          mods = "Control|Shift";
          mode = "~Vi|~Search";
          action = "ReceiveChar";
        }
        {
          key = "C";
          mods = "Command";
          mode = "~Vi|~Search";
          action = "ReceiveChar";
        }
      ];
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
