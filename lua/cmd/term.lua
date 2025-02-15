vim.api.nvim_create_user_command("SplitTerminal", function()
   local bufdir = vim.fn.expand("%:p:h")            -- Get the directory of the current buffer
   if bufdir == "" then bufdir = vim.fn.getcwd() end -- Fallback to CWD if the buffer has no file path

   -- Open a vertical split
   vim.cmd("vsplit")

   -- Open ToggleTerm inside the new split with the current buffer's directory
   vim.cmd("ToggleTerm size=17 dir=" .. vim.fn.fnameescape(bufdir) .. " direction=vertical")
end, {})
