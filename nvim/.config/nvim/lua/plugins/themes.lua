local M = {
  -- Themery for switching
  {
    'zaldih/themery.nvim',
    lazy = false,
    -- priority must be lower than the themes
    priority = 900,
    config = function()
      local available_colorschemes = vim.fn.getcompletion('', 'color')
      local colorschemes = {}
      for _, colorscheme in ipairs(available_colorschemes) do
        table.insert(colorschemes, colorscheme)
      end

      require('themery').setup {
        themes = colorschemes,
        livePreview = true,
      }
    end,
  },

  -- themes
  {
    'NLKNguyen/papercolor-theme',
    lazy = false,
    priority = 1000,
  },
  {
    'rose-pine/neovim',
    lazy = false,
    priority = 1000,
  },
  {
    'projekt0n/github-nvim-theme',
    lazy = false,
    priority = 1000,
  },
  {
    'catppuccin/nvim',
    lazy = false,
    priority = 1000,
  },
}

return M
