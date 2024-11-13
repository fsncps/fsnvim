-----------------------------------------------------------------
-- $$$$$$$$\  $$$$$$\  $$\   $$\ $$\    $$\ $$$$$$\ $$\      $$\
-- $$  _____|$$  __$$\ $$$\  $$ |$$ |   $$ |\_$$  _|$$$\    $$$ |
-- $$ |      $$ /  \__|$$$$\ $$ |$$ |   $$ |  $$ |  $$$$\  $$$$ |
-- $$$$$\    \$$$$$$\  $$ $$\$$ |\$$\  $$  |  $$ |  $$\$$\$$ $$ |
-- $$  __|    \____$$\ $$ \$$$$ | \$$\$$  /   $$ |  $$ \$$$  $$ |
-- $$ |      $$\   $$ |$$ |\$$$ |  \$$$  /    $$ |  $$ |\$  /$$ |
-- $$ |      \$$$$$$  |$$ | \$$ |   \$  /   $$$$$$\ $$ | \_/ $$ |
-- \__|       \______/ \__|  \__|    \_/    \______|\__|     \__|
-----------------------------------------------------------------
-----------------------------------------------------------------

vim.g.mapleader = " "
vim.g.maplocalleaderg = " "
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
   local lazyrepo = "https://github.com/folke/lazy.nvim.git"
   vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")
require("opts")
require("fnct")
require("cmd")
require("cmd.auto")
require("conf")
require("keymap")
require('fnct.popup-term').Init_Popup_Term()
require('misc.eris.eris')
