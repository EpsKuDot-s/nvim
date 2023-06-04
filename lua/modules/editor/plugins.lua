local package = require('core.pack').package
local conf = require('modules.editor.config')

package({
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  config = conf.telescope,
  dependencies = {
    { 'nvim-lua/popup.nvim' },
    { 'nvim-lua/plenary.nvim' },
  },
})

package({
  'rmagatti/session-lens',
  dependencies = { 'rmagatti/auto-session', 'nvim-telescope/telescope.nvim' },
  config = conf.session_lens,
  lazy = false
})

package({
  'nvim-treesitter/nvim-treesitter',
  init = true,
  run = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    'windwp/nvim-ts-autotag',
    'HiPhish/nvim-ts-rainbow2'
  },
  config = conf.nvim_treesitter,
})
package({
  'nvim-treesitter/nvim-treesitter-context',
  dependencies = {
    'nvim-treesitter/nvim-treesitter'
  },
  init = true,
  config = conf.treesitter_context
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
