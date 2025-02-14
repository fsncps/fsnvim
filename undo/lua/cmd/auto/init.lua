vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
   pattern = "*.tex",
   callback = function()
      vim.opt_local.wrap = true
      vim.opt_local.linebreak = true
      vim.opt_local.breakindent = false
      --vim.opt_local.textwidth = 200
      --vim.opt_local.wrapmargin = 50
      -- vim.opt_local.columns = 130
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
      vim.cmd("Neotree toggle")
      vim.cmd("Neotree toggle")
   end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
   callback = function()
      require("fnct.popup-term").Init_Popup_Term()
      -- Check if NeoTree is open and has a window ID
      local neotree_win = vim.fn.bufwinid('Neotree')
      if neotree_win ~= -1 then
         -- Focus the NeoTree window
         vim.api.nvim_set_current_win(neotree_win)
         -- Unfocus by moving to the previous window
         vim.cmd("wincmd p")
      end
   end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
   desc = "Highlight when yanking (copying) text",
   group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
   callback = function()
      vim.highlight.on_yank()
   end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
   pattern = "*",
   callback = function()
      if vim.bo.filetype == "help" then
         vim.cmd("wincmd L")
      end
   end,
})


vim.g.GIT_COMMIT_HASH = "No data"
vim.g.GIT_AUTHOR = "No data"
vim.g.GIT_DATE = "No data"
vim.g.GIT_COMMIT_MSG = "No data"
vim.g.GIT_STATUS = "Untracked"
--local git_utils = require('fnct.git')

-- vim.api.nvim_create_autocmd("BufEnter", {
--    pattern = "*",
--    callback = function()
--       local filepath = vim.api.nvim_buf_get_name(0)
--       print(filepath)
--       if vim.fn.isdirectory(filepath) == 0 then -- Ensure it's not a directory
--          vim.g.GIT_COMMIT_HASH = git_utils.GET_COMMIT_HASH(filepath)
--          vim.g.GIT_AUTHOR = git_utils.GET_AUTHOR(filepath)
--          vim.g.GIT_DATE = git_utils.GET_DATE(filepath)
--          vim.g.GIT_COMMIT_MSG = git_utils.GET_COMMIT_MSG(filepath)
--          vim.g.GIT_STATUS = git_utils.GET_STATUS(filepath)
--       else
--          vim.g.GIT_COMMIT_HASH = "No data"
--          vim.g.GIT_AUTHOR = "No data"
--          vim.g.GIT_DATE = "No data"
--          vim.g.GIT_COMMIT_MSG = "No data"
--          vim.g.GIT_STATUS = "Untracked"
--       end
--       require('cokeline').setup({
--          sidebar = {
--             filetype = 'neo-tree',
--             components = {
--                {
--                   text = vim.g.GIT_STATUS,
--                   --text = require("fnct.last_commit").Last_Commit(vim.api.nvim_buf_get_name(0)),
--                   fg = '#6f5f5f',
--                   bg = '#1e2030',
--                },
--             },
--          },
--       })
--    end,
-- })
