local api = vim.api
-- Note: The functions used here will be upstreamed eventually.
local ts_utils = require("nvim-treesitter.ts_utils")

local function get_ast_nodes()
  local wininfo = vim.fn.getwininfo(api.nvim_get_current_win())[1]
  -- Get current TS node.
  local cur_node = ts_utils.get_node_at_cursor(0)
  if not cur_node then
    return
  end
  -- Get parent nodes recursively.
  local nodes = { cur_node }
  local parent = cur_node:parent()
  while parent do
    table.insert(nodes, parent)
    parent = parent:parent()
  end
  -- Create Leap targets from TS nodes.
  local targets = {}
  local startline, startcol
  for _, node in ipairs(nodes) do
    startline, startcol, _, _ = node:range() -- (0,0)
    if startline + 1 >= wininfo.topline then
      local target = { node = node, pos = { startline + 1, startcol + 1 } }
      table.insert(targets, target)
    end
  end
  if #targets >= 1 then
    return targets
  end
end

local function select_range(target)
  local mode = api.nvim_get_mode().mode
  if not mode:match("n?o") then
    -- Force going back to Normal (implies mode = v | V | ).
    vim.cmd("normal! " .. mode)
  end
  ts_utils.update_selection(
    0,
    target.node,
    mode:match("V") and "linewise" or mode:match("") and "blockwise" or "charwise"
  )
end

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
    require("leap").leap({
      targets = get_ast_nodes(),
      action = vim.api.nvim_get_mode().mode ~= "n" and select_range,
    })
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
