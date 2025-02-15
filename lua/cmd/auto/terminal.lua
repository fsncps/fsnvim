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
