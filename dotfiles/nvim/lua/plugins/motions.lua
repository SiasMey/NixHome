return {
  {
    "ggandor/leap.nvim",
    dependencies = {
      "ggandor/leap-ast.nvim",
    },
    init = function()
      local leap = require('leap')
      leap.opts.highlight_unlabeled_phase_one_targets = true

      -- vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' }) -- or some grey
      -- vim.api.nvim_set_hl(0, 'LeapMatch', {
      --   fg = 'white',
      --   bold = true,
      --   nocombine = true,
      -- })

      -- autocommands
      local augroup = vim.api.nvim_create_augroup("leap_fixes", { clear = true })
      -- Hide the (real) cursor when leaping, and restore it afterwards.
      vim.api.nvim_create_autocmd('User', {
        group = augroup,
        pattern = 'LeapEnter',
        callback = function()
          vim.cmd.hi('Cursor', 'blend=100')
          vim.opt.guicursor:append { 'a:Cursor/lCursor' }
        end,
      })

      vim.api.nvim_create_autocmd('User', {
        group = augroup,
        pattern = 'LeapLeave',
        callback = function()
          vim.cmd.hi('Cursor', 'blend=0')
          vim.opt.guicursor:remove { 'a:Cursor/lCursor' }
        end,
      })

      vim.keymap.set('n', 'm', '<Plug>(leap)')
      vim.keymap.set('n', 'M', function() require('leap-ast').leap() end)
      vim.keymap.set('n', 'em', function() require('leap.remote').action() end)
    end
  },
}
