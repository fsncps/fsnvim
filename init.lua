---
---
---
---

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.g.set_numbers = true
vim.opt.swapfile = false
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.undodir = vim.fn.expand("~/.config/nvim/undo")
vim.opt.undofile = true

require("misc.autocmd")
require("misc.functions")
require("keymap")

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
   local lazyrepo = "https://github.com/folke/lazy.nvim.git"
   vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end -- -@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

--

require("lazy").setup("plugins")

---
---
---

vim.cmd.colorscheme("catppuccin")

vim.opt.termguicolors = true
require("bufferline").setup({})
require("ibl").setup()
require("guess-indent").setup({})

-- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
--    pattern = "*.tex",
--    callback = function()
--       vim.opt_local.wrap = true
--       vim.opt_local.linebreak = true
--       vim.opt_local.breakindent = true
--       vim.opt_local.breakindentopt = "shift:2,min:20"
--       vim.opt_local.showbreak = "↪ "
--       print("Wrap, linebreak, and breakindent set for .tex file")
--    end,
-- })
--require("misc.autocmd")
