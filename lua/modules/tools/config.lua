local config = {}

local function load_env_file()
  local env_file = os.getenv('HOME') .. '/.env'
  local env_contents = {}
  if vim.fn.filereadable(env_file) ~= 1 then
    print('.env file does not exist')
    return
  end
  local contents = vim.fn.readfile(env_file)
  for _, item in pairs(contents) do
    local line_content = vim.fn.split(item, '=')
    env_contents[line_content[1]] = line_content[2]
  end
  return env_contents
end

local function load_dbs()
  local env_contents = load_env_file()
  local dbs = {}
  for key, value in pairs(env_contents) do
    if vim.fn.stridx(key, 'DB_CONNECTION_') >= 0 then
      local db_name = vim.fn.split(key, '_')[3]:lower()
      dbs[db_name] = value
    end
  end
  return dbs
end

function config.vim_dadbod_ui()
  vim.g.db_ui_show_help = 0
  vim.g.db_ui_win_position = 'left'
  vim.g.db_ui_use_nerd_fonts = 1
  vim.g.db_ui_winwidth = 35
  vim.g.db_ui_save_location = os.getenv('HOME') .. '/.cache/vim/db_ui_queries'
  vim.g.dbs = load_dbs()
end

function config.template_nvim()
  local temp = require('template')
  temp.temp_dir = '~/.config/nvim/template'
  temp.author = 'epsku'
  temp.email = 'kurenshenurdaulet@gmail.com'
  require('telescope').load_extension('find_template')
end

function config.which_key()
  local wconfig = {
    show_keys = false,
    show_help = false,
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "󰒭", -- symbol used between a key and it's label
      group = "+",      -- symbol prepended to a group
    },
    window = {
      margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]
      padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
    }
  }

  if vim.g.neovide then
    wconfig.window.winblend = 40
  end
  require("which-key").setup(wconfig)
  require("which-key").register({
    ["<leader>"] = {
      p = { name = "+Lazy" },
      d = { name = "+Debug" },
      l = { name = "+LSP" },
      s = { name = "+Session" },
      t = { name = "+Terminal" },
      w = { name = "+Window" },
      f = { name = "+Telescope" },
      c = { name = "+Compile" },
      g = { name = "+Git" },
      e = { name = "+File" },
      b = { name = "+Buffer" },
      a = { name = "+DBUI" },
    },
  })
end

function config.auto_session()
  require("auto-session").setup {
    log_level = 'error',
    auto_save_enabled = true,
    auto_restore_enabled = false,
    bypass_session_save_file_types = { "alpha" },
    pre_save_cmds = { "lua require('dapui').close()" }
  }
end

function config.comment()
  require('Comment').setup({
    toggler = {
      line = '<C-c>',
    },
    opleader = {
      line = '<C-c>',
    },
  })
end

function config.cutlass()
  require("cutlass").setup({
    cut_key = "c",
    override_del = true,
    registers = {
      select = "_",
      delete = "_",
      change = "_",
    },
  })
end

function config.code_runner()
  require('code_runner').setup({
    -- put here the commands by filetype
    filetype = {
      cpp = "cd $dir && g++ $fileName && ./a.out",
      typescript = "npm start"
    },
    project = {
      ["~/Projects/es-iac/"] = {
        name = "es-iac",
        command = "npm start",
      },
    },
    -- mode = "float",
    focus = false,
    startinsert = true,
  })
end

function config.runner()
  require("runner").setup({
    position = "bottom",
    height = 15
  })
end

function config.toggletasks()
  require('toggletasks').setup {}
end

function config.competitest()
  require('competitest').setup(
    {
      picker_ui = {
        width = 0.2,
        height = 0.3,
        mappings = {
          focus_next = { "j", "<down>", "<Tab>" },
          focus_prev = { "k", "<up>", "<S-Tab>" },
          close = { "<esc>", "<C-c>", "q", "Q" },
          submit = { "<cr>", "s" },
        },
      },
      compile_command = {
        cpp       = { exec = 'g++', args = { '$(FNAME)', '-o', '$(FNOEXT)' } },
        some_lang = { exec = 'some_compiler', args = { '$(FNAME)' } },
      },
      run_command = {
        cpp       = { exec = './$(FNOEXT)' },
        some_lang = { exec = 'some_interpreter', args = { '$(FNAME)' } },
      },
    }
  ) -- to use default configuration
