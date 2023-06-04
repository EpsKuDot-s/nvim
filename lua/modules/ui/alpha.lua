-- {{{ imports
local alpha = require('alpha')
-- }}}

-- {{{ button helper function
local function button(bind, txt, keybind)
  local new_bind = bind:gsub('%s', ''):gsub('SPC', '<leader>')

  local opts = {
    position = 'center',
    text = txt,
    shortcut = bind,
    cursor = 0,
    width = 30,
    align_shortcut = 'right',
    hl_shortcut = 'AlphaButtons',
    hl = 'AlphaItem',
  }

  if keybind then
    opts.keymap = { 'n', new_bind, keybind, { noremap = true, silent = true } }
  end

  return {
    type = 'button',
    val = txt,
    on_press = function()
      local key = vim.api.nvim_replace_termcodes(new_bind, true, false, true) or ''
      vim.api.nvim_feedkeys(key, 'normal', false)
    end,
    opts = opts,
  }
end
-- }}}

-- {{{ setup
-- header padding
local marginTopPercent = 0.25
local headerPadding = math.max(2, math.floor(vim.fn.winheight(0) * marginTopPercent))

local options = {
  padding          = { type = 'padding', val = 2 },
  -- {{{ header
  header           = {
    type = 'text',
    val = {
      '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⡴⠊⠀⠀⠀',
      '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠁⠀⣀⣀⣀⣀⣤⣤⣤⣤⣤⣤⡆⠀⢠⠃⢠⠀⠀⠀⣀⡀⢠⣤⣤⠀⢀⣠⣴⡾⠟⠉⠀⠀⠀⠀⠀',
      '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡔⠁⠀⣼⣿⠟⠛⢛⣛⣯⣽⣿⠿⠛⠁⣰⣿⢡⣿⣇⠀⣰⡿⢡⣿⣿⣧⣾⠿⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀',
      '⢳⣤⡀⠀⣶⣆⢀⣄⠀⠀⣼⠃⢀⣼⣿⣿⣶⡿⠿⠛⠉⢡⣶⠀⢀⣴⣿⢣⣿⢿⣿⣸⡿⢡⣿⣿⠿⣿⣿⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀',
      '⠈⣿⣿⣦⡸⣿⡌⢿⡄⣼⠏⠈⣻⣿⠏⠉⠀⠀⠀⠀⢠⣿⣧⡾⣿⡿⢱⡿⠏⠀⣿⡿⠁⢸⡿⠁⠀⠀⠉⠻⢿⡆⠀⠀⠀⠀⠀⠀⠀⠀',
      '⠀⢸⣿⡆⠺⣿⣷⠘⣿⡟⠀⣰⣿⠏⠀⠀⠀⠀⠀⠀⠈⠛⠁⠀⠙⠁⠀⠀⠀⠀⠀⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⠈⠑⠦⣀⠀⠀⠀⠀⠀',
      '⠀⠀⠉⠁⠀⠈⠛⠂⠙⠀⢰⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠲⢤⣀⠀',
      '⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙',
      '⠀⠀⠀⠀⠀⠀⠀⠀⢠⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
    },
    opts = {
      position = 'center',
      hl = 'AlphaHeader',
    },
  },
  headerPaddingTop = { type = 'padding', val = headerPadding },
  -- }}}

  -- {{{ buttons
  buttons          = {
    type = 'group',
    val = {

      button(' SPC s l ', '󰦛  Restore session   ', ':SessionRestore<CR>'),
      button(' SPC s w ', '  List session      ', ':Telescope session-lens search_session<CR>'),
      button(' SPC f f ', '󰈞  Find file         ', ':Telescope find_files<CR>'),
      button(' SPC f r ', '󰯓  Find recent       ', ':Telescope oldfiles<CR>'),
      button(' SPC f w ', '  Find word         ', ':Telescope live_grep<CR>'),
      button(' SPC f w ', '󰩈  Exit              ', ':q!<CR>'),
    },
    opts = {
      spacing = 1,
    },
  },
  -- }}}
}

alpha.setup({
  layout = {
    options.headerPaddingTop,
    options.header,
    options.padding,
    options.buttons,
  },
  opts = {},
})
-- }}}
