local M = {
  'numToStr/FTerm.nvim',
  config = function()
    local fterm = require 'FTerm'
    vim.keymap.set('n', '<C-\\>', function()
      fterm:toggle()
    end, { desc = 'Toggle Terminal' })
    vim.keymap.set('t', '<C-\\>', function()
      fterm:toggle()
    end, { desc = 'Toggle Terminal' })
  end,
}

return M
