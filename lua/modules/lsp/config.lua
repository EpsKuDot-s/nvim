local config = {}

function config.nvim_lsp()
  require('modules.lsp.lspconfig')
end

function config.lspsaga()
  local saga = require('lspsaga')
  saga.init_lsp_saga({
    symbol_in_winbar = {
      enable = true,
    },
    code_action_icon = "",
    code_action_lightbulb = {
      enable = true,
      enable_in_insert = true,
      cache_code_action = true,
      sign = false,
      update_time = 150,
      sign_priority = 20,
      virtual_text = true,
    },
    code_action_num_shortcut = false,
  })
end

function config.lspkind()
  require('lspkind').init({
  })
end

function config.nvim_cmp()
  require('modules.lsp.cmp')
end

function config.lua_snip()
  local ls = require('luasnip')
  ls.config.set_config({
    history = false,
    updateevents = 'TextChanged,TextChangedI',
  })
  require('luasnip.loaders.from_vscode').lazy_load()
  require('luasnip.loaders.from_vscode').lazy_load({
    paths = { './snippets/' },
  })
end

function config.auto_pairs()
  require('nvim-autopairs').setup({})
  local status, cmp = pcall(require, 'cmp')
  if status then
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
  end
end

function config.dap_ui()
  -- vim.highlight.create('DapBreakpoint', { ctermbg = 0, guifg = '#993939', guibg = '#31353f' }, false)
  -- vim.highlight.create('DapLogPoint', { ctermbg = 0, guifg = '#61afef', guibg = '#31353f' }, false)
  -- vim.highlight.create('DapStopped', { ctermbg = 0, guifg = '#98c379', guibg = '#31353f' }, false)

  vim.fn.sign_define('DapBreakpoint', {
    text = '󰝥',
    texthl = 'DapBreakpoint',
    linehl = 'DapBreakpoint',
    numhl = 'DapBreakpoint'
  })
  vim.fn.sign_define('DapBreakpointCondition',
    { text = '󰟃', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
  vim.fn.sign_define('DapBreakpointRejected',
    { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
  vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DapLogPoint', linehl = 'DapLogPoint', numhl = 'DapLogPoint' })
  vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' })
  require("dapui").setup({
    icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
    mappings = {
      expand = { "<CR>", "<2-LeftMouse>" },
      open = "o",
      remove = "d",
      edit = "e",
      repl = "r",
      toggle = "t",
    },
    expand_lines = vim.fn.has("nvim-0.7") == 1,
    layouts = {
      {
        elements = {
          -- Elements can be strings or table with id and size keys.
          { id = "scopes", size = 0.25 },
          "breakpoints",
          "stacks",
          "watches",
        },
        size = 40, -- 40 columns
        position = "left",
      },
      {
        elements = {
          "console",
        },
        size = 0.25, -- 25% of total lines
        position = "bottom",
      },
    },
    controls = {
      -- Requires Neovim nightly (or 0.8 when released)
      enabled = true,
      -- Display controls in this element
      element = "console",
      icons = {
        pause = "",
        play = "",
        step_into = "",
        step_over = "",
        step_out = "",
        step_back = "",
        run_last = "↻",
        terminate = "□",
      },
    },
    floating = {
      max_height = nil,  -- These can be integers or a float between 0 and 1.
      max_width = nil,   -- Floats will be treated as percentage of your screen.
      border = "single", -- Border style. Can be "single", "double" or "rounded"
      mappings = {
        close = { "q", "<Esc>" },
      },
    },
    windows = { indent = 1 },
    render = {
      max_type_length = nil, -- Can be integer or nil.
      max_value_lines = 100, -- Can be integer or nil.
    }
  })
  local dap, dapui = require("dap"), require("dapui")
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
end

function config.lsp_lines()
  --  require("lsp_lines").setup()
end

function config.trouble()
  require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
end

function config.todo()
  require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
end

function config.glance()
  -- Lua configuration
  local glance = require('glance')
  local actions = glance.actions

  glance.setup({
    height = 18, -- Height of the window
    zindex = 45,
    preview_win_opts = {
      -- Configure preview window options
      cursorline = true,
      number = true,
      wrap = true,
    },
    border = {
      enable = false, -- Show window borders. Only horizontal borders allowed
      top_char = '―',
      bottom_char = '―',
    },
    list = {
      position = 'right', -- Position of the list window 'left'|'right'
      width = 0.33,       -- 33% width relative to the active window, min 0.1, max 0.5
    },
    theme = {
      -- This feature might not work properly in nvim-0.7.2
      enable = true, -- Will generate colors for the plugin based on your current colorscheme
      mode = 'auto', -- 'brighten'|'darken'|'auto', 'auto' will set mode based on the brightness of your colorscheme
    },
    mappings = {
      list = {
        ['j'] = actions.next,     -- Bring the cursor to the next item in the list
        ['k'] = actions.previous, -- Bring the cursor to the previous item in the list
        ['<Down>'] = actions.next,
        ['<Up>'] = actions.previous,
        ['<Tab>'] = actions.next_location,       -- Bring the cursor to the next location skipping groups in the list
        ['<S-Tab>'] = actions.previous_location, -- Bring the cursor to the previous location skipping groups in the list
        ['<C-u>'] = actions.preview_scroll_win(5),
        ['<C-d>'] = actions.preview_scroll_win(-5),
        ['v'] = actions.jump_vsplit,
        ['s'] = actions.jump_split,
        ['t'] = actions.jump_tab,
        ['<CR>'] = actions.jump,
        ['o'] = actions.jump,
        ['<leader>l'] = actions.enter_win('preview'), -- Focus preview window
        ['q'] = actions.close,
        ['Q'] = actions.close,
        ['<Esc>'] = actions.close,
        -- ['<Esc>'] = false -- disable a mapping
      },
      preview = {
        ['Q'] = actions.close,
        ['<Tab>'] = actions.next_location,
        ['<S-Tab>'] = actions.previous_location,
        ['<leader>l'] = actions.enter_win('list'), -- Focus list window
      },
    },
    hooks = {},
    folds = {
      fold_closed = '',
      fold_open = '',
      folded = true, -- Automatically fold list on startup
    },
    indent_lines = {
      enable = true,
      icon = '│',
    },
    winbar = {
      enable = true, -- Available strating from nvim-0.8+
    },
  })
end

function config.code_action()
  vim.g.code_action_menu_window_border = 'single'
end

function config.jdtls()
  require('modules.lsp.jdtls')
end

function config.mason()
  require("mason").setup({
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
      }
    }
  })
end

function config.mason_lspconfig()
  require("mason-lspconfig").setup {
    ensure_installed = { "angularls", "tailwindcss" },
  }

  require("mason-lspconfig").setup_handlers {
    function(server_name) -- default handler (optional)
      require("lspconfig")[server_name].setup {}
    end,
  }
end

function config.typescript()
  require("typescript").setup({
    disable_commands = false, -- prevent the plugin from creating Vim commands
    debug = false,            -- enable debug logging for commands
    go_to_source_definition = {
      fallback = true,        -- fall back to standard LSP definition on failure
    },
    server = {
      -- pass options to lspconfig's setup method
      on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = true
        client.server_capabilities.documentRangeFormattingProvider = true
      end
    },
  })
end

return config
