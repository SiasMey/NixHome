return {
  {
    "L3MON4D3/LuaSnip",
    event = "VeryLazy",
    opts = {
      history = true,
      update_events = "TextChanged,TextChangedI",
      -- see :h User, event should never be triggered(except if it is `doautocmd`'d)
      enable_autosnippets = false,

      -- globals injected into luasnippet-files.
      --    snip_env = {
      --      s = require("luasnip.nodes.snippet").S,
      --      sn = require("luasnip.nodes.snippet").SN,
      --      t = require("luasnip.nodes.textNode").T,
      --      f = require("luasnip.nodes.functionNode").F,
      --      i = require("luasnip.nodes.insertNode").I,
      --      c = require("luasnip.nodes.choiceNode").C,
      --      d = require("luasnip.nodes.dynamicNode").D,
      --      r = require("luasnip.nodes.restoreNode").R,
      --      l = require("luasnip.extras").lambda,
      --      rep = require("luasnip.extras").rep,
      --      p = require("luasnip.extras").partial,
      --      m = require("luasnip.extras").match,
      --      n = require("luasnip.extras").nonempty,
      --      dl = require("luasnip.extras").dynamic_lambda,
      --      fmt = require("luasnip.extras.fmt").fmt,
      --      fmta = require("luasnip.extras.fmt").fmta,
      --      conds = require("luasnip.extras.expand_conditions"),
      --      types = require("luasnip.util.types"),
      --      events = require("luasnip.util.events"),
      --      parse = require("luasnip.util.parser").parse_snippet,
      --      ai = require("luasnip.nodes.absolute_indexer"),
      --    },
    },
    -- keys = {},
    init = function()
      require("luasnip.loaders.from_lua").load({ paths = { "~/snippets" } })
      local luasnip = require("luasnip")
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
      dependencies = "nvim-treesitter/nvim-treesitter",
      config = true,
      opts = {
        enabled = true,
        languages = {
          python = {
            template = {
              annotation_convention = "google_docstrings"
            }
          }
        }
      },
      init = function()
        local neogen = require("neogen")
        vim.keymap.set({ "n" }, "<space>df", function() neogen.generate({ type = "func" }) end, { silent = true })
        vim.keymap.set({ "n" }, "<space>dc", function() neogen.generate({ type = "class" }) end, { silent = true })
      end
    }
  }
}
