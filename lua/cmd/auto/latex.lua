require("toggleterm").setup {
   shell = "/bin/bash --rcfile <(echo '. /etc/profile; . ~/.bashrc; clear')",
}


vim.api.nvim_create_autocmd("BufEnter", {
   pattern = "term://*",
   callback = function()
      -- Ensure terminal buffers are in insert mode when entered
      vim.wo.number = false
      vim.wo.relativenumber = false
      vim.wo.cursorline = false

      -- Enter insert mode automatically
      vim.cmd("startinsert")
   end,
})
