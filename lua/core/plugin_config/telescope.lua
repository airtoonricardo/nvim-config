return function ()
    local telescope = require('telescope')
    telescope.load_extension('fzf')

    local ts_select_dir_for_grep = function(prompt_bufnr)
      local action_state = require("telescope.actions.state")
      local fb = require("telescope").extensions.file_browser
      local live_grep = require("telescope.builtin").live_grep
      local current_line = action_state.get_current_line()

      fb.file_browser({
        files = false,
        depth = false,
        attach_mappings = function(prompt_bufnr)
          require("telescope.actions").select_default:replace(function()
            local entry_path = action_state.get_selected_entry().Path
            local dir = entry_path:is_dir() and entry_path or entry_path:parent()
            local relative = dir:make_relative(vim.fn.getcwd())
            local absolute = dir:absolute()

            live_grep({
              results_title = relative .. "/",
              cwd = absolute,
              default_text = current_line,
            })
          end)

          return true
        end,
      })
    end

    telescope.setup({
      pickers = {
        live_grep = {
          mappings = {
            i = {
              ["<C-f>"] = ts_select_dir_for_grep,
            },
            n = {
              ["<C-f>"] = ts_select_dir_for_grep,
            },
          },
        },
      },
    })

    -- Telescope Mappings
    -- TODO: Set keymaps with Lazy Syntax
    vim.keymap.set('n', '<leader>dd', ':Telescope diagnostics<CR>')
    vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
    vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
    vim.keymap.set('n', '<leader>fb', '<cmd>Telescope file_browser<cr>')
    vim.keymap.set('n', '<leader>ft', '<cmd>Telescope buffers<cr>')
    vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
    vim.keymap.set('n', '<leader>fc', '<cmd>Telescope colorscheme<cr>')
    vim.keymap.set('n', '<leader>f/', '<cmd>Telescope current_buffer_fuzzy_find<cr>')

end
