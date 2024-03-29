require('keymap.remap')
-- local keymap = require('core.keymap')

-- Terminal
vim.keymap.set('n', '<Leader>to', ':lua require("FTerm").toggle()<CR>', { desc = " Terminal toggle" })
vim.keymap.set('n', '<C-t>', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<C-t>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<C-C>', '<C-\\><C-n><CMD>lua require("FTerm").exit()<CR>')
vim.keymap.set('n', '<Leader>tr', ':lua require"runner".run()<CR>', { desc = "󱧕 Run runner.nvim" })

-- Lazy
vim.keymap.set('n', '<Leader>pp', ':Lazy profile<CR>', { desc = " Lazy profile" })
vim.keymap.set('n', '<Leader>pu', ':Lazy update<CR>', { desc = "󰚰 Lazy update" })
vim.keymap.set('n', '<Leader>pi', ':Lazy profile<CR>', { desc = "󱧕 Lazy profile" })

-- Git
vim.keymap.set('n', '<Leader>gc', ':Telescope git_commits<CR>', { desc = "󱧕 Git commits" })
vim.keymap.set('n', '<Leader>gl', ':LazyGit<CR>', { desc = "󱧕 Lazy git" })

-- TODO: set names and icons
vim.keymap.set('n', '<Leader>li', ':LspInfo<CR>', { desc = " Lsp Information" })
vim.keymap.set('n', '<Leader>ll', ':LspLog<CR>', { desc = " Lsp Log" })
vim.keymap.set('n', '<Leader>lr', ':LspRestart<CR>', { desc = "󰜉 Lsp Restart" })
vim.keymap.set('n', '<Leader>lf', '<CMD>lua vim.lsp.buf.format()<CR>', { desc = "󰉢 Format code" })

-- Lsp Actions
vim.keymap.set('n', 'ga', ':CodeActionMenu<CR>', { desc = " Code Action " })
vim.keymap.set('n', 'gd', ':Glance definitions<CR>', { desc = " Definitions " })
vim.keymap.set('n', 'gs', ':Glance references<CR>', { desc = " References" })
vim.keymap.set('n', 'gr', ':Glance implementations<CR>', { desc = "󱧕 Implementations" })
vim.keymap.set('n', 'gt', ':Glance type_definitions<CR>', { desc = "󱧕 Type definitions" })

-- Session and File
vim.keymap.set('n', '<Leader>ss', ':SessionSave<CR>', { desc = "󱧕 Session Save" })
vim.keymap.set('n', '<Leader>sr', ':SessionRestore<CR>', { desc = "󱧕 Session Restore" })
vim.keymap.set('n', '<Leader>sa', ':wall<CR>', { desc = "󰆓 Save all " })
vim.keymap.set('n', '<Leader>sq', ':xall<CR>', { desc = "󰆓 Save and quite" })
vim.keymap.set('n', '<C-s>', ':w<CR>')

-- File
vim.keymap.set('n', '<Leader>e', ':Fcarbon<CR>', { desc = "󱧕 File manager" })

-- SQL
-- vim.keymap.set('n', '<Leader>as', ':BUIToggle<CR>', { desc = "󱧕 Git commits" })

-- Buffer
vim.keymap.set('n', '<Leader>b', ':JABSOpen<CR>', { desc = "󱧕 Buffer list" })

-- Telescope
vim.keymap.set('n', '<Leader>fa', ':Telescope live_grep<CR>', { desc = "󱧕 Search word" })
-- vim.keymap.set('n', '<Leader>fb', ':Telescope file_browser<CR>', { desc = "󱧕 Search file " })
vim.keymap.set('n', '<Leader>ff', ':Telescope find_files<CR>', { desc = "󱧕 Search file " })
vim.keymap.set('n', '<Leader>fw', ':Telescope grep_string<CR>', { desc = "󱧕 Search string" })
vim.keymap.set('n', '<Leader>fh', ':Telescope  help_tags<CR>', { desc = "󱧕 Search help tags " })

vim.keymap.set('n', '<Leader>ms', '<cmd>lua require("spectre").open()<CR>', { desc = "󱧕 Find and replace " })
