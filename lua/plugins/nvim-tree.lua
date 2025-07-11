return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			renderer = {
				highlight_git = true, -- must be true to apply custom hl groups
				icons = {
					git_placement = "after",
					glyphs = {
						git = {
							unstaged = "✎",
							staged = "✔",
							unmerged = "",
							renamed = "➡",
							untracked = " ",
							deleted = "",
							ignored = "☒",
						},
					},
				},
			},
			on_attach = function(bufnr)
				local api = require("nvim-tree.api")
				local function opts(desc)
					return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end

				local keymap = vim.keymap.set
				keymap("n", ".", api.tree.change_root_to_node, opts("CD"))
				keymap("n", "<C-k>", api.node.show_info_popup, opts("Info"))
				keymap("n", "<C-r>", api.fs.rename_sub, opts("Rename: Omit Filename"))
				keymap("n", "<C-t>", api.node.open.tab, opts("Open: New Tab"))
				keymap("n", "<C-v>", api.node.open.vertical, opts("Open: Vertical Split"))
				keymap("n", "<C-h>", api.node.open.horizontal, opts("Open: Horizontal Split"))
				keymap("n", "<BS>", api.node.navigate.parent_close, opts("Close Directory"))
				keymap("n", "<CR>", api.node.open.edit, opts("Open"))
				keymap("n", "<Tab>", api.node.open.preview, opts("Open Preview"))
				keymap("n", "<C-Up>", api.tree.change_root_to_parent, opts("Up"))
				keymap("n", "a", api.fs.create, opts("Create File or Directory"))
				keymap("n", "bd", api.marks.bulk.delete, opts("Delete Bookmarked"))
				keymap("n", "bt", api.marks.bulk.trash, opts("Trash Bookmarked"))
				keymap("n", "bmv", api.marks.bulk.move, opts("Move Bookmarked"))
				keymap("n", "c", api.fs.copy.node, opts("Copy"))
				keymap("n", "C", api.tree.toggle_git_clean_filter, opts("Toggle Filter: Git Clean"))
				keymap("n", "B", api.tree.toggle_no_buffer_filter, opts("Toggle Filter: No Buffer"))
				keymap("n", "d", api.fs.remove, opts("Delete"))
				keymap("n", "D", api.fs.trash, opts("Trash"))
				keymap("n", "E", api.tree.expand_all, opts("Expand All"))
				keymap("n", "e", api.fs.rename_basename, opts("Rename: Basename"))
				keymap("n", "F", api.live_filter.clear, opts("Live Filter: Clear"))
				keymap("n", "f", api.live_filter.start, opts("Live Filter: Start"))
				keymap("n", "g?", api.tree.toggle_help, opts("Help"))
				keymap("n", "gy", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
				keymap("n", "ge", api.fs.copy.basename, opts("Copy Basename"))
				keymap("n", "H", api.tree.toggle_hidden_filter, opts("Toggle Filter: Dotfiles"))
				keymap("n", "I", api.tree.toggle_gitignore_filter, opts("Toggle Filter: Git Ignore"))
				keymap("n", "L", api.node.open.toggle_group_empty, opts("Toggle Group Empty"))
				keymap("n", "M", api.tree.toggle_no_bookmark_filter, opts("Toggle Filter: No Bookmark"))
				keymap("n", "m", api.marks.toggle, opts("Toggle Bookmark"))
				keymap("n", "p", api.fs.paste, opts("Paste"))
				keymap("n", "P", api.node.navigate.parent, opts("Parent Directory"))
				keymap("n", "q", api.tree.close, opts("Close"))
				keymap("n", "R", api.tree.reload, opts("Refresh"))
				keymap("n", "S", api.tree.search_node, opts("Search"))
				keymap("n", "r", api.fs.rename_full, opts("Rename: Full Path"))
				keymap("n", "U", api.tree.toggle_custom_filter, opts("Toggle Filter: Hidden"))
				keymap("n", "W", api.tree.collapse_all, opts("Collapse All"))
				keymap("n", "x", api.fs.cut, opts("Cut"))
				keymap("n", "y", api.fs.copy.filename, opts("Copy Name"))
				keymap("n", "Y", api.fs.copy.relative_path, opts("Copy Relative Path"))
				keymap("n", "<Right>", api.node.open.edit, opts("Expand Node"))
				keymap("n", "<Left>", api.node.navigate.parent_close, opts("Collapse Node"))
				keymap("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))
				keymap("n", "<2-RightMouse>", api.tree.change_root_to_node, opts("CD"))
			end,
		})

		-- Set highlight groups AFTER setup
		vim.api.nvim_set_hl(0, "NvimTreeModifiedBrick", { fg = "#B22222" })
		vim.api.nvim_set_hl(0, "NvimTreeGitUntracked", { fg = "#00ff00" }) -- bright green
		vim.api.nvim_set_hl(0, "NvimTreeGitStaged", { fg = "#90ee90" }) -- light green
		vim.api.nvim_set_hl(0, "NvimTreeGitUnmerged", { fg = "#90ee90" }) -- light green
		vim.api.nvim_set_hl(0, "NvimTreeGitRenamed", { fg = "#ffa500" }) -- orange
		vim.api.nvim_set_hl(0, "NvimTreeGitDeleted", { fg = "#ff4c4c" }) -- red
		vim.api.nvim_set_hl(0, "NvimTreeGitIgnored", { fg = "#666666" }) -- grey
	end,
}