end

function config.papis()
  require("papis").setup(
  -- Your configuration goes here
  )
end

function config.jabs()
  require 'jabs'.setup {
    -- Options for the main window
    position = { 'left', 'bottom' }, -- position = {'<position_x>', '<position_y>'} | <position_x> left, center, right,
    --                                             <position_y> top, center, bottom
    -- Default {'right', 'bottom'}

    relative = 'editor',     -- win, editor, cursor. Default win
    clip_popup_size = false, -- clips the popup size to the win (or editor) size. Default true

    width = 80,              -- default 50
    height = 20,             -- default 10
    border = 'single',       -- none, single, double, rounded, solid, shadow, (or an array or chars). Default shadow

    offset = {
      -- window position offset
      top = 2,    -- default 0
      bottom = 2, -- default 0
      left = 2,   -- default 0
      right = 2,  -- default 0
    },

    sort_mru = true,                -- Sort buffers by most recently used (true or false). Default false
    split_filename = true,          -- Split filename into separate components for name and path. Default false
    split_filename_path_width = 20, -- If split_filename is true, how wide the column for the path is supposed to be, Default 0 (don't show path)

    -- Options for preview window
    preview_position = 'right', -- top, bottom, left, right. Default top
    preview = {
      width = 100,              -- default 70
      height = 40,              -- default 30
      border = 'single',        -- none, single, double, rounded, solid, shadow, (or an array or chars). Default double
    },

    symbols = {
      current = "󰄾 ",
      split = " ",
      alternate = "A",       -- default 
      hidden = "H",          -- default ﬘
      locked = "L",          -- default 
      ro = "R",              -- default 
      edited = "E",          -- default 
      terminal = "T",        -- default 
      default_file = "D",    -- Filetype icon if not present in nvim-web-devicons. Default 
      terminal_symbol = ">_" -- Filetype icon for a terminal split. Default 
    },

    -- Whether to use nvim-web-devicons next to filenames
    use_devicons = true -- true or false. Default true
  }
end

function config.fterm()
  require 'FTerm'.setup({
    border     = 'double',
    dimensions = {
      height = 0.9,
      width = 0.9,
    },
  })
end

function config.spectre()
  require('spectre').setup({
    color_devicons     = true,


    open_cmd           = 'vnew',
    live_update        = true, -- auto execute search again when you write to any file in vim
    line_sep_start     = '┌-----------------------------------------',
    result_padding     = '¦  ',
    line_sep           = '└-----------------------------------------',
    mapping            = {
      ['toggle_line'] = {
        map = "dd",
        cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
        desc = "toggle current item"
      },
      ['enter_file'] = {
        map = "<cr>",
        cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
        desc = "goto current file"
      },
      ['send_to_qf'] = {
        map = "<leader>q",
        cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
        desc = "send all item to quickfix"
      },
      ['replace_cmd'] = {
        map = "<leader>c",
        cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
        desc = "input replace vim command"
      },
      ['show_option_menu'] = {
        map = "<leader>o",
        cmd = "<cmd>lua require('spectre').show_options()<CR>",
        desc = "show option"
      },
      ['run_current_replace'] = {
        map = "<leader>rc",
        cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
        desc = "replace current line"
      },
      ['run_replace'] = {
        map = "<leader>R",
        cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
        desc = "replace all"
      },
      ['change_view_mode'] = {
        map = "<leader>v",
        cmd = "<cmd>lua require('spectre').change_view()<CR>",
        desc = "change result view mode"
      },
      ['change_replace_sed'] = {
        map = "trs",
        cmd = "<cmd>lua require('spectre').change_engine_replace('sed')<CR>",
        desc = "use sed to replace"
      },
      ['change_replace_oxi'] = {
        map = "tro",
        cmd = "<cmd>lua require('spectre').change_engine_replace('oxi')<CR>",
        desc = "use oxi to replace"
      },
      ['toggle_live_update'] = {
        map = "tu",
        cmd = "<cmd>lua require('spectre').toggle_live_update()<CR>",
        desc = "update change when vim write file."
      },
      ['toggle_ignore_case'] = {
        map = "ti",
        cmd = "<cmd>lua require('spectre').change_options('ignore-case')<CR>",
        desc = "toggle ignore case"
      },
      ['toggle_ignore_hidden'] = {
        map = "th",
        cmd = "<cmd>lua require('spectre').change_options('hidden')<CR>",
        desc = "toggle search hidden"
      },
      ['resume_last_search'] = {
        map = "<leader>l",
        cmd = "<cmd>lua require('spectre').resume_last_search()<CR>",
        desc = "resume last search before close"
      },
      -- you can put your mapping here it only use normal mode
    },
    find_engine        = {
      -- rg is map with finder_cmd
      ['rg'] = {
        cmd = "rg",
        -- default args
        args = {
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
        },
        options = {
          ['ignore-case'] = {
            value = "--ignore-case",
            icon = "[I]",
            desc = "ignore case"
          },
          ['hidden'] = {
            value = "--hidden",
            desc = "hidden file",
            icon = "[H]"
          },
          -- you can put any rg search option you want here it can toggle with
          -- show_option function
        }
      },
      ['ag'] = {
        cmd = "ag",
        args = {
          '--vimgrep',
          '-s'
        },
        options = {
          ['ignore-case'] = {
            value = "-i",
            icon = "[I]",
            desc = "ignore case"
          },
          ['hidden'] = {
            value = "--hidden",
            desc = "hidden file",
            icon = "[H]"
          },
        },
      },
    },
    replace_engine     = {
      ['sed'] = {
        cmd = "sed",
        args = nil,
        options = {
          ['ignore-case'] = {
            value = "--ignore-case",
            icon = "[I]",
            desc = "ignore case"
          },
        }
      },
      -- call rust code by nvim-oxi to replace
      ['oxi'] = {
        cmd = 'oxi',
        args = {},
        options = {
          ['ignore-case'] = {
            value = "i",
            icon = "[I]",
            desc = "ignore case"
          },
        }
      }
    },
    default            = {
      find = {
        --pick one of item in find_engine
        cmd = "rg",
        options = { "ignore-case" }
      },
      replace = {
        --pick one of item in replace_engine
        cmd = "sed"
      }
    },
    replace_vim_cmd    = "cdo",
    is_open_target_win = true, --open file on opener window
    is_insert_mode     = false -- start open panel on is_insert_mode
  })
end

function config.glow()
  require('glow').setup({
    -- your override config
  })
end

function config.kirby()
  local kirby = require('kirby')

  kirby.register({
    id = 'git-branch',
    name = 'Git checkout',
    values = function() return vim.fn['fugitive#CompleteObject']('', ' ', '') end,
    onAccept = 'Git checkout',
  })

  kirby.register({
    id = 'session',
    name = 'Open session',
    values = function() return vim.fn['xolox#session#complete_names']('', 'OpenSession ', 0) end,
    onAccept = 'OpenSession',
  })

  kirby.register({
    id = 'note',
    name = 'Open note',
    values = function() return vim.fn['xolox#notes#cmd_complete']('', 'Note ', 0) end,
    onAccept = 'Note',
  })
end

function config.langmapper()
  local function escape(str)
    -- You need to escape these characters to work correctly
    local escape_chars = [[;,."|\]]
    return vim.fn.escape(str, escape_chars)
  end

  -- Recommended to use lua template string
  local en = [[`qwertyuiop[]asdfghjkl;'zxcvbnm]]
  local ru = [[ёйцукенгшщзхъфывапролджэячсмить]]
  local en_shift = [[~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>]]
  local ru_shift = [[ËЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ]]
  vim.opt.langmap = vim.fn.join({
    -- | `to` should be first     | `from` should be second
    escape(ru_shift) .. ';' .. escape(en_shift),
    escape(ru) .. ';' .. escape(en),
  }, ',')
  require('langmapper').automapping({ global = true, buffer = true })
end

return config
