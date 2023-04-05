local present, cmp = pcall(require, "cmp")

if not present then
  return
end

local next = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' })
local prev = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' })
local keymaps = {
  ['<Tab>']     = next,
  ['<S-Tab>']   = prev,
  ['<C-n>']     = next,
  ['<C-p>']     = prev,
  -- ['<C-Space>'] = cmp.mapping.complete(),

  ['<C-d>']     = cmp.mapping.scroll_docs(-4),
  ['<C-f>']     = cmp.mapping.scroll_docs(4),
  ['<C-e>']     = cmp.mapping.close(),
  ['<C-Space>'] = cmp.mapping.confirm({
    behavior = cmp.ConfirmBehavior.Insert,
    select   = true,
  }),
}
local options = {
  enabled = function()
    -- disable completion in telescope
    if vim.bo.filetype == "TelescopePrompt" then return false end

    -- disable completion in comments
    local context = require('cmp.config.context')
    -- keep command mode completion enabled when cursor is in a comment
    if vim.api.nvim_get_mode().mode == 'c' then
      return true
    else
      return not context.in_treesitter_capture('comment')
          and not context.in_syntax_group('Comment')
    end
  end,
  -- }}}
  view = {
    entries = { name = 'custom', selection_order = 'near_cursor' } -- select upwards if cursor is near the bottom
  },
  window = {
    completion = {
      winhighlight = 'Normal:Pmenu,FloatBorder:CmpCompletionBorder,CursorLine:PmenuSel,Search:None',
      col_offset = -4,
      side_padding = 0,
    },
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  formatting = {
    fields = { 'kind', 'abbr', 'menu' },
    format = function(entry, vim_item)
      local kind = require('lspkind').cmp_format({ mode = 'symbol_text', maxwidth = 50 })(entry, vim_item)
      local strings = vim.split(kind.kind, '%s', { trimempty = true })

      kind.kind = ' ' .. strings[1] .. ' '
      kind.menu = '      [' .. strings[2] .. ']'

      return kind
    end,
  },
  completion = {
    keyword_length = 1,
  },
  mapping = keymaps,
  sources = {
    { name = "luasnip",  priority = 2 },
    { name = "nvim_lsp", priority = 4 },
    { name = "buffer",   priority = 1 },
    { name = "path",     priority = 3 },
  },
  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.kind,
      -- cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    }
  },
  preselect = cmp.PreselectMode.Item,
}
cmp.setup(options)
