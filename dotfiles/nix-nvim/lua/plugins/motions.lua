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

  vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
  vim.api.nvim_set_hl(0, "LeapMatch", { fg = "magenta", bold = true, italic = true, nocombine = true })
  vim.api.nvim_set_hl(0, "LeapLabel", { fg = "red", bold = true, italic = true, nocombine = true })

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
  local tsht = require("plugins.motions-treehopper")
  vim.keymap.set("n", "M", function()
    tsht.move({ side = "start" })
  end)
end

local M = {}
M.setup = function()
  setup_leap()
  -- setup_hop()
  -- setup_treehopper()
end
return M
