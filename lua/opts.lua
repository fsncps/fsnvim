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
vim.opt.foldenable = false
---vim.opt.clipboard = "unnamedplus"

-- vim.g.dbs = {
--    test_db = "mysql://mysql_user:dbpass@localhost/test_db"
-- }
--
--
--
vim.g.lazygit_floating_window_winblend = 1 -- transparency of floating window
vim.g.lazygit_floating_window_scaling_factor = 0.85 -- scaling factor for floating window
vim.g.lazygit_floating_window_border_chars = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' } -- customize lazygit popup window border characters
vim.g.lazygit_floating_window_use_plenary = 1 -- use plenary.nvim to manage floating window if available
vim.g.lazygit_use_neovim_remote = 1 -- fallback to 0 if neovim-remote is not installed

vim.g.lazygit_use_custom_config_file_path = 0 -- config file path is evaluated if this value is 1
vim.g.lazygit_config_file_path = '' -- custom config file path
-- OR
vim.g.lazygit_config_file_path = {} -- table of custom config file paths

vim.g.lazygit_on_exit_callback = nil -- optional function callback when exiting lazygit (useful for example to refresh some UI elements after lazy git has made some changes)

vim.opt.showtabline = 2 -- Always show the tabline, even if only one tab is open
