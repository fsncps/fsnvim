function Get_Active_Tab_Name()
   -- Get the current tabpage index
   local tabnr = vim.api.nvim_get_current_tabpage()

   -- Get the list of windows in this tab
   local wins = vim.api.nvim_tabpage_list_wins(tabnr)

   -- Loop through windows and get the buffer name of the first listed buffer
   for _, win in ipairs(wins) do
      local buf = vim.api.nvim_win_get_buf(win)
      local name = vim.api.nvim_buf_get_name(buf)

      -- If we have a valid buffer name, return the last part of the file path
      if name ~= "" then
         return vim.fn.fnamemodify(name, ":t") -- Extract filename from full path
      end
   end

   return "[No Name]" -- Fallback if no named buffer is found
end
