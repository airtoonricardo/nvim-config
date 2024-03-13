return function ()
    vim.opt.termguicolors = true
    require('bufferline').setup{
        options = {
            diagnostics = "nvim_lsp",
            mode = "tabs",
            close_icon = '',
            modified_icon = '●',
            buffer_close_icon = '󰅖',
            left_trunc_marker = '',
            right_trunc_marker = '',
            separator_style = "thin",
            offsets = {
                {
                  filename = "NvimTree_1",
                  text = "Choosing File",
                  text_align = "center",
                },
                {
                  filetype = "NvimTree",
                  text = "Files",
                  text_align = "center",
                },
                {
                  filetype = "DiffviewFiles",
                  text = "Source Control",
                  text_align = "center",
                },
            },
        }
    }
end
