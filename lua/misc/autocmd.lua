vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
   pattern = "*.tex",
   callback = function()
      vim.opt_local.wrap = true
      vim.opt_local.linebreak = true
      vim.opt_local.breakindent = false
      --vim.opt_local.textwidth = 200
      --vim.opt_local.wrapmargin = 50
      vim.opt_local.columns = 150
      -- vim.api.nvim_buf_set_keymap(0, "n", "<Up>", "gk", { noremap = true })
      -- vim.api.nvim_buf_set_keymap(0, "n", "<Up>", "gk", { noremap = true })
      vim.api.nvim_buf_set_keymap(0, "n", "<Up>", "gk", { desc = "Up" })
      vim.api.nvim_buf_set_keymap(0, "n", "<Down>", "gj", { desc = "Down" })
      vim.api.nvim_buf_set_keymap(0, "i", "<Up>", "<C-o>gk", { desc = "Up" })
      vim.api.nvim_buf_set_keymap(0, "i", "<Down>", "<C-o>gj", { desc = "Up" })
      print("Wrap, linebreak, and breakindent set for .tex file")
   end,
})

-- vim.api.nvim_create_autocmd({ "TabNewEntered" }, {
--    callback = function()
--       vim.cmd("Neotree")
--    end,
-- })

-- Custom command to close the current buffer without affecting window layout
--
vim.api.nvim_create_user_command("Bdelete", function()
   local buf = vim.api.nvim_get_current_buf()
   -- Get a list of all windows
   local wins = vim.api.nvim_tabpage_list_wins(0)
   -- Close Neotree if it is open in any window
   for _, win in ipairs(wins) do
      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
      if bufname:match("neo%-tree filesystem") then
         vim.cmd("Neotree close")
      end
   end
   -- Delete the current buffer
   vim.cmd("bdelete " .. buf)
   -- Reopen Neotree
   vim.cmd("Neotree")
   vim.cmd("wincmd l")
end, {})

vim.api.nvim_create_user_command("Q", function()
   -- Check for unsaved changes in any buffer
   for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_get_option(buf, "modified") then
         print("Unsaved changes, please save or discard them before quitting.")
         return
      end
   end

   -- Close Neotree if it is open
   local wins = vim.api.nvim_list_wins()
   for _, win in ipairs(wins) do
      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
      if bufname:match("neo%-tree filesystem") then
         vim.cmd("Neotree close")
      end
   end

   -- Close all tabs and windows
   vim.cmd("qa")
end, {})
