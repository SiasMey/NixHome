{ config, pkgs, ... }:

{
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

    # # Language tools
    pkgs.stylua
    pkgs.nufmt
    pkgs.nixfmt-rfc-style
    pkgs.ast-grep
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
      neogen
      barbecue-nvim
      cmp-buffer
      cmp-cmdline
      cmp_luasnip
      cmp-nvim-lsp
      cmp-nvim-lsp-signature-help
      cmp-nvim-lua
      cmp-path
      dressing-nvim
      harpoon2
      indent-blankline-nvim
      leap-nvim
      leap-ast-nvim
      lspkind-nvim
      lualine-lsp-progress
      lualine-nvim
      luasnip
      nvim-cmp
      nvim-treesitter.withAllGrammars
      nvim-treesitter-context
      nvim-treesitter-textobjects
      nvim-treesitter-parsers.just
      nvim-nio
      nvim-navic
      nvim-lspconfig
      mini-nvim
      tokyonight-nvim
      oil-nvim
      refactoring-nvim
      ssr-nvim
      telescope-nvim
      telescope-lsp-handlers-nvim
      neotest
      neotest-python
      neotest-rust
      neotest-go
      lazydev-nvim
      nvim-notify
      gitsigns-nvim
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
