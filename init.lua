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

-- vim.cmd([[highlight MsgArea guibg=#24273a guifg=#7ce322]])
--
-- -- Below Statusline (Command Line)
-- vim.cmd([[highlight CmdLine guibg=#24273a guifg=#7da474]])
--
-- -- Tabline (Header Texts)
-- vim.cmd([[highlight TabLine guibg=#ff0000]])
--
-- -- Popup Windows
-- vim.cmd([[highlight Pmenu guibg=#24273a]])
-- vim.cmd([[highlight PmenuSel guibg=#7da474 guifg=#24273a]])
--
-- vim.cmd([[highlight Normal guibg=#24273a]])
--
-- vim.cmd([[highlight MyPopupTextTop guibg=#7ce322]])
-- vim.cmd([[highlight MyPopupTextBottom guibg=#7ce322]])
