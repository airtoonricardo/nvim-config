-- Mappings
-- Leader Key
vim.g.mapleader=' '
vim.g.maplocalleader = ' '

local keymaps = vim.keymap

-- Tab Switching Keybinds
keymaps.set('n', '¬', 'gt')
keymaps.set('n', '˙', 'gT')

-- Line Moving Keybinds
keymaps.set('n', '∆', ':m .+1<CR>==')
keymaps.set('n', '˚', ':m .-2<CR>==')
keymaps.set('i', '∆', '<Esc>:m .+1<CR>==gi')
keymaps.set('i', '˚', '<Esc>:m .-2<CR>==gi')
keymaps.set('v', '∆', "'>+1<CR>gv=gv")
keymaps.set('v', '˚', "'<-2<CR>gv=gv")

-- Maximizes and Minimizes current window with Alt-m and Alt-=
keymaps.set('n', 'µ', '<C-W>_<C-W><Bar>');
keymaps.set('n', '≠', '<C-W><kEqual>');

-- Reloads Config
keymaps.set('n', '<leader>r', ':so ~/.config/nvim/init.lua<CR>')

-- Diagnostics mappings
keymaps.set('n', '<leader>do', ':lua vim.diagnostic.open_float()<CR>')
keymaps.set('n', '<leader>d[', ':lua vim.diagnostic.goto_prev()<CR>')
keymaps.set('n', '<leader>d]', ':lua vim.diagnostic.goto_next()<CR>')
keymaps.set('n', '<leader>dd', ':Telescope diagnostics<CR>')


