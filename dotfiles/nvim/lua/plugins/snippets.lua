return {
  {
    "L3MON4D3/LuaSnip",
    event = "VeryLazy",
    init = function()
      local luasnip = require("luasnip")
      luasnip.setup(
        {
          history = true,
          update_events = "TextChanged,TextChangedI",
          enable_autosnippets = false,
        }
      )
      require("luasnip.loaders.from_lua").load({ paths = { "~/snippets" } })
      vim.keymap.set({ "i", "s" }, "<c-r>", function() luasnip.jump(-1) end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<c-t>", function() luasnip.jump(1) end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<c-s>", function()
        if luasnip.choice_active() then
          luasnip.change_choice(1)
        end
      end, { silent = true })
    end,
  },
  {
    {
      "danymat/neogen",
      init = function()
        local neogen = require("neogen")
        neogen.setup(
          {
            enabled = true,
            languages = {
              python = {
                template = {
                  annotation_convention = "google_docstrings"
                }
              }
            }
          }
        )
        vim.keymap.set({ "n" }, "<space>df", function() neogen.generate({ type = "func" }) end, { silent = true })
        vim.keymap.set({ "n" }, "<space>dc", function() neogen.generate({ type = "class" }) end, { silent = true })
      end
    }
  }
}
