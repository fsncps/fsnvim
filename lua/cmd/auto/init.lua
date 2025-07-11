-- vim.api.nvim_create_autocmd({ "VimEnter" }, {
--    callback = function()
--       vim.cmd("Neotree")
--       vim.cmd("Neotree toggle")
--       vim.cmd("Neotree toggle")
--    end,
-- })
vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.cmd("NvimTreeOpen")
		vim.cmd("NvimTreeFocus")
		vim.cmd("NvimTreeFocus")
		-- vim.cmd("Neotree toggle")
		-- vim.cmd("Neotree toggle")
	end,
})

-- vim.api.nvim_create_autocmd({ "VimEnter" }, {
-- 	callback = function()
-- 		-- Check if NeoTree is open and has a window ID
-- 		local neotree_win = vim.fn.bufwinid("Neotree")
-- 		if neotree_win ~= -1 then
-- 			-- Focus the NeoTree window
-- 			vim.api.nvim_set_current_win(neotree_win)
-- 			-- Unfocus by moving to the previous window
-- 			vim.cmd("wincmd p")
-- 		end
--
-- 		-- Ensure focus is on the first non-NeoTree window
-- 		for _, win in ipairs(vim.api.nvim_list_wins()) do
-- 			local buf = vim.api.nvim_win_get_buf(win)
-- 			if vim.bo[buf].filetype ~= "neo-tree" and vim.bo[buf].buftype ~= "terminal" then
-- 				vim.api.nvim_set_current_win(win)
-- 				return
-- 			end
-- 		end
-- 	end,
-- })

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

-- Create an augroup to manage autocommands
vim.api.nvim_create_augroup("InactiveWindowSettings", { clear = true })

-- Autocommand for enabling settings when a window becomes active
vim.api.nvim_create_autocmd("WinEnter", {
	group = "InactiveWindowSettings",
	callback = function()
		if vim.bo.filetype == "NvimTree" then
			return
		end
		-- Enable line numbers and cursorline for the active window
		vim.wo.number = true
		vim.wo.relativenumber = true
		vim.wo.cursorline = true
	end,
})

-- Autocommand for disabling settings when a window becomes inactive
vim.api.nvim_create_autocmd("WinLeave", {
	group = "InactiveWindowSettings",
	callback = function()
		if vim.bo.filetype == "NvimTree" or vim.bo.buftype == "terminal" then
			return
		end
		-- Disable line numbers and cursorline for inactive windows
		vim.wo.number = true
		vim.wo.relativenumber = false
		vim.wo.cursorline = false
	end,
})

-- vim.api.nvim_create_autocmd("TermOpen", {
--    callback = function()
--       if vim.bo.filetype == "neo-tree" then
--          return
--       end
--       -- Disable line numbers and cursor line
--       vim.wo.number = false
--       vim.wo.relativenumber = false
--       vim.wo.cursorline = false
--
--       -- Always start in insert mode
--    end,
-- })
--
-- No Line Numbers in NvimTree
-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
-- 	callback = function(args)
-- 		local bufname = vim.api.nvim_buf_get_name(args.buf)
-- 		if bufname:match("NvimTree.*") then
-- 			vim.opt_local.number = false
-- 			vim.opt_local.relativenumber = false
-- 		end
-- 	end,
-- })
