--VIM OPTS
--
vim.g.have_nerd_font = true
vim.opt.swapfile = false
vim.opt.number = true
vim.opt.relativenumber = true
-- vim.opt.numberwidth = 3
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 3
vim.opt.undodir = vim.fn.expand("~/.nvim-undo")
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.linebreak = true
vim.opt.scrolloff = 10
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.swapfile = false
vim.opt.clipboard = "unnamedplus"

vim.g.dbs = {
   test_db = "mariadb://sql_user:dbpass@localhost/test_db"
}
