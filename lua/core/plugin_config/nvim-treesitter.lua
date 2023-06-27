return function ()
    require('nvim-treesitter.configs').setup {
        build = ":TSUpdate",
        ensure_installed = {
            'solidity',
            'rust',
            'python',
            -- 'lua',
        },
        sync_install = false,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
    }
end
