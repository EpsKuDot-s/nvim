local package = require('core.pack').package
local conf = require('modules.markdown.config')

package({
  'lukas-reineke/headlines.nvim',
  ft = 'markdown',
  config = conf.headlines,
  dependencies = {
    { 'nvim-treesitter/nvim-treesitter' },
  },
})
