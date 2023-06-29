local config_dir = vim.fn.stdpath("config")

-- Importing Keymaps and Settings
require("core.settings")
require("core.keymaps")
-- Importing Lua Configuration Files
require("core.plugins")
--require("core.plugin_config")

-- Importing Vim scripts
vim.cmd.source(config_dir .. "/functions.vim")
