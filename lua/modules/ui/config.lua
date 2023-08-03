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
    signs = {
      add          = { hl = 'GitGutterAdd', text = '' }, -- 🮙
      change       = { hl = 'GitGutterChange', text = '~' },
      delete       = { hl = 'GitGutterDelete', text = '' },
      topdelete    = { hl = 'GitGutterDeleteChange', text = '▔' },
      changedelete = { hl = 'GitGutterChange', text = '~' },
      untracked    = { text = '' }
    }

  })
end

function config.indent_blankline()
  -- vim.opt.listchars:append "tab:▶"
  vim.opt.listchars:append "eol:󱞣"
  vim.opt.listchars:append "space:⋅"
  vim.opt.list = true
  require('indent_blankline').setup({
    char = '',
    char_blankline = '┆',
    show_end_of_line = false,
    use_treesitter_scope = true,
    show_first_indent_level = false,
    space_char_blankline = " ",
    -- show_current_context = true,
    -- show_current_context_start = true,
    -- show_current_context_start_on_current_line = false,
    filetype_exclude = {
      'dashboard',
      'DogicPrompt',
      'log',
      'fugitive',
      'gitcommit',
      'packer',
      'markdown',
      'json',
      'txt',
      'vista',
      'help',
      'todoist',
      'NvimTree',
      'git',
      'TelescopePrompt',
      'undotree',
    },
    buftype_exclude = { 'terminal', 'nofile', 'prompt' },
    context_patterns = {
      'class',
      'function',
      'method',
      'block',
      'list_literal',
      'selector',
      '^if',
      '^table',
      'if_statement',
      'while',
      'for',
    },
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
