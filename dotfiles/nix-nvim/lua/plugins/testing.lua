local setup_neotest = function()
  local neotest_ns = vim.api.nvim_create_namespace("neotest")
  vim.diagnostic.config({
    virtual_text = {
      format = function(diagnostic)
        local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
        return message
      end,
    },
  }, neotest_ns)
  require("neotest").setup({
    adapters = {
      require("neotest-python")({
        -- args = { "--tb=line" },
        runner = "pytest",
      }),
      require("neotest-rust"),
      require("neotest-go")({
        experimental = {
          test_table = false,
        },
      }),
    },
    benchmark = {
      enabled = false,
    },
    default_strategy = "integrated",
    discovery = {
      concurrent = 0,
      enabled = true,
    },
    floating = {
      border = "rounded",
      max_height = 0.6,
      max_width = 0.6,
      options = {},
    },
    highlights = {
      adapter_name = "NeotestAdapterName",
      border = "NeotestBorder",
      dir = "NeotestDir",
      expand_marker = "NeotestExpandMarker",
      failed = "NeotestFailed",
      file = "NeotestFile",
      focused = "NeotestFocused",
      indent = "NeotestIndent",
      marked = "NeotestMarked",
      namespace = "NeotestNamespace",
      passed = "NeotestPassed",
      running = "NeotestRunning",
      select_win = "NeotestWinSelect",
      skipped = "NeotestSkipped",
      target = "NeotestTarget",
      test = "NeotestTest",
      unknown = "NeotestUnknown",
    },
    icons = {
      child_indent = "│",
      child_prefix = "├",
      collapsed = "─",
      expanded = "╮",
      failed = "",
      final_child_indent = " ",
      final_child_prefix = "╰",
      non_collapsible = "─",
      passed = "",
      running = "",
      running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
      skipped = "",
      unknown = "",
    },
    jump = {
      enabled = true,
    },
    log_level = 3,
    diagnostic = {
      enabled = false,
      severity = 99,
    },
    output = {
      enabled = true,
    },
    output_panel = {
      enabled = false,
    },
    quickfix = {
      enabled = true,
    },
    projects = {},
    run = {
      enabled = true,
    },
    running = {
      concurrent = true,
    },
    status = {
      enabled = false,
      signs = false,
      virtual_text = true,
    },
    strategies = {
      integrated = {
        height = 40,
        width = 120,
      },
    },
    summary = {
      animated = false,
      enabled = true,
      expand_errors = true,
      follow = true,
      mappings = {
        attach = "a",
        clear_marked = "M",
        clear_target = "T",
        expand = { "<CR>", "<2-LeftMouse>" },
        expand_all = "e",
        jumpto = "i",
        mark = "m",
        next_failed = "J",
        output = "o",
        prev_failed = "K",
        run = "r",
        run_marked = "R",
        short = "O",
        stop = "u",
        target = "t",
      },
    },
  })

  local keymap = vim.keymap.set
  local neotest = require("neotest")

  keymap("n", "<space>ts", function()
    neotest.summary.toggle()
  end, { silent = true })
  keymap("n", "<space>tm", function()
    neotest.summary.run_marked()
  end, { silent = true })
  keymap("n", "<space>tr", function()
    neotest.run.run({ suite = true })
  end, { silent = true })
  keymap("n", "<space>tf", function()
    neotest.run.run(vim.fn.expand("%"))
  end, { silent = true })
  keymap("n", "<space>tl", function()
    neotest.run.run_last()
  end, { silent = true })

  local augroup = vim.api.nvim_create_augroup("TestExecution", {})
  vim.api.nvim_clear_autocmds({ group = augroup })

  vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = { "*.py", "*.rs", "*.go" },
    group = augroup,
    callback = function()
      neotest.summary.run_marked()
    end,
  })
end

local M = {}
M.setup = function()
  setup_neotest()
end
return M
