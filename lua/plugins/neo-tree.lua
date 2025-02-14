return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		-- vim.api.nvim_create_autocmd("FileType", {
		-- 	pattern = "neo-tree",
		-- 	callback = function()
		-- 		vim.wo.number = false
		-- 		vim.wo.relativenumber = false
		-- 	end,
		-- })
		require("neo-tree").setup({
			close_if_last_window = false,
			window = {
				position = "left",
				width = 25, -- Set the width to your desired value
				number = false,
				-- other configurations...
			},
		})
		-- vim.api.nvim_create_autocmd("VimEnter", {
		-- 	callback = function()
		-- 		vim.cmd("Neotree")
		-- 	end,
		-- })
	end,
}
