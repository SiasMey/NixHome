if true then
  return {}
end

return {
  {
    dir = "~/personal/utils.nvim",
    event = "VeryLazy",
    config = function()
      local utils = require("utils")
      vim.keymap.set("n", "<leader>q", utils.toggle_qf, { desc = "Toggle QF" })

      local git_cmp = require("git_cmp")
      require("cmp").register_source("git", git_cmp.new())
    end
  },
  -- {
  --   dir = "~/personal/ztr-lsp.nvim",
  --   event = "VeryLazy",
  --   init = function()
  --     require("ztr-lsp").setup({})
  --   end
  -- },
}
