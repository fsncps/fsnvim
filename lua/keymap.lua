--
--  See `:help wincmd` for a list of all window commands
-- vim.keymap.set("t", "<C-Left>", "<C-\\><C-n><C-w><C-h>", { desc = "Move focus to the left window" })
-- vim.keymap.set("t", "<C-Right>", "<C-\\><C-n><C-w><C-l>", { desc = "Move focus to the right window" })
-- vim.keymap.set("t", "<C-Down>", "<C-\\><C-n><C-w><C-j>", { desc = "Move focus to the lower window" })
-- vim.keymap.set("t", "<C-Up>", "<C-\\><C-n><C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<C-Left>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-Right>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-Down>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-Up>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
-- Both visual and normal mode for each, so you can open with a visual selection or without.
--vim.keymap.set('n', '<C-t>', 'require('fnct.popup-term').Toggle_Terminal()')
vim.keymap.set({ 'n', 'v' }, '<C-t>', function()
   require("fnct.popup-term").Toggle_Terminal()
end, { noremap = true, silent = true })


vim.keymap.set("n", "<C-S-Left>", "<C-w><C-<>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-S-Right>", "<C-w><C->>", { desc = "Increase window width" })
vim.keymap.set("n", "<C-S-Down>", "<C-w><C-->", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-S-Up>", "<C-w><C-+>", { desc = "Increase window height" })


vim.keymap.set("n", "<C-S-_>", "<C-w><C-v>", { desc = "Spilt vertically" })
vim.keymap.set("n", "<C-S-->", "<C-w><C-s>", { desc = "Spilt horizontally" })
-- Map Meta (Alt)
-- vim.keymap.set('n', '<M-x>', ':echo "Metax pressed!"<CR>', { noremap = true, silent = true })
-- Map Hyper

vim.keymap.set("n", "<leader>E", ":Neotree<CR>")

-- open file_browser with the path of the current buffer
vim.keymap.set("n", "<space>B", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
---
---
-- Key mappings for buffer picking and navigation
vim.keymap.set('n', '<leader>bp', '<Plug>(cokeline-pick-focus)', { silent = true, desc = "Pick buffer to focus" })
vim.keymap.set('n', '<leader>bc', '<Plug>(cokeline-pick-close)', { silent = true, desc = "Pick buffer to close" })
vim.keymap.set('n', '<A-Right>', '<Plug>(cokeline-focus-next)', { silent = true, desc = "Focus next buffer" })
vim.keymap.set('n', '<A-Left>', '<Plug>(cokeline-focus-prev)', { silent = true, desc = "Focus previous buffer" })

-- Key mappings for moving buffers
vim.keymap.set('n', '<S-A-Right>', '<Plug>(cokeline-switch-next)', { silent = true, desc = "Move buffer to right" })
vim.keymap.set('n', '<S-A-Left>', '<Plug>(cokeline-switch-prev)', { silent = true, desc = "Move boffer to left" })
vim.keymap.set("n", "<A-q>", ":Bdelete <CR>", { desc = "Close Buffer" })
--mappings for switching buffers
--
--
local function custom_up()
   local line_count = vim.api.nvim_buf_line_count(0)
   local current_line = vim.fn.line('.')
   if current_line <= 13 then
      vim.api.nvim_win_set_cursor(0, { 1, 0 })
   else
      vim.cmd('normal! 13k')
   end
end

local function custom_down()
   local line_count = vim.api.nvim_buf_line_count(0)
   local current_line = vim.fn.line('.')
   if (line_count - current_line) < 13 then
      vim.api.nvim_win_set_cursor(0, { line_count, 0 })
   else
      vim.cmd('normal! 13j')
   end
end

vim.keymap.set('n', '<S-Up>', custom_up, { silent = true, desc = "Move up or jump to top if less than 23 lines to top" })
vim.keymap.set('n', '<S-Down>', custom_down,
   { silent = true, desc = "Move down or jump to bottom if less than 23 lines to bottom" })


vim.keymap.set("n", "<Tab>", ":tabnext<CR>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<S-Tab>", ":tabprevious<CR>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<Leader>B", ":lua ToggleTrueFalse()<CR>", { desc = "Toggle Boolean" })

vim.keymap.set("n", "<C-s>", ":w <CR>", { desc = "Write to file" })
vim.keymap.set("i", "<C-s>", "<Esc>:w <CR>", { desc = "Write to file" })


vim.keymap.set('n', '<D-c>', '"+y', { desc = 'Yank to "+"' })
vim.keymap.set('v', '<D-c>', '"+y', { desc = 'Yank to "+"' })


---prodect-cd
---
vim.keymap.set("n", "<Leader>pp", ":CdProject<CR>", { desc = "Select Project" })
vim.keymap.set("n", "<Leader>pa", ":CdProjectManualAdd<CR>", { desc = "Add Project" })

vim.keymap.set("n", "<C-§>", "<C-§><C-N>", { desc = "Normal Mode from anywhere" })
