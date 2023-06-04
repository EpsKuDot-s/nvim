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
      add          = { hl = 'GitGutterAdd', text = '🮙' },
      change       = { hl = 'GitGutterChange', text = '🮙' },
      delete       = { hl = 'GitGutterDelete', text = '' },
      topdelete    = { hl = 'GitGutterDeleteChange', text = '▔' },
      changedelete = { hl = 'GitGutterChange', text = '🮙' },
      untracked    = { text = '🮙' }
    },
    keymaps = {
      -- Default keymap options
      noremap = true,
      buffer = true,
      ['n ]g'] = { expr = true, "&diff ? ']g' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'" },
      ['n [g'] = { expr = true, "&diff ? '[g' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'" },
      ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
      ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
      ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
      ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
      ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line()<CR>',
      -- Text objects
      ['o ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>',
      ['x ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>',
    },
  })
end

function config.indent_blankline()
  -- vim.opt.listchars:append "space:⋅"
  vim.opt.listchars:append "eol:󱞣"
  vim.opt.list = true
  require('indent_blankline').setup({
    char = '│',
    show_end_of_line = true,
    space_char_blankline = " ",
    use_treesitter_scope = true,
    show_first_indent_level = false,
    show_current_context = true,
    show_current_context_start = false,
    show_current_context_start_on_current_line = false,
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

return config
