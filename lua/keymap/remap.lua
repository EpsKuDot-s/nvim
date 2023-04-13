local wk = require("which-key")


vim.keymap.set('n', '<C-k>', ':bn<CR>', { desc = " Terminal toggle" })
vim.keymap.set('n', '<C-j>', ':bp<CR>', { desc = " Terminal toggle" })

vim.keymap.set('n', '<A-h>', '<C-w>h', { desc = " Terminal toggle" })
vim.keymap.set('n', '<A-l>', '<C-w>l', { desc = " Terminal toggle" })
vim.keymap.set('n', '<A-j>', '<C-w>j', { desc = " Terminal toggle" })
vim.keymap.set('n', '<A-k>', '<C-w>k', { desc = " Terminal toggle" })

-- insertmode remap
-- imap({
--   { '<C-h>', '<left>',      opts(noremap) },
--   { '<C-l>', '<right>',     opts(noremap) },
--   { '<C-k>', '<up>',        opts(noremap) },
--   { '<C-j>', '<down>',      opts(noremap) },
--   { '<C-s>', '<ESC>:w<CR>', opts(noremap) },
-- }) TODO: make it

-- commandline remap
-- cmap({
--   { '<C-b>', '<Left>',  opts(noremap) },
--   { '<C-f>', '<Right>', opts(noremap) },
--   { '<C-a>', '<Home>',  opts(noremap) },
--   { '<C-e>', '<End>',   opts(noremap) },
--   { '<C-d>', '<Del>',   opts(noremap) },
--   { '<C-h>', '<BS>',    opts(noremap) },
-- })

vim.keymap.set('n', '<Leader>de', ':lua require "dap".continue()<CR>', { desc = " Debug run" })
vim.keymap.set('n', '<Leader>dr', ':lua require "dap".toggle_breakpoint()<CR>', { desc = " Debug continue" })
vim.keymap.set('n', '<Leader>dc', ':lua require "dap".update_project_config()<CR>', { desc = " Debug update" })
vim.keymap.set('n', '<Leader>dh', ':JdtHotReplace<CR>', { desc = " Debug Hot Replace" })

wk.register({
  c = {
    r = { ":w<CR>:CompetiTestRun<CR>", " Run test" },
    d = { ":CompetiTestDelete<CR>", "﯊ Delete test" },
    e = { ":CompetiTestEdit<CR>", " Edit test" },
    a = { ":CompetiTestAdd<CR>", " Add test" },
    w = { ":w<CR>:RunCode<CR>", " Compile and Run" }
  },
  w = {
    name = "Window",
    d = { function()
      local cBuf = vim.current.buffer;
    end, "Close window" }
  }
}, { prefix = "<Space>" })
-- TODO: convert it
