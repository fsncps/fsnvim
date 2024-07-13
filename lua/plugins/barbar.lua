return {
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {
			animation = true,
			insert_at_end = true,
			icons = {
				buffer_index = false,
				buffer_number = false,
				button = false,
				filetype = { enabled = true },
				separator = { left = "|", right = "" },
				diagnostics = { enabled = false },
				modified = { enabled = true },
			},
			maximum_length = 30,
			maximum_padding = 1, -- Adjust padding to your preference
			no_name_title = "[No Name]", -- Title for unnamed buffers
			sidebar_filetypes = {
				["neo-tree"] = true, -- Enable offset for NeoTree
			},
			offsets = {
				{
					filetype = "neo-tree", -- Filetype for NeoTree
					text = "File Explorer",
					highlight = "Directory",
					text_align = "left",
					separator = true,
					padding = 25, -- Offset by 25 columns
				},
			},
			version = "^1.0.0", -- optional: only update when a new 1.x version is released
		},
	},
}
