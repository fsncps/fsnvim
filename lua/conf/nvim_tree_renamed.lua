require("nvim-tree").setup({
	-- -- Set highlight groups AFTER setup
	vim.api.nvim_set_hl(0, "NvimTreeGitUntracked", { fg = "#00ff00" }),
	vim.api.nvim_set_hl(0, "NvimTreeGitStaged", { fg = "#90ee90" }),
	vim.api.nvim_set_hl(0, "NvimTreeGitUnmerged", { fg = "#90ee90" }),
	vim.api.nvim_set_hl(0, "NvimTreeGitRenamed", { fg = "#ffa500" }),
	vim.api.nvim_set_hl(0, "NvimTreeGitDeleted", { fg = "#ff4c4c" }),
	vim.api.nvim_set_hl(0, "NvimTreeGitIgnored", { fg = "#666666" }),
	vim.api.nvim_set_hl(0, "NvimTreeGitUntrackedIcon", { fg = "#ff0000" }),
	vim.api.nvim_set_hl(0, "NvimTreeGitStagedIcon", { fg = "#90ee90" }),
	vim.api.nvim_set_hl(0, "NvimTreeGitUnmergedIcon", { fg = "#90ee90" }),
	vim.api.nvim_set_hl(0, "NvimTreeGitRenamedIcon", { fg = "#ffa500" }),
	vim.api.nvim_set_hl(0, "NvimTreeGitDeletedIcon", { fg = "#ff4c4c" }),
	vim.api.nvim_set_hl(0, "NvimTreeGitIgnoredIcon", { fg = "#666666" }),
})
