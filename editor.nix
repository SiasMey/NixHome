{pkgs, ...}: {
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.packages = [
    pkgs.uv
    pkgs.gitui

    # # Language Servers
    pkgs.nil
    pkgs.golangci-lint-langserver
    pkgs.taplo
    pkgs.yaml-language-server
    pkgs.terraform-ls
    pkgs.bash-language-server
    pkgs.efm-langserver
    pkgs.marksman
    pkgs.gopls
    pkgs.lua-language-server
    pkgs.openscad-lsp
    pkgs.rust-analyzer
    pkgs.basedpyright
    pkgs.typos-lsp

    # # Language tools
    pkgs.stylua
    pkgs.nufmt
    pkgs.nixfmt-rfc-style
    pkgs.ast-grep
    pkgs.beautysh
    pkgs.alejandra
    pkgs.mdformat
    pkgs.yq
    pkgs.jq
    pkgs.fixjson
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
