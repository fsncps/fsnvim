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
