return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "onedark",
				section_separators = "",
				component_separators = "",
			},
			sections = {
				lualine_c = { "filename" },
			},
		})
	end,
}
