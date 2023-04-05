local package = require('core.pack').package
local conf = require('modules.editor.config')

package({
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  config = conf.telescope,
  dependencies = {
    { 'nvim-lua/popup.nvim' },
    { 'nvim-lua/plenary.nvim' },
    { 'rmagatti/session-lens' }
  },
})

package({
  'nvim-treesitter/nvim-treesitter',
  init = true,
  run = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    'windwp/nvim-ts-autotag',
    -- 'mrjones2014/nvim-ts-rainbow'
  },
  config = conf.nvim_treesitter,
})
package({
  'kevinhwang91/nvim-ufo',
  init = true,
  config = conf.nvim_ufo,
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'kevinhwang91/promise-async'
  }
})
