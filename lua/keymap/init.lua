require('keymap.remap')
-- local keymap = require('core.keymap')

-- Terminal
vim.keymap.set('n', '<Leader>to', ':lua require("FTerm").toggle()<CR>', { desc = " Terminal toggle" })
vim.keymap.set('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<A-I>', '<C-\\><C-n><CMD>lua require("FTerm").exit()<CR>')
vim.keymap.set('n', '<Leader>tr', ':lua require"runner".run()<CR>', { desc = "󱧕 Run runner.nvim" })

-- Lazy
vim.keymap.set('n', '<Leader>pp', ':Lazy profile<CR>', { desc = " Lazy profile" })
vim.keymap.set('n', '<Leader>pu', ':Lazy update<CR>', { desc = "󰚰 Lazy update" })
vim.keymap.set('n', '<Leader>pi', ':Lazy profile<CR>', { desc = "󱧕 Lazy profile" })

-- Git
vim.keymap.set('n', '<Leader>gc', ':Telescope git_commits<CR>', { desc = "󱧕 Git commits" })
vim.keymap.set('n', '<Leader>gl', ':LazyGit<CR>', { desc = "󱧕 Lazy git" })

-- TODO: set names and icons
vim.keymap.set('n', '<Leader>li', ':LspInfo<CR>', { desc = "󱧕 Git commits" })
vim.keymap.set('n', '<Leader>ll', ':LspLog<CR>', { desc = "󱧕 Git commits" })
vim.keymap.set('n', '<Leader>lr', ':LspRestart<CR>', { desc = "󱧕 Git commits" })
vim.keymap.set('n', '<Leader>lf', '<CMD>lua vim.lsp.buf.format()<CR>', { desc = "󱧕 Format code" })

-- Lsp Actions
vim.keymap.set('n', 'ga', ':CodeActionMenu<CR>', { desc = "󱧕 Git commits" })
vim.keymap.set('n', 'gd', ':Glance definitions<CR>', { desc = "󱧕 Git commits" })
vim.keymap.set('n', 'gs', ':Glance references<CR>', { desc = "󱧕 Git commits" })
vim.keymap.set('n', 'gr', ':Glance implementations<CR>', { desc = "󱧕 Git commits" })
vim.keymap.set('n', 'gt', ':Glance type_definitions<CR>', { desc = "󱧕 Git commits" })

-- Session and File
vim.keymap.set('n', '<Leader>ss', ':SessionSave<CR>', { desc = "󱧕 Git commits" })
vim.keymap.set('n', '<Leader>sr', ':SessionRestore<CR>', { desc = "󱧕 Git commits" })
vim.keymap.set('n', '<Leader>sa', ':wall<CR>', { desc = "󱧕 Git commits" })
vim.keymap.set('n', '<C-s>', ':w<CR>', { desc = "󱧕 Git commits" })

-- File
vim.keymap.set('n', '<Leader>e', ':Fcarbon<CR>', { desc = "󱧕 Git commits" })

-- SQL
vim.keymap.set('n', '<Leader>as', ':BUIToggle<CR>', { desc = "󱧕 Git commits" })

-- Buffer
vim.keymap.set('n', '<Leader>b', ':JABSOpen<CR>', { desc = "󱧕 Git commits" })

-- Telescope
vim.keymap.set('n', '<Leader>fa', ':Telescope live_grep<CR>', { desc = "󱧕 Git commits" })
vim.keymap.set('n', '<Leader>fb', ':Telescope file_browser<CR>', { desc = "󱧕 Git commits" })
vim.keymap.set('n', '<Leader>ff', ':Telescope find_files<CR>', { desc = "󱧕 Git commits" })
vim.keymap.set('n', '<Leader>fw', ':Telescope grep_string<CR>', { desc = "󱧕 Git commits" })
vim.keymap.set('n', '<Leader>fh', ':Telescope  help_tags<CR>', { desc = "󱧕 Git commits" })
