-- Mappings
-- Leader Key
vim.g.mapleader=' '
vim.g.maplocalleader = ' '

-- Tab Switching Keybinds
vim.keymap.set('n', '¬', 'gt')
vim.keymap.set('n', '˙', 'gT')

-- Line Moving Keybinds
vim.keymap.set('n', '∆', ':m .+1<CR>==')
vim.keymap.set('n', '˚', ':m .-2<CR>==')
vim.keymap.set('i', '∆', '<Esc>:m .+1<CR>==gi')
vim.keymap.set('i', '˚', '<Esc>:m .-2<CR>==gi')
vim.keymap.set('v', '∆', "'>+1<CR>gv=gv")
vim.keymap.set('v', '˚', "'<-2<CR>gv=gv")

vim.keymap.set('n', '<leader>r', ':so ~/.config/nvim/init.lua<CR>')

-- Diagnostics mappings
vim.keymap.set('n', '<leader>do', ':lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', '<leader>d[', ':lua vim.diagnostic.goto_prev()<CR>')
vim.keymap.set('n', '<leader>d]', ':lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', '<leader>dd', ':Telescope diagnostics<CR>')


