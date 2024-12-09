{pkgs, ...}: let
  workspace-diagnostics = pkgs.vimUtils.buildVimPlugin {
    name = "workspace-diagnostics.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "artemave";
      repo = "workspace-diagnostics.nvim";
      rev = "573ff93c47898967efdfbc6587a1a39e3c2d365e";
      hash = "sha256-lBj4KUPmmhtpffYky/HpaTwY++d/Q9socp/Ys+4VeX0=";
    };
  };
in {
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.packages = [
    # # Language Servers
    # # Language tools
    pkgs.alejandra
    pkgs.ast-grep
    pkgs.basedpyright
    pkgs.bash-language-server
    pkgs.beautysh
    pkgs.d2
    pkgs.earthlyls
    pkgs.efm-langserver
    pkgs.fixjson
    pkgs.gitui
    pkgs.golangci-lint-langserver
    pkgs.gopls
    pkgs.jq
    pkgs.lua-language-server
    pkgs.marksman
    pkgs.mdformat
    pkgs.mermaid-cli
    pkgs.nil
    pkgs.nixfmt-rfc-style
    pkgs.nufmt
    pkgs.openscad-lsp
    pkgs.rust-analyzer
    pkgs.stylua
    pkgs.taplo
    pkgs.terraform-ls
    pkgs.typos-lsp
    pkgs.uv
    pkgs.yaml-language-server
    pkgs.yq
  ];

  programs.fzf = {
    enable = true;
  };

  programs.ripgrep = {
    enable = true;
  };

  programs.fd = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      barbecue-nvim
      cmp-buffer
      cmp-cmdline
      cmp_luasnip
      cmp-nvim-lsp
      cmp-nvim-lsp-signature-help
      cmp-nvim-lua
      cmp-path
      conform-nvim
      dressing-nvim
      git-conflict-nvim
      gitsigns-nvim
      grug-far-nvim
      harpoon2
      indent-blankline-nvim
      lazydev-nvim
      leap-ast-nvim
      leap-nvim
      lspkind-nvim
      lualine-lsp-progress
      lualine-nvim
      luasnip
      mini-nvim
      neogen
      neotest
      neotest-go
      neotest-python
      neotest-rust
      nvim-cmp
      nvim-lspconfig
      nvim-navic
      nvim-nio
      nvim-notify
      nvim-treesitter-context
      nvim-treesitter-parsers.just
      nvim-treesitter-textobjects
      nvim-treesitter.withAllGrammars
      oil-nvim
      refactoring-nvim
      telescope-lsp-handlers-nvim
      telescope-nvim
      tokyonight-nvim
      workspace-diagnostics
    ];

    extraLuaConfig = ''
      require("config")
      require("plugins")
    '';
  };

  xdg.configFile."nvim" = {
    recursive = true;
    source = ./dotfiles/nix-nvim;
  };
}
