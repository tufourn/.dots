local M = {
  'stevearc/oil.nvim',
  opts = {},
  config = function()
    local oil = require 'oil'
    oil.setup {}
    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
    vim.keymap.set('n', '<leader>-', function()
      oil.toggle_float()
    end, { desc = 'Open parent directory in floating window' })
  end,
}

return M
