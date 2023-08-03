local package = require('core.pack').package
local conf = require('modules.lsp.config')
local lsp_ft = {
  'lua',
  'java',
  'html',
  'javascript',
  'typescript',
  'cpp',
  'css',
  'scss'
}
local dap_ft = {
  'java' 
}

package({
  'williamboman/mason.nvim',
  config = conf.mason,
  lazy = false
})


package({
  'williamboman/mason-lspconfig.nvim',
  config = conf.mason_lspconfig,
  lazy = false
})

package({
  'neovim/nvim-lspconfig',
  config = conf.nvim_lsp,
  lazy = false
})

package({
  'jose-elias-alvarez/typescript.nvim',
  config = conf.typescript,
  lazy = false
})

package({ 'weilbith/nvim-code-action-menu', config = conf.code_action, cmd = 'CodeActionMenu' })

package({ 'rcarriga/nvim-dap-ui', config = conf.dap_ui, lazy = true })

package({
  'mfussenegger/nvim-dap',
  ft = dap_ft,
  dependencies = {
    'rcarriga/nvim-dap-ui'
  }
})

package(
  { 'onsails/lspkind.nvim', config = conf.lspkind, lazy = true }
)
package({
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  config = conf.nvim_cmp,
  dependencies = {
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-buffer' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'onsails/lspkind.nvim' }
  },
})
package({
  'folke/trouble.nvim', config = conf.trouble, cmd = 'Trouble',
})
package({
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "folke/trouble.nvim" },
  config = conf.todo,
  cmd = 'TodoQuickFix'
})

package({ 'L3MON4D3/LuaSnip', event = 'InsertCharPre', config = conf.lua_snip })

package({ 'windwp/nvim-autopairs', event = 'InsertEnter', config = conf.auto_pairs })

package({ 'mfussenegger/nvim-jdtls', ft = 'java', config = conf.jdtls })

package({ 'dnlhc/glance.nvim', after = 'nvim-lspconfig', event = 'BufRead', config = conf.glance })

package({
  'VidocqH/lsp-lens.nvim',
  config = function()
    require 'lsp-lens'.setup({
      include_declaration = true, -- Reference include declaration
      sections = {
        definition = true,
        references = true,
        implementation = true,
      },
    })
  end,
  lazy = false
})
