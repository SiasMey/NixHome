local setup_nvim_notify = function()
  require("notify").setup({
    timeout = 1000,
    max_height = function()
      return math.floor(vim.o.lines * 0.75)
    end,
    max_width = function()
      return math.floor(vim.o.columns * 0.75)
    end,
  })
  vim.notify = require("notify")
end

local function setup_lualine()
  require("lualine").setup({
    options = {
      theme = "gruvbox",
      globalstatus = true,
      disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch" },
      lualine_c = {
        {
          "filetype",
          icon_only = true,
          separator = "",
          padding = {
            left = 1,
            right = 0,
          },
        },
        -- { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
        -- stylua: ignore
      },
      lualine_x = {
          -- stylua: ignore
          --[[ {
              function() return require("noice").api.status.command.get() end,
              cond = function() require("noice").api.status.command.has() end,
              color = fg("Statement")
            },
            -- stylua: ignore
            {
              function() return require("noice").api.status.mode.get() end,
              cond = function() require("noice").api.status.mode.has() end,
              color = fg("Constant"),
            }, ]]
          -- { require("lazy.status").updates, cond = require("lazy.status").has_updates, color = fg("Special") },
          {
            "diff",
            symbols = {
              added = " ",
              modified = "柳",
              removed = " ",
            },
          },
      },
      lualine_y = {
        {
          "lsp_progress",
          display_components = { "lsp_client_name", "spinner", { "title", "percentage", "message" } },
        },
        { "progress", separator = " ", padding = { left = 1, right = 0 } },
        {
          "fileformat",
          symbols = {
            unix = "", -- e712
            dos = "", -- e70f
            mac = "", -- e711
          },
        },
      },
      -- lualine_z = {
      --   function()
      --     return " " .. os.date("%R")
      --   end,
      -- },
    },
  })
end

local M = {}
M.setup = function()
  setup_nvim_notify()
  setup_lualine()
end
return M
