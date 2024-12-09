{ config, pkgs, ... }:

let
  workspace-diagnostics = pkgs.vimUtils.buildVimPlugin {
    name = "workspace-diagnostics.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "artemave";
      repo = "workspace-diagnostics.nvim";
      rev = "573ff93c47898967efdfbc6587a1a39e3c2d365e";
      hash = "sha256-lBj4KUPmmhtpffYky/HpaTwY++d/Q9socp/Ys+4VeX0=";
    };
  };
in
{
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.packages = [
    pkgs.gitui
    pkgs.uv

    # # Language Servers
    pkgs.basedpyright
    pkgs.bash-language-server
    pkgs.efm-langserver
    pkgs.golangci-lint-langserver
    pkgs.gopls
    pkgs.lua-language-server
    pkgs.marksman
    pkgs.nil
    pkgs.openscad-lsp
    pkgs.rust-analyzer
    pkgs.taplo
    pkgs.terraform-ls
    pkgs.yaml-language-server
    pkgs.earthlyls

    # # Language tools
    pkgs.ast-grep
    pkgs.beautysh
    pkgs.d2
    pkgs.mermaid-cli
    pkgs.nixfmt-rfc-style
    pkgs.nufmt
    pkgs.stylua
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
      cmp-nvim-lsp
      cmp-nvim-lsp-signature-help
      cmp-nvim-lua
      cmp-path
      cmp_luasnip
      dressing-nvim
      git-conflict-nvim
      git-worktree-nvim
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
      ssr-nvim
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
