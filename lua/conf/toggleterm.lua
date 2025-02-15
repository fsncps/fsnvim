require("toggleterm").setup {
   shell = "/bin/bash --rcfile <(echo '. /etc/profile; . ~/.bashrc; clear')",
}


-- Function to enter insert mode in terminal buffers
local function enter_insert_mode()
   vim.cmd("startinsert")
end

vim.api.nvim_create_autocmd("BufEnter", {
   pattern = "term://*",
   callback = function()
      -- Ensure terminal buffers are configured properly
      vim.wo.number = false
      vim.wo.relativenumber = false
      vim.wo.cursorline = false

      -- Enter insert mode using the function
      vim.defer_fn(enter_insert_mode, 10) -- Small delay to ensure execution
   end,
})

local Terminal = require("toggleterm.terminal").Terminal

vim.api.nvim_create_user_command("ToggleTermHere", function()
   -- Get the full path of the current buffer
   local bufname = vim.api.nvim_buf_get_name(0)

   -- Extract the directory from the file path
   local dir = vim.fn.fnamemodify(bufname, ":h")

   -- Ensure `dir` is valid (fallback to $HOME if empty)
   if dir == "" or dir == nil then
      dir = vim.fn.expand("~")
   end

   -- Create a new terminal instance with the correct working directory
   local term = Terminal:new({
      dir = dir, -- Set working directory
      close_on_exit = false
   })

   -- Toggle terminal
   term:toggle()
end, { nargs = 0 })
