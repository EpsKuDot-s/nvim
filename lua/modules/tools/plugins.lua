local package = require('core.pack').package
local conf = require('modules.tools.config')

package({
  'kristijanhusak/vim-dadbod-ui',
  cmd = { 'DBUIToggle', 'DBUIAddConnection', 'DBUI', 'DBUIFindBuffer', 'DBUIRenameBuffer' },
  config = conf.vim_dadbod_ui,
  dependencies = { { 'tpope/vim-dadbod', opt = true } },
})

package({
  'folke/which-key.nvim',
  config = conf.which_key,
  event = "VeryLazy"
})
package({
  'rmagatti/auto-session',
  config = conf.auto_session,
  lazy = false
})

package({
  'numToStr/Comment.nvim',
  config = conf.comment,
  init = true
})
package({
  'gbprod/cutlass.nvim',
  config = conf.cutlass,
  lazy = false
})
-- package({
--   'glepnir/template.nvim',
--   config = conf.template_nvim
-- })
package({
  'CRAG666/code_runner.nvim',
  config = conf.code_runner,
  cmd = "RunCode"
})
package({
  'MarcHamamji/runner.nvim',
  config = conf.runner,
  ft = { 'typescript', 'html' },
  dependencies = {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }
  }
})
package({
  'xeluxee/competitest.nvim',
  config = conf.competitest,
  ft = 'cpp'
})
package({
  'nvim-pack/nvim-spectre',
  config = conf.spectre,
  init = true})
-- package({
--   'jghauser/papis.nvim',
--   config = conf.papis,
--   lazy = false,
--   -- ft = { "yaml"},
--   dependencies = {
--     "kkharji/sqlite.lua",
--     "nvim-lua/plenary.nvim",
--     "MunifTanjim/nui.nvim",
--     "nvim-treesitter/nvim-treesitter",
--   },
--   -- TODO: Reconfigure it
-- })
package({
  'matbme/JABS.nvim',
  config = conf.jabs,
  cmd = 'JABSOpen'
})
package({
  'numToStr/FTerm.nvim',
  config = conf.fterm,
  lazy = false
})
package({
  'ellisonleao/glow.nvim',
  config = conf.glow,
  cmd = 'Glow'
})
--package({
--  'lewis6991/satellite.nvim',
--  config = conf.satellite,
--  init = true
--})

-- package({
--  dir = '~/Documents/Neovim/kui-demo.nvim',
--  dependencies = {
--    { 'romgrk/kui.nvim' },
--  },
--  lazy = false
-- })

-- package({
--  'romgrk/kirby.nvim',
--  dependencies = {
--    { 'romgrk/fzy-lua-native',      build = 'make install' },
--    { 'romgrk/kui.nvim' },
--    { 'nvim-tree/nvim-web-devicons' },
--    { 'nvim-lua/plenary.nvim' },
--  },
--   config = conf.kirby,
--   lazy = false
-- })

package({
  'Wansmer/langmapper.nvim',
  lazy = false,
  priority = 1,
  config = conf.langmapper,
})
