return function ()
    require('telescope').load_extension('fzf')

    -- Telescope Mappings
    vim.keymap.set('n', '<leader>dd', ':Telescope diagnostics<CR>')
    vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
    vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
    vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
    vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
    vim.keymap.set('n', '<leader>fc', '<cmd>Telescope colorscheme<cr>')
    vim.keymap.set('n', '<leader>f/', '<cmd>Telescope current_buffer_fuzzy_find<cr>')
end
