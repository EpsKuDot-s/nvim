local package = require('core.pack').package
local conf = require('modules.ui.config')

local enable_indent_filetype = {
  'lua',
  'cpp',
  'javascript',
  'json',
  'java',
  'html',
  'typescript'
}

package({ 'lmburns/kimbox', config = conf.kimbox, lazy = false,priority = 2 })

-- package({ 'kvrohit/mellow.nvim', config = conf.mellow, lazy = false })

package({ 'goolord/alpha-nvim', config = conf.alpha, lazy = false,priority = 3 })

-- package({
--   'kyazdani42/nvim-web-devicons'
-- })
package({
  'windwp/windline.nvim',
  config = conf.windline,
  requires = 'kyazdani42/nvim-web-devicons',
  lazy = false
})

package({
  'lukas-reineke/indent-blankline.nvim',
  ft = enable_indent_filetype,
  config = conf.indent_blankline,
})

-- package({
--   'NvChad/nvim-colorizer.lua',
--   config = conf.colorizer,
--   init = true
-- })
package({
  'brenoprata10/nvim-highlight-colors',
  config = conf.highlight_colors,
  ft = {'css','scss', 'lua'}
})

package({
  'lewis6991/gitsigns.nvim',
  init = true,
  config = conf.gitsigns,
  dependencies = { 'nvim-lua/plenary.nvim' },
})

package({
  'kdheepak/lazygit.nvim',
  cmd = "LazyGit"
})

package({
  'nanozuki/tabby.nvim',
  config = conf.tabby,
  init = true
})
package({
  'tiagovla/scope.nvim',
  config = conf.scope,
  lazy = false
})

package({
  'SidOfc/carbon.nvim',
  config = conf.carbon,
  cmd = { 'Fcarbon', 'Carbon' }
})
