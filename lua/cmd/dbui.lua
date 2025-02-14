vim.api.nvim_create_user_command("DBExecuteQuery", function()
   -- Simulate execution of the SQL query (trigger <Leader>S)
   vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc><Esc><Esc><Leader>S", true, false, true), "n", false)

   -- Wait for the execution to finish (small delay to ensure the buffer updates)
   vim.defer_fn(function()
      -- Identify the 'dbout' window by its buffer name (assuming 'dbout' is the buffer name)
      for _, win in ipairs(vim.api.nvim_list_wins()) do
         local buf = vim.api.nvim_win_get_buf(win)
         local bufname = vim.api.nvim_buf_get_name(buf)
         if bufname:match("4.dbout") then
            -- Set the height of 'dbout' to 40 lines
            vim.api.nvim_win_set_height(win, 40)
            break
         end
      end
   end, 200) -- Delay to ensure dbout buffer is updated
end, {})
