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
