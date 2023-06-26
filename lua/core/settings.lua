-- Vim General Options
vim.opt.cursorline = true
vim.opt.colorcolumn = '120'
vim.opt.termencoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.fileencodings = 'ucs-bom,utf-8,chinese,cp936'

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.hlsearch = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.wildmode = 'longest,list,full' 
vim.opt.wildmenu = true

vim.opt.laststatus=2
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.showmode = true

vim.opt.fillchars = {
  fold = " ", -- remove folding chars
  vert = "\\", -- set vsplit chars
}

vim.opt.guicursor = vim.opt.guicursor + 'a:-Cursor-blinkwait155-blinkoff130-blinkon155'
vim.api.nvim_set_hl(0, 'Cursor', {reverse=true,bg='NONE',fg='NONE'})
vim.opt.breakindent = true
vim.opt.encoding='utf-8'
vim.opt.updatetime=750
vim.opt.hidden = true
vim.opt.title = true
vim.opt.textwidth=0
vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.signcolumn='yes'
vim.opt.number = true
vim.opt.wrap = false
vim.opt.rnu = true
vim.opt.mouse='a'
vim.opt.so = 5

vim.opt.completeopt = 'menu,menuone,noselect'

