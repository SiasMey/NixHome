return {
  "folke/tokyonight.nvim",
  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    -- load the colorscheme here
    vim.cmd("colorscheme tokyonight")
  end,
}
--[[ return {
  "npxbr/gruvbox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd("colorscheme gruvbox")
  end,
  dependencies = { "rktjmp/lush.nvim" },
} ]]
-- return {
--   "catppuccin/nvim",
--   name = "catppuccin",
--   priority = 1000,
--   config = function()
--     vim.cmd("colorscheme catppuccin")
--   end,
-- }
