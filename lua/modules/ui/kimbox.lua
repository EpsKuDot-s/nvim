require("kimbox").setup({
  style = "ocean", -- choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
  langs08 = true,
  popup = {
    background = false, -- use background color for pmenu
  },
  diagnostics = {
    background = true, -- use background color for virtual text
  },
  allow_bold = true,
  allow_italic = true,
  allow_underline = true,
  allow_undercurl = true,
  allow_reverse = false,
  transparent = false,  -- don't set background
  term_colors = true,   -- if true enable the terminal
  ending_tildes = true, -- show the end-of-buffer tildes
  colors = {

  }, -- Override default colors
  highlights = {
    -- Nvim-CMP
    CmpItemKindField         = { fg = "$bg3", bg = "$red", bold = true },
    CmpItemKindEvent         = { fg = "$bg3", bg = "$red", bold = true },
    CmpItemKindKeyword       = { fg = "$bg3", bg = "$red", bold = true },
    CmpItemKindConstant      = { fg = "$bg3", bg = "$orange", bold = true },
    CmpItemKindOperator      = { fg = "$bg3", bg = "$orange", bold = true },
    CmpItemKindSnippet       = { fg = "$bg3", bg = "$orange", bold = true },
    CmpItemKindUnit          = { fg = "$bg3", bg = "$orange", bold = true },
    CmpItemKindEnum          = { fg = "$bg3", bg = "$yellow", bold = true },
    CmpItemKindEnumMember    = { fg = "$bg3", bg = "$yellow", bold = true },
    CmpItemKindReference     = { fg = "$bg3", bg = "$yellow", bold = true },
    CmpItemKindConstructor   = { fg = "$bg3", bg = "$green", bold = true },
    CmpItemKindFunction      = { fg = "$bg3", bg = "$green", bold = true },
    CmpItemKindMethod        = { fg = "$bg3", bg = "$green", bold = true },
    CmpItemKindProperty      = { fg = "$bg3", bg = "$green", bold = true },
    CmpItemKindColor         = { fg = "$bg3", bg = "$aqua", bold = true },
    CmpItemKindInterface     = { fg = "$bg3", bg = "$aqua", bold = true },
    CmpItemKindTypeParameter = { fg = "$bg3", bg = "$aqua", bold = true },
    CmpItemKindVariable      = { fg = "$bg3", bg = "$blue", bold = true },
    CmpItemKindStruct        = { fg = "$bg3", bg = "$purple", bold = true },
    CmpItemKindValue         = { fg = "$bg3", bg = "$purple", bold = true },
    CmpItemKindFile          = { fg = "$bg3", bg = "$fg0", bold = true },
    CmpItemKindFolder        = { fg = "$bg3", bg = "$fg0", bold = true },
    CmpItemKindModule        = { fg = "$bg3", bg = "$fg0", bold = true },
    CmpItemKindText          = { fg = "$bg3", bg = "#9da9a0", bold = true },
    -- Telescope.nvim
    TelescopeBorder          = {
      fg = "$bg3",
      bg = "$bg3",
    },
    TelescopePreviewBorder   = {
      fg = "$bg2",
      bg = "$bg2",
    },
    TelescopeResultsBorder   = {
      fg = "$bg2",
      bg = "$bg2",
    },
    TelescopePromptBorder    = {
      fg = "$bg3",
      bg = "$bg3",
    },
    TelescopePromptNormal    = {
      fg = "$fg3",
      bg = "$bg3",
    },
    TelescopePromptPrefix    = {
      fg = "$red",
      bg = "$bg3",
    },
    TelescopeNormal          = {
      bg = "$bg2",
      fg = "$fg4"
    },
    TelescopeResultsNormal   = {
      bg = "$bg2",
      fg = "$fg4"
    },
    TelescopePreviewTitle    = {
      fg = "$bg2",
      bg = "$green",
    },
    TelescopePromptTitle     = {
      fg = "$bg2",
      bg = "$red",
    },
    TelescopeResultsTitle    = {
      fg = "$bg2",
      bg = "$purple"
    },
    TelescopeSelection       = {
      bg = "$bg4",
      fg = "$fg4"
    },
    -- Alpha.nvim
    AlphaButtons             = {
      bg = "$bg2",
      fg = "$fg4"
    },
    NormalFloat              = {
      bg = "$bg2",
      fg = "$fg4"
    },
    CarbonDir                = {
      bg = "$bg2",
      fg = "$fg4"
    }
  },
  disabled = {
    langs = {},
    plugins = {},
    langs08 = {}    -- Capture groups only present on nightly release (see below)
  },
  run_before = nil, -- Run a function before the colorscheme is loaded
  run_after = nil   -- Run a function after the colorscheme is loaded
})
require("kimbox").load()
vim.g.terminal_color_7 = "#D9AE80"
