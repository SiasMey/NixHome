return {
  -- fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    cmd = "Telescope",
    version = false, -- telescope did only one release, so use HEAD for now
    dependencies = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "gbrlsnchs/telescope-lsp-handlers.nvim" }
      -- { "folke/trouble.nvim" },
    },
    init = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")
      telescope.load_extension("lsp_handlers")

      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<C-y>"] = "select_default",
              ["<C-h>"] = "move_selection_next",
              ["<C-l>"] = "move_selection_previous",
              ["<C-n>"] = "close",
            },
            n = {
              ["<C-y>"] = "select_default",
              ["<C-h>"] = "move_selection_next",
              ["<C-l>"] = "move_selection_previous",
              ["<C-n>"] = "close",
            },
          },
        },
      })

      vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>b", "<cmd>Telescope buffers<cr>", { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true })
      -- vim.api.nvim_set_keymap("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { noremap = true, silent = true })
      vim.keymap.set(
        "n",
        "<leader>dd",
        "<cmd>Telescope diagnostics<cr>",
        { noremap = true, silent = true }
      )
      vim.keymap.set(
        "n",
        "<leader>fws",
        "<cmd>Telescope lsp_workspace_symbols<cr>",
        { noremap = true, silent = true }
      )
      vim.keymap.set(
        "n",
        "<leader>fdf",
        function() builtin.treesitter({ symbols = "function" }) end,
        { noremap = true, silent = true }
      )
      vim.keymap.set(
        "n",
        "<leader>fdc",
        function() builtin.treesitter({ symbols = "class" }) end,
        { noremap = true, silent = true }
      )
      vim.keymap.set(
        "n",
        "zs",
        "<cmd>Telescope spell_suggest<cr>",
        { noremap = true, silent = true }
      )
    end,
  },
}
