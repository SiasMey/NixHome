if true then
  return {}
end

local M = {}

M.toggle_qf = function()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      qf_exists = true
    end
  end
  if qf_exists == true then
    vim.cmd "cclose"
    return
  end
  if not vim.tbl_isempty(vim.fn.getqflist()) then
    vim.cmd "copen"
  end
end
vim.keymap.set("n", "<leader>q", M.toggle_qf, { desc = "Toggle QF" })

return {
  {
    dir = "~/personal/utils.nvim",
    event = "VeryLazy",
    config = function()
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
