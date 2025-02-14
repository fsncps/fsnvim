vim.api.nvim_create_user_command("Q", function()
   -- Check for unsaved changes in any buffer
   for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_get_option(buf, "modified") then
         print("⚠️ Unsaved changes, please save or discard them before quitting.")
         return
      end
   end

   -- Close Neo-tree if it is open
   local wins = vim.api.nvim_list_wins()
   for _, win in ipairs(wins) do
      if vim.api.nvim_win_is_valid(win) then
         local buf = vim.api.nvim_win_get_buf(win)
         if vim.bo[buf].filetype == "neo-tree" then
            vim.cmd("Neotree close") -- Close Neo-tree
         end
      end
   end

   -- Close all tabs and windows safely
   vim.cmd("qa")
end, {})
