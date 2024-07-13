vim.opt.termguicolors = true
require("bufferline").setup({})
require("ibl").setup()
require("guess-indent").setup({})
require("misc.autocmd")

-- Ensure this is after plugin setup
vim.api.nvim_create_user_command("Q", function()
   -- Close Neotree if it is open
   local wins = vim.api.nvim_list_wins()
   for _, win in ipairs(wins) do
      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
      if bufname:match("neo%-tree filesystem") then
         vim.cmd("Neotree close")
      end
   end
   -- Close the current buffer
   vim.cmd("bdelete")
end, {})

vim.cmd([[
  command! -nargs=0 q :Q
]])
