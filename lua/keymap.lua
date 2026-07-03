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

----
vim.keymap.set("n", "<C-S-Left>", "<C-w><C-<>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-S-Right>", "<C-w><C->>", { desc = "Increase window width" })
vim.keymap.set("n", "<C-S-Down>", "<C-w><C-->", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-S-Up>", "<C-w><C-+>", { desc = "Increase window height" })

-- File Explorers
vim.keymap.set("n", "<leader>E", ":Neotree<CR>", { desc = "Toggle File Explorer" })
vim.keymap.set("n", "<leader>e", ":Neotree<CR>", { desc = "Toggle File Explorer" })

-- open file_browser with the path of the current buffer
vim.keymap.set("n", "<space>B", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { desc = "Telescope File Browser" })

---
---
-- Key mappings for buffer picking and navigation
vim.keymap.set("n", "<leader>bp", "<Plug>(cokeline-pick-focus)", { silent = true, desc = "Pick buffer to focus" })
vim.keymap.set("n", "<leader>bP", ":bprevious<CR>", { noremap = true, silent = true, desc = "Previous Buffer" })
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { noremap = true, silent = true, desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bc", "<Plug>(cokeline-pick-close)", { silent = true, desc = "Pick buffer to close" })
vim.keymap.set("n", "<A-Right>", "<Plug>(cokeline-focus-next)", { silent = true, desc = "Focus next buffer" })
vim.keymap.set("n", "<A-Left>", "<Plug>(cokeline-focus-prev)", { silent = true, desc = "Focus previous buffer" })
vim.keymap.set("n", "<C-Tab>", "<Plug>(cokeline-focus-next)", { silent = true, desc = "Focus next buffer" })
vim.keymap.set("n", "<C-S-Tab>", "<Plug>(cokeline-focus-prev)", { silent = true, desc = "Focus previous buffer" })
-- Key mappings for switching buffers
vim.keymap.set("n", "<S-A-Right>", "<Plug>(cokeline-switch-next)", { silent = true, desc = "Move buffer on line" })
vim.keymap.set("n", "<S-A-Left>", "<Plug>(cokeline-switch-prev)", { silent = true, desc = "Move buffer on line" })
--mappings for switching buffers
--

local function custom_up()
   local current_line = vim.fn.line(".")
   if current_line <= 23 then
      vim.api.nvim_win_set_cursor(0, { 1, 0 })
   else
      vim.cmd("normal! 23k")
   end
end

local function custom_down()
   local line_count = vim.api.nvim_buf_line_count(0)
   local current_line = vim.fn.line(".")
   if (line_count - current_line) < 23 then
      vim.api.nvim_win_set_cursor(0, { line_count, 0 })
   else
      vim.cmd("normal! 23j")
   end
end

vim.keymap.set("n", "<S-Up>", custom_up, { silent = true, desc = "Move up or jump to top if less than 23 lines to top" })
vim.keymap.set("n", "<S-Down>", custom_down, { silent = true, desc = "Move down or jump to bottom if less than 23 lines to bottom" })

vim.keymap.set("n", "<Leader>0", ":lua ToggleTrueFalse()<CR>", { desc = "Toggle Boolean" })

vim.keymap.set("n", "<C-s>", ":w <CR>", { desc = "Write to file" })
vim.keymap.set("i", "<C-s>", "<Esc>:w <CR>", { desc = "Write to file" })

vim.keymap.set("n", "<A-c>", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("v", "<A-c>", '"+y', { desc = "Yank to system clipboard" })

---prodect-cd
---
vim.keymap.set("n", "<Leader>pp", ":CdProject<CR>", { desc = "Select Project" })
vim.keymap.set("n", "<Leader>pa", ":CdProjectManualAdd<CR>", { desc = "Add Project" })

-- Window management
vim.keymap.set("n", "<leader>wc", ":close<CR>", { desc = "Close window" })
vim.keymap.set("n", "<leader>ws", ":split<CR>", { desc = "Horizontal split" })
vim.keymap.set("n", "<leader>wv", ":vsplit<CR>", { desc = "Vertical split" })

-- File operations
vim.keymap.set("n", "<leader>fs", ":w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>fq", ":q<CR>", { desc = "Quit file" })

-- Clipboard (leader-prefixed versions)
vim.keymap.set({ "n", "v" }, "<leader>cy", '"+y', { desc = "Yank to System Clipboard" })
vim.keymap.set("n", "<leader>cp", '"+p', { desc = "Paste from System Clipboard" })

-- Remove the existing Comment.nvim keybindings
vim.opt.tabpagemax = 15 -- Max number of tabs

-- Terminal mode
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
vim.keymap.set("t", "jk", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
vim.keymap.set("t", "<C-Left>", "<Cmd>wincmd h<CR>", { desc = "Move focus left" })
vim.keymap.set("t", "<C-Down>", "<Cmd>wincmd j<CR>", { desc = "Move focus down" })
vim.keymap.set("t", "<C-Up>", "<C-w><C-k>", { desc = "Move focus up" })
vim.keymap.set("t", "<C-Right>", [[<Cmd>wincmd l<CR>]], { desc = "Move focus right" })
vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], { desc = "Move focus left" })
vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], { desc = "Move focus down" })
vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], { desc = "Move focus up" })
vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], { desc = "Move focus right" })
vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], { desc = "Window command prefix" })

vim.keymap.set("n", "<Leader>T", ":ToggleTerm size=15 <CR>", { desc = "Add Terminal" })

-- Tab management
vim.keymap.set("n", "<Leader>tt", ":tabnew<CR>", { desc = "Create Tab" })
vim.keymap.set("n", "<Leader>tr", ":RenameTab ", { desc = "Rename Tab" })
vim.keymap.set("n", "<Leader>tn", ":tabnext<CR>", { desc = "Next Tab" })
vim.keymap.set("n", "<Leader>tp", ":tabprevious<CR>", { desc = "Previous Tab" })

-----jump to file in tree
vim.keymap.set("n", "<leader>F", require("cmd.nvimTree").focus_current_file_in_tree, {
   desc = "Reveal current file in NvimTree",
})
--- set root to buffer root
vim.keymap.set("n", "<leader>R", require("cmd.nvimTree").set_tree_root_to_buffer_dir, {
   desc = "Set NvimTree root to current buffer",
})

-- Use <Tab> and <S-Tab> to cycle through completions in command-line mode
vim.keymap.set("c", "<Tab>", function()
   if vim.fn.wildmenumode() == 1 then
      return "<C-y>"
   else
      return "<C-n>"
   end
end, { expr = true, desc = "Accept wildmenu or cycle completion" })
vim.keymap.set("c", "<Down>", "<C-n>", { noremap = true, desc = "Next completion" })
vim.keymap.set("c", "<Up>", "<C-p>", { noremap = true, desc = "Previous completion" })

-- Claude Code
vim.keymap.set("n", "<leader>cc", "<cmd>ClaudeCode<CR>", { desc = "Toggle Claude Code" })
