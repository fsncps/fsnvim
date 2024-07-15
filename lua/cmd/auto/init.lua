vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
   pattern = "*.tex",
   callback = function()
      vim.opt_local.wrap = true
      vim.opt_local.linebreak = true
      vim.opt_local.breakindent = false
      --vim.opt_local.textwidth = 200
      --vim.opt_local.wrapmargin = 50
      vim.opt_local.columns = 150
      -- vim.api.nvim_buf_set_keymap(0, "n", "<Up>", "gk", { noremap = true })
      -- vim.api.nvim_buf_set_keymap(0, "n", "<Up>", "gk", { noremap = true })
      vim.api.nvim_buf_set_keymap(0, "n", "<Up>", "gk", { desc = "Up" })
      vim.api.nvim_buf_set_keymap(0, "n", "<Down>", "gj", { desc = "Down" })
      vim.api.nvim_buf_set_keymap(0, "i", "<Up>", "<C-o>gk", { desc = "Up" })
      vim.api.nvim_buf_set_keymap(0, "i", "<Down>", "<C-o>gj", { desc = "Up" })
      print("Wrap, linebreak, and breakindent set for .tex file")
   end,
})

vim.api.nvim_create_autocmd({ "VimEnter", "TabEnter" }, {
   callback = function()
      vim.cmd("Neotree")
   end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
   desc = "Highlight when yanking (copying) text",
   group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
   callback = function()
      vim.highlight.on_yank()
   end,
})
