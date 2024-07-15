--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("t", "<C-Left>", "<C-\\><C-n><C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("t", "<C-Right>", "<C-\\><C-n><C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("t", "<C-Down>", "<C-\\><C-n><C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("t", "<C-Up>", "<C-\\><C-n><C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<C-Left>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-Right>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-Down>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-Up>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
-- Both visual and normal mode for each, so you can open with a visual selection or without.

vim.keymap.set("n", "<leader>E", ":Neotree<CR>")

-- open file_browser with the path of the current buffer
---vim.keymap.set("n", "<space>B", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
---
---
vim.keymap.set(
   "n",
   "<A-Right>",
   ':lua if not Is_Neo_Tree() then vim.cmd("BufferNext") else vim.cmd("wincmd l | BufferNext") end<CR>',
   { desc = "Next Buffer-Tab" }
)
vim.keymap.set(
   "n",
   "<A-Left>",
   ':lua if not Is_Neo_Tree() then vim.cmd("BufferPrevious") else vim.cmd("wincmd l | BufferPrevious") end<CR>',
   { desc = "Previous Buffer-Tab" }
)

-- Key mappings for tab navigation
vim.keymap.set("n", "<Tab>", ":tabnext<CR>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<S-Tab>", ":tabprevious<CR>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<Leader>B", ":lua ToggleTrueFalse()<CR>", { desc = "Toggle Boolean" })

vim.keymap.set("n", "<C-s>", ":w <CR>", { desc = "Write to file" })
vim.keymap.set("n", "<C-q>", ":Bdelete <CR>", { desc = "Close Buffer-Tab" })

-- local funcs = require('fnct')
-- vim.keymap.set("n", "<leader>t", function() funcs.Toggle_Floating_Terminal() end, { desc = "Toggle Floating Terminal" })
-- vim.keymap.set("n", "<leader>t", ":lua Toggle_Floating_Terminal()<CR>", { desc = "Toggle Floating Terminal" })

--vim.keymap.set('n', '<C-t>', ':lua Open_Terminal_in_Float()<CR>', { desc = "Close Buffer-Tab" })
-- vim.keymap.set('i', '<C-t>', '<Esc>:lua Open_Terminal_in_Float()<CR>', { desc = "Close Buffer-Tab" })
-- vim.keymap.set('v', '<C-t>', '<Esc>:lua Open_Terminal_in_Float()<CR>', { desc = "Close Buffer-Tab" })
--im.keymap.set("n", "<leader>t", ":lua Open_Terminal_in_Float()<CR>", { desc = "Floating Terminal" })
