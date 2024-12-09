local M = {}

function M.format()
  local buf = vim.api.nvim_get_current_buf()

  local ft = vim.bo[buf].filetype

  vim.lsp.buf.format({ bufnr = buf, async = false })

  if ft == "python" then
    vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' }, diagnostics = {} }, apply = true })
  end
end

function M.on_attach(client, buf)
  -- dont format if client disabled it
  if
      client.config
      and client.config.capabilities
      and client.config.capabilities.documentFormattingProvider == false
  then
    return
  end

  if client.supports_method("textDocument/formatting") then
    -- vim.api.nvim_create_autocmd("BufWritePre", {
    --   group = vim.api.nvim_create_augroup("LspFormat." .. buf, {}),
    --   buffer = buf,
    --   callback = function()
    --     if M.autoformat then
    --       M.format()
    --     end
    --   end,
    -- })
  end
end

return M
