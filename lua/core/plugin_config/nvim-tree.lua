return function ()
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- set termguicolors to enable highlight groups
    vim.opt.termguicolors = true

    require("nvim-tree").setup {
        git = {
            enable = true,
            ignore = false,
            timeout = 400,
        },
        update_focused_file = {
            enable = true,
            update_cwd = true,
        },
        actions = {
            open_file = {
                quit_on_open = true,
            },
        },
    }
    -- Mappings
    vim.keymap.set('n', '`', ':NvimTreeFindFileToggle<CR>')
end
