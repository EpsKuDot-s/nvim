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

function config.colorizer()
  require("colorizer").setup {
    filetypes = { "*" },
    user_default_options = {
      RGB = true,          -- #RGB hex codes
      RRGGBB = true,       -- #RRGGBB hex codes
      names = false,       -- "Name" codes like Blue or blue
      RRGGBBAA = false,    -- #RRGGBBAA hex codes
      AARRGGBB = false,    -- 0xAARRGGBB hex codes
      rgb_fn = false,      -- CSS rgb() and rgba() functions
      hsl_fn = false,      -- CSS hsl() and hsla() functions
      css = false,         -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
      css_fn = false,      -- Enable all CSS *functions*: rgb_fn, hsl_fn
      -- Available modes for `mode`: foreground, background,  virtualtext
      mode = "background", -- Set the display mode.
      -- Available methods are false / true / "normal" / "lsp" / "both"
      -- True is same as normal
      tailwind = true,                               -- Enable tailwind colors
      -- parsers can contain values used in |user_default_options|
      sass = { enable = false, parsers = { css }, }, -- Enable sass colors
      virtualtext = "■",
    },
    -- all the sub-options of filetypes apply to buftypes
    buftypes = {},
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
