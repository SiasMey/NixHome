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

local setup_lazydev = function()
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

local servers = {
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
}

local setup_nvim_lsp = function()
  on_attach(function(client, buffer)
    require("plugins.lsp.format").on_attach(client, buffer)
    require("plugins.lsp.keymaps").on_attach(client, buffer)
    require("plugins.lsp.navigation").on_attach(client, buffer)
  end)

  local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

  local function setup(server)
    local server_opts = vim.tbl_deep_extend("force", {
      capabilities = vim.deepcopy(capabilities),
    }, servers[server] or {})

    require("lspconfig")[server].setup(server_opts)
  end

  for server, server_opts in pairs(servers) do
    if server_opts then
      setup(server)
    end
  end
end

local M = {}
M.setup = function()
  setup_lazydev()
  setup_nvim_lsp()
end
return M
