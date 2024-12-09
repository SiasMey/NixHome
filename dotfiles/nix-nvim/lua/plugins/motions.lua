local function setup_leap()
  local leap = require("leap")
  leap.opts.highlight_unlabeled_phase_one_targets = true

  local augroup = vim.api.nvim_create_augroup("leap_fixes", { clear = true })
  vim.api.nvim_create_autocmd("User", {
    group = augroup,
    pattern = "LeapEnter",
    callback = function()
      vim.cmd.hi("Cursor", "blend=100")
      vim.opt.guicursor:append({ "a:Cursor/lCursor" })
    end,
  })

  vim.api.nvim_create_autocmd("User", {
    group = augroup,
    pattern = "LeapLeave",
    callback = function()
      vim.cmd.hi("Cursor", "blend=0")
      vim.opt.guicursor:remove({ "a:Cursor/lCursor" })
    end,
  })

  vim.keymap.set("n", "m", "<Plug>(leap)")
  vim.keymap.set("n", "M", function()
    require("leap-ast").leap()
  end)
  vim.keymap.set("n", "em", function()
    require("leap.remote").action()
  end)
end

local M = {}
M.setup = function()
  setup_leap()
end
return M
