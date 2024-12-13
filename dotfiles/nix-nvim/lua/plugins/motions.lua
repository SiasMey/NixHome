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
  vim.keymap.set("n", "em", function()
    require("leap.remote").action()
  end)
end

local function setup_hop()
  local hop = require("hop")
  hop.setup({ keys = "tnseriaogm" })
end

local function setup_treehopper()
  local tsht = require("tsht")
  tsht.config = {
    "t",
    "n",
    "s",
    "e",
    "r",
    "i",
    "a",
    "o",
    "g",
    "m",
  }
end

local M = {}
M.setup = function()
  setup_leap()
  setup_hop()
  setup_treehopper()
end
return M
