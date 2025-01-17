local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Sets up Lazy Plugin Manager

-- Grabs Configs from Plugins Folder
local function conf(config_name)
	return require(string.format("core.plugin_config.%s", config_name))
end

require("lazy").setup({
    {
		-- Main Color Scheme
		"folke/tokyonight.nvim",
		lazy = false, -- make sure to load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme tokyonight-night]])
		end,
    },
    {
        "HiPhish/nvim-ts-rainbow2",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = conf("nvim-ts-rainbow"),
    },
    {
		-- File tree
		'nvim-tree/nvim-tree.lua',
		dependencies = 'nvim-tree/nvim-web-devicons',
		config = conf("nvim-tree")
    },
	{
		"nvim-tree/nvim-web-devicons",
		config = conf("nvim-web-devicons"),
		name = "nvim-web-devicons",
		lazy = true,
	},
	{
		-- Lua Line
		'nvim-lualine/lualine.nvim',
		dependencies = 'nvim-tree/nvim-web-devicons',
		config = conf("lualine")
	},
  	{
  		-- Syntax Highlighting
  		'nvim-treesitter/nvim-treesitter',
  		config = conf("nvim-treesitter")
  	},
	{
		-- File Searching
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
			}
		},
		config = conf("telescope")
	},
    {
        "nvim-telescope/telescope-file-browser.nvim",
        lazy = true,
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        config = conf("telescope-browser")
    },
    -- LSP Support
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{
		"neovim/nvim-lspconfig",
		-- This config is applied to all 3 plugins
		config = conf("lsp-config")
	},
	-- Completion with LSP
	{'hrsh7th/cmp-nvim-lsp'},
    -- Loads Function Signature Help
    {'hrsh7th/cmp-nvim-lsp-signature-help'},
	{'hrsh7th/cmp-buffer'},
	{'hrsh7th/cmp-path'},
	{'hrsh7th/cmp-cmdline'},
	{
		'hrsh7th/nvim-cmp',
		config = conf("nvim-cmp")
	},
	{ 'hrsh7th/vim-vsnip' },
    -- { 'hrsh7th/cmp-vsnip' },
	{ 'hrsh7th/vim-vsnip-integ' },
-- BEHAVIOUR
    -- Colorizes Color Codes
    {
        'norcalli/nvim-colorizer.lua',
        lazy = true,
		config = function ()
			require("colorizer").setup({
				"*",
				"!git"
			})
		end,
    },
-- Functionalities
    {
        "windwp/nvim-autopairs",
        opts = {}
    },
    -- Disables Highlight after search
    { 'romainl/vim-cool' },
    -- Surround utilities
    {'tpope/vim-surround'},
    -- General Vim defaults users usually agree on
    -- {'tpope/vim-sensible'},
    {
        'numToStr/Comment.nvim',
        config = function ()
            require('Comment').setup()
        end,
        lazy = false,
    },
    -- Shows current cursor context - Lightweight alternative to context.vim
    {'nvim-treesitter/nvim-treesitter-context'},
    -- Highlighting on comments
    {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = conf('todo-comments')
    },
	-- Tmux Navigation
    {'christoomey/vim-tmux-navigator'},
	-- Git integration
	{ "lewis6991/gitsigns.nvim", config = conf("gitsigns") },
    {'simeji/winresizer',
        init = function() vim.g.winresizer_start_key = '<C-p>' end
    },
    { 'mg979/vim-visual-multi', branch = "master" },
})
