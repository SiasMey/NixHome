local augroup = vim.api.nvim_create_augroup("ManualFormatting", {})
vim.api.nvim_clear_autocmds({ group = augroup })

-- vim.api.nvim_create_autocmd("BufWritePost", {
--   pattern = { "*.py" },
--   group = augroup,
--   command = [[ silent !black --fast -q % ]],
-- })
--
-- vim.api.nvim_create_autocmd("BufWritePost", {
--   pattern = { "*.py" },
--   group = augroup,
--   command = [[ silent !isort -q % ]],
-- })

-- vim.api.nvim_create_autocmd("BufWritePost", {
--   pattern = { "*.py" },
--   group = augroup,
--   command = [[ silent !ruff --select="I" --fix -s % ]],
-- })

-- vim.api.nvim_create_autocmd("BufWritePost", {
--   pattern = { "*.md" },
--   group = augroup,
--   command = [[ silent !prettier -w % ]],
-- })
