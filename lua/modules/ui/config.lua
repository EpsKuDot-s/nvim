local config = {}

function config.kimbox()
  require("modules.ui.kimbox")
end

function config.mellow()
  vim.g.mellow_italic_comments = true
  vim.g.mellow_italic_keywords = true
  vim.g.mellow_italic_functions = true
  vim.g.mellow_bold_functions = true
  vim.cmd [[colorscheme mellow]]
end

function config.windline()
  require("modules.ui.windline")
end

function config.gitsigns()
  require('gitsigns').setup({
    signs      = {
      add          = { text = '│' },
      change       = { text = '│' },
      delete       = { text = '_' },
      topdelete    = { text = '‾' },
      changedelete = { text = '~' },
      untracked    = { text = '┆' },
    },
    signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
    numhl      = true, -- Toggle with `:Gitsigns toggle_numhl`
    linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff  = true,
  })
end

function config.indent_blankline()
  -- vim.opt.listchars:append "tab:▶"
  vim.opt.listchars:append "eol:󱞣"
  vim.opt.listchars:append "space:⋅"
  vim.opt.list = true
  require("ibl").setup({
    scope = { enabled = false },
  })
end

function config.alpha()
  require("modules.ui.alpha")
end

function config.tabby()
  require("modules.ui.tabby")
end

function config.highlight_colors()
  require('nvim-highlight-colors').setup {
    enable_named_colors = true,
    enable_tailwind = false,
  }
end

function config.carbon()
  require('carbon').setup({
    always_reveal = true,
    auto_reveal = true,
    auto_open = false,
    indicators = { collapse = '▾', expand = '▸' },
    actions = {
      up = '[',
      down = ']',
      quit = 'q',
      edit = '<cr>',
      move = 'm',
      reset = 'u',
      split = { '<c-x>', '<c-s>' },
      vsplit = '<c-v>',
      create = { 'c', '%' },
      delete = 'd',
      close_parent = '-',
      toggle_recursive = '!',
    },
  })
end

function config.neogit()
  local neogit = require('neogit')

  neogit.setup {}
end

function config.scope()
  -- init.lua
  require("scope").setup({})
end

return config
