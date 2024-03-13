-- Configuration for Mason, MasonLSP and LSPConfig
return function ()
    require("mason").setup()

    local servers = {
        "lua_ls",
        "tsserver",
        "solidity_ls_nomicfoundation",
        -- "rust_analyzer",
    }

    require("mason-lspconfig").setup({
        ensure_installed = servers
    })

    -- Setting Keybinds for all LSP's
    local attach_function = function(_, _)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})

        vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
        vim.keymap.set('n', 'C-k', vim.lsp.buf.signature_help, {})

        vim.keymap.set('n', 'gR', vim.lsp.buf.references, {})
        vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
    end

    -- Setting default capabilities on all LSP Servers
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local lspconfig = require('lspconfig')

    local function add_capabilities()
        for _, lsp in ipairs(servers) do
            lspconfig[lsp].setup {
                capabilities = capabilities,
                on_attach = attach_function,
            }
        end
        lspconfig['lua_ls'].setup{
            settings = {
                Lua = {
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = {'vim'},
                    },
                },
            }
        }
    end

    require('lspconfig').solidity_ls_nomicfoundation.setup{
        cmd = {'nomicfoundation-solidity-language-server', '--stdio'},
        filetypes = { 'solidity' },
        require("lspconfig.util").root_pattern "foundry.toml",
        single_file_support = true,
    }

    add_capabilities()
end
