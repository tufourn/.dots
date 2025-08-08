local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  require 'plugins/themes',
  require 'plugins/lsp',
  require 'plugins/dap',
  require 'plugins/aerial',
  require 'plugins/harpoon',
  require 'plugins/telescope',
  require 'plugins/undotree',
  require 'plugins/cmp',
  require 'plugins/git',
  require 'plugins/oil',
  require 'plugins/comments',
  require 'plugins/terminal',
  require 'plugins/formatting',
  require 'plugins/mini',
  require 'plugins/treesitter',
  require 'plugins/which-key',
  require 'plugins/flash',
}
