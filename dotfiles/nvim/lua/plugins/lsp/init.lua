---@param upstream_on_attach fun(client, buffer)
local function on_attach(upstream_on_attach)
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local buffer = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      upstream_on_attach(client, buffer)
    end,
  })
end

return {
  -- lspconfig
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    init = function()
      require("lazydev").setup(
        {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          }
        }
      )
    end
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    ---@class PluginLspOpts
    opts = {
      -- options for vim.diagnostic.config()
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
      },
      -- Automatically format on save
      autoformat = false,
      -- options for vim.lsp.buf.format
      -- `bufnr` and `filter` is handled by the LazyVim formatter,
      -- but can be also overridden when specified
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
      inlay_hints = { enabled = true },
      -- LSP Server Settings
      ---@type lspconfig.options
      servers = {
        openscad_lsp = {
          settings = {},
        },
        yamlls = {
          settings = {},
        },
        efm = {
          init_options = {
            documentFormatting = true,
            documentRangeFormatting = false,
            hover = false,
            documentSymbol = false,
            codeAction = true,
            completion = false,
            linting = true,
          }
        },
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              check = {
                command = "clippy",
              },
            },
          },
        },
        ruff = {
        },
        nil_ls = {
          settings = {
            ['nil'] = {
              formatting = {
                command = { "nixfmt" },
              },
            },
          },
        },
        gopls = {
          settings = {
            gofumpt = true
          }
        },
        golangci_lint_ls = {
        },
        basedpyright = {
          settings = {
            basedpyright = {
              disableOrganizeImports = true,
              analysis = {
                autoImportCompletions = false,
                useLibraryCodeForTypes = true,
              }
            }
          }
        },
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
      },
      setup = {},
    },

    ---@param opts PluginLspOpts
    config = function(plugin, opts)
      require("plugins.lsp.format").autoformat = opts.autoformat

      on_attach(function(client, buffer)
        require("plugins.lsp.format").on_attach(client, buffer)
        require("plugins.lsp.keymaps").on_attach(client, buffer)
        require("plugins.lsp.navigation").on_attach(client, buffer)
      end)

      local servers = opts.servers
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

      local function setup(server)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, servers[server] or {})

        require("lspconfig")[server].setup(server_opts)
      end

      for server, server_opts in pairs(servers) do
        if server_opts then
          server_opts = server_opts == true and {} or server_opts
          setup(server)
        end
      end
    end,
  },

  { "artemave/workspace-diagnostics.nvim" },
}
