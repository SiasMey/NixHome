return {
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      enable = true,
      max_lines = 0,
      min_window_height = 0,
      line_numbers = true,
      multiline_threshold = 20,
      trim_scope = "outer",
      mode = "cursor",
      separator = nil,
      zindex = 20,
      on_attach = nil
    }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    init = function()
      require("nvim-treesitter.configs").setup({
        auto_install = false,
        ensure_installed = {},
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        textobjects = {
          move = {
            enable = true,
            set_jumps = true,
            goto_previous_start = {
              ["<m-b>"] = "@class.outer",
              ["<m-p>"] = "@function.outer",
              ["<m-f>"] = "@parameter.inner",
              ["<m-w>"] = "@statement.outer",
            },
            goto_next_end = {
              ["<m-v>"] = "@class.outer",
              ["<m-d>"] = "@function.outer",
            },
            goto_next_start = {
              ["<m-c>"] = "@parameter.inner",
              ["<m-x>"] = "@statement.outer",
            }
          },
          swap = {
            enable = true,
            lookahead = false,
            swap_previous = {
              ["<m-c-b>"] = "@class.outer",
              ["<m-c-p>"] = "@function.outer",
              ["<m-c-f>"] = "@parameter.inner",
              ["<m-c-w>"] = "@statement.outer",
            },
            swap_next = {
              ["<m-c-v>"] = "@class.outer",
              ["<m-c-d>"] = "@function.outer",
              ["<m-c-c>"] = "@parameter.inner",
              ["<m-c-x>"] = "@statement.outer",
            },
          },
          select = {
            enable = false,
            lookahead = true,
            lookbehind = true,
            include_surrounding_whitespace = false,
            selection_modes = {
              ["@function.outer"] = "V",
              ["@function.inner"] = "V",
              ["@class.outer"] = "V",
              ["@class.inner"] = "V",
              ["@conditional.outer"] = "v",
              ["@conditional.inner"] = "v",
              ["@block.outer"] = "V",
              ["@block.inner"] = "V",
              ["@parameter.outer"] = "v",
              ["@parameter.inner"] = "v",
              ["@statement.outer"] = "v",
            },
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              ["ab"] = "@block.outer",
              ["ib"] = "@block.inner",
              ["as"] = "@statement.outer",
              ["ip"] = "@parameter.inner",
              ["ap"] = "@parameter.outer",
            },
          },
        },
      })
    end,
  },
  {
    "theprimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    init = function()
      require('refactoring').setup({
        -- prompt for return type
        prompt_func_return_type = {
          go = true,
          python = true
        },
        -- prompt for function parameters
        prompt_func_param_type = {
          go = true,
          python = true
        },
      })
    end,
  },
  {
    "echasnovski/mini.ai",
    init = function()
      local spec_treesitter = require('mini.ai').gen_spec.treesitter
      require('mini.ai').setup(
        {
          -- Table with textobject id as fields, textobject specification as values.
          -- Also use this to disable builtin textobjects. See |MiniAi.config|.
          custom_textobjects = {
            c = spec_treesitter({ a = '@class.outer', i = '@class.inner' }, { vis_mode = "V" }),
            f = spec_treesitter({ a = '@function.outer', i = '@function.inner' }, { vis_mode = "V" }),
            b = spec_treesitter({ a = '@block.outer', i = '@block.inner' }, { vis_mode = "v" }),
            s = spec_treesitter({ a = '@statement.outer', i = '@statement.outer' }, { vis_mode = "v" }),
            p = spec_treesitter({ a = '@parameter.outer', i = '@parameter.inner' }, { vis_mode = "v" }),
          },

          -- Module mappings. Use `''` (empty string) to disable one.
          mappings = {
            -- Main textobject prefixes
            around = 'a',
            inside = 'i',

            -- Next/last variants
            around_next = 'an',
            inside_next = 'in',
            around_last = 'al',
            inside_last = 'il',

            -- Move cursor to corresponding edge of `a` textobject
            goto_left = 'g[',
            goto_right = 'g]',
          },

          -- Number of lines within which textobject is searched
          n_lines = 50,

          -- How to search for object (first inside current line, then inside
          -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
          -- 'cover_or_nearest', 'next', 'previous', 'nearest'.
          search_method = 'cover_or_next',

          -- Whether to disable showing non-error feedback
          silent = false,
        }
      )
    end
  },
  -- indent guides for neovim
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "bufreadpost", "bufnewfile" },
    main = "ibl",
    opts = {
      exclude = {
        filetypes = { "help", "alpha", "dashboard", "neo-tree", "trouble", "lazy" },
      },
    },
  },
  {
    "cshuaimin/ssr.nvim",
    init = function()
      require("ssr").setup {
        border = "rounded",
        min_width = 50,
        min_height = 5,
        max_width = 120,
        max_height = 25,
        adjust_window = true,
        keymaps = {
          close = "q",
          next_match = "n",
          prev_match = "N",
          replace_confirm = "<cr>",
          replace_all = "<leader><cr>",
        },
      }
      vim.keymap.set({ "n", "x" }, "<leader>sr",
        function() require("ssr").open() end,
        { desc = "Structural find and replace" })
    end
  }
}
