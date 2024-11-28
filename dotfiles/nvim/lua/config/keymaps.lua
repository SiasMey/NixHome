vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>s", "<c-^>")
vim.keymap.set("n", "Y", "y$")

vim.keymap.set("n", "l", "<Nop>")
vim.keymap.set("n", "h", "<Nop>")
vim.keymap.set("n", "<c-l>", "<Nop>")
vim.keymap.set("n", "<c-h>", "<Nop>")
vim.keymap.set("i", "<c-l>", "<Nop>")
vim.keymap.set("i", "<c-h>", "<Nop>")
vim.keymap.set("i", "<c-n>", "<Nop>")

vim.keymap.set("i", "<c-l>", "<c-p>")
vim.keymap.set("i", "<c-h>", "<c-n>")
vim.keymap.set("i", "<c-n>", "<c-x>")

-- Marks
vim.keymap.set("n", "M", "<Nop>")
vim.keymap.set("n", "m", "<Nop>")

vim.keymap.set("n", "<leader>m", "m", { desc = "Set Mark" })
vim.keymap.set("n", "<M-a>", "'a", { desc = "Goto Mark a" })
vim.keymap.set("n", "<M-r>", "'r", { desc = "Goto Mark r" })
vim.keymap.set("n", "<M-s>", "'s", { desc = "Goto Mark s" })
vim.keymap.set("n", "<M-t>", "'t", { desc = "Goto Mark t" })
vim.keymap.set("n", "<M-g>", "'g", { desc = "Goto Mark g" })

vim.keymap.set("c", "<c-y>", "<c-m>")

-- navigation
vim.keymap.set("n", "<c-d>", "<Nop>")
vim.keymap.set("n", "<c-u>", "<Nop>")

vim.keymap.set("n", "l", "k^")
vim.keymap.set("n", "h", "j^")

vim.keymap.set("v", "j", "<Nop>")
vim.keymap.set("v", "k", "<Nop>")
vim.keymap.set("v", "<c-d>", "<Nop>")
vim.keymap.set("v", "<c-u>", "<Nop>")
vim.keymap.set("v", "<c-j>", "<c-u>")
vim.keymap.set("v", "<c-k>", "<c-d>")
vim.keymap.set("v", "l", "k")
vim.keymap.set("v", "h", "j")

vim.keymap.set("n", "<leader>xt", ":!chmod +x %<Enter>")
vim.keymap.set("n", "<leader>n", ":Note<Enter>")
vim.keymap.set("n", "<leader>t", ':silent !tmux display-popup -E -d $(pwd) -h 90\\% -w 90\\% "gitui"<Enter>')

vim.keymap.set("n", "<leader>gc", ':silent !tmux display-popup -E -d $(pwd) "git commit"<Enter>',
  { desc = "Git: Create git commit" })
vim.keymap.set("n", "<leader>gs", ':!git status -s<Enter>', { desc = "Git: Show status" })
vim.keymap.set("n", "<leader>gl", ':silent !tmux display-popup -E -d $(pwd) "git log -n 5 --pretty=medium"<Enter>',
  { desc = "Git: Show log" })

vim.keymap.set("n", "<space>b", ':silent make %<Enter>')
vim.keymap.set("n", "<space>p", ':silent make .<Enter>')
vim.keymap.set("n", "<space>tt", ':silent TmuxTest<Enter>')

vim.keymap.set("n", "<M-j>", ":cprev<Enter>")
vim.keymap.set("n", "<M-k>", ":cnext<Enter>")

vim.keymap.set("o", "i_", ":<c-u>silent! normal! t_T_vt_<cr>", { desc = "Inside _" })
vim.keymap.set("o", "a_", ":<c-u>silent! normal! f_F_vf_<cr>", { desc = "Around _" })
vim.keymap.set("o", "i-", ":<c-u>silent! normal! t-T-vt-<cr>", { desc = "Inside -" })
vim.keymap.set("o", "a-", ":<c-u>silent! normal! f-F-vf-<cr>", { desc = "Around -" })

vim.keymap.set("o", "il", ":<c-u>silent! normal! $v^<cr>", { desc = "Inside current line" })
vim.keymap.set("o", "al", ":<c-u>silent! normal! $v0<cr>", { desc = "Around current line" })
vim.keymap.set("x", "il", ":<c-u>silent! normal! $v^<cr>", { desc = "Inside current line" })
vim.keymap.set("x", "al", ":<c-u>silent! normal! $v0<cr>", { desc = "Around current line" })

vim.keymap.set("n", "w", "", { desc = "unset" })
vim.keymap.set("n", "b", "", { desc = "unset" })

-- vim.keymap.set("n", "<C-M-w>", ":move-2<CR>==", { desc = "move line up" })
-- vim.keymap.set("n", "<C-M-x>", ":move+1<CR>==", { desc = "move line down" })
-- vim.keymap.set("i", "<C-M-w>", "<Esc>:move-2<CR>==gi", { desc = "move line up" })
-- vim.keymap.set("i", "<C-M-x>", "<Esc>:move+1<CR>==gi", { desc = "move line down" })
vim.keymap.set("v", "<C-M-w>", ":move'<-2<CR>==gv", { desc = "move selection up" })
vim.keymap.set("v", "<C-M-x>", ":move'>+1<CR>==gv", { desc = "move selection down" })

toggle_qf = function()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      qf_exists = true
    end
  end
  if qf_exists == true then
    vim.cmd "cclose"
    return
  end
  if not vim.tbl_isempty(vim.fn.getqflist()) then
    vim.cmd "copen"
  end
end
vim.keymap.set("n", "<leader>q", toggle_qf, { desc = "Toggle QF" })
