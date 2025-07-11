local api = require("nvim-tree.api")

local function on_attach(bufnr)
	local function opts(desc)
		return {
			desc = "nvim-tree: " .. desc,
			noremap = true,
			silent = true,
			nowait = true,
			buffer = bufnr,
		}
	end
	local keymap = vim.keymap.set
	keymap("n", "R", api.tree.reload, opts("Refresh"))
	keymap("n", "<C-k>", api.node.show_info_popup, opts("Info"))
	keymap("n", "S", api.tree.search_node, opts("Search"))
	keymap("n", "W", api.tree.collapse_all, opts("Collapse All"))
	keymap("n", "<Left>", api.node.navigate.parent_close, opts("Collapse Node"))
	keymap("n", "q", api.tree.close, opts("Close"))
	keymap("n", "<BS>", api.node.navigate.parent_close, opts("Close Directory"))
	keymap("n", "gy", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
	keymap("n", "ge", api.fs.copy.basename, opts("Copy Basename"))
	keymap("n", "c", api.fs.copy.node, opts("Copy"))
	keymap("n", "y", api.fs.copy.filename, opts("Copy Name"))
	keymap("n", "Y", api.fs.copy.relative_path, opts("Copy Relative Path"))
	keymap("n", "x", api.fs.cut, opts("Cut"))
	keymap("n", "d", api.fs.remove, opts("Delete"))
	keymap("n", "bd", api.marks.bulk.delete, opts("Delete Bookmarked"))
	keymap("n", "E", api.tree.expand_all, opts("Expand All"))
	keymap("n", "<Right>", api.node.open.edit, opts("Expand Node"))
	keymap("n", "F", api.live_filter.clear, opts("Live Filter: Clear"))
	keymap("n", "f", api.live_filter.start, opts("Live Filter: Start"))
	keymap("n", "g?", api.tree.toggle_help, opts("Help"))
	keymap("n", "a", api.fs.create, opts("Create File or Directory"))
	keymap("n", "m", api.marks.toggle, opts("Toggle Bookmark"))
	keymap("n", "M", api.tree.toggle_no_bookmark_filter, opts("Toggle Filter: No Bookmark"))
	keymap("n", "B", api.tree.toggle_no_buffer_filter, opts("Toggle Filter: No Buffer"))
	keymap("n", "C", api.tree.toggle_git_clean_filter, opts("Toggle Filter: Git Clean"))
	keymap("n", "I", api.tree.toggle_gitignore_filter, opts("Toggle Filter: Git Ignore"))
	keymap("n", "U", api.tree.toggle_custom_filter, opts("Toggle Filter: Hidden"))
	keymap("n", "H", api.tree.toggle_hidden_filter, opts("Toggle Filter: Dotfiles"))
	keymap("n", "L", api.node.open.toggle_group_empty, opts("Toggle Group Empty"))
	keymap("n", "<C-h>", api.node.open.horizontal, opts("Open: Horizontal Split"))
	keymap("n", "<CR>", api.node.open.edit, opts("Open"))
	keymap("n", "<Tab>", api.node.open.preview, opts("Open Preview"))
	keymap("n", "<C-t>", api.node.open.tab, opts("Open: New Tab"))
	keymap("n", "<C-v>", api.node.open.vertical, opts("Open: Vertical Split"))
	keymap("n", "P", api.node.navigate.parent, opts("Parent Directory"))
	keymap("n", "p", api.fs.paste, opts("Paste"))
	keymap("n", ".", api.tree.change_root_to_node, opts("CD"))
	keymap("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))
	keymap("n", "<2-RightMouse>", api.tree.change_root_to_node, opts("CD"))
	keymap("n", "r", api.fs.rename_full, opts("Rename: Full Path"))
	keymap("n", "e", api.fs.rename_basename, opts("Rename: Basename"))
	keymap("n", "<C-r>", api.fs.rename_sub, opts("Rename: Omit Filename"))
	keymap("n", "<C-Up>", api.tree.change_root_to_parent, opts("Up"))
	keymap("n", "bt", api.marks.bulk.trash, opts("Trash Bookmarked"))
	keymap("n", "D", api.fs.trash, opts("Trash"))
	keymap("n", "bmv", api.marks.bulk.move, opts("Move Bookmarked"))
end

require("nvim-tree").setup({
	on_attach = on_attach,
	hijack_cursor = false,
	auto_reload_on_write = true,
	disable_netrw = false,
	hijack_netrw = true,
	hijack_unnamed_buffer_when_opening = false,
	root_dirs = {},
	prefer_startup_root = false,
	sync_root_with_cwd = false,
	reload_on_bufenter = false,
	respect_buf_cwd = false,
	select_prompts = false,
	sort = {
		sorter = "name",
		folders_first = true,
		files_first = false,
	},
	view = {
		centralize_selection = false,
		cursorline = true,
		-- cursorlineopt = "both",
		debounce_delay = 15,
		side = "left",
		preserve_window_proportions = false,
		number = false,
		relativenumber = false,
		signcolumn = "yes",
		width = 30,
		float = {
			enable = false,
			quit_on_focus_loss = true,
			open_win_config = {
				relative = "editor",
				border = "rounded",
				width = 30,
				height = 30,
				row = 1,
				col = 1,
			},
		},
	},
	renderer = {
		add_trailing = false,
		group_empty = false,
		full_name = false,
		root_folder_label = ":~:s?$?/..?",
		indent_width = 2,
		special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
		hidden_display = "none",
		symlink_destination = true,
		decorators = { "Git", "Open", "Hidden", "Modified", "Bookmark", "Diagnostics", "Copied", "Cut" },
		highlight_git = "none",
		highlight_diagnostics = "none",
		highlight_opened_files = "none",
		highlight_modified = "none",
		highlight_hidden = "none",
		highlight_bookmarks = "none",
		highlight_clipboard = "name",
		indent_markers = {
			enable = false,
			inline_arrows = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				bottom = "─",
				none = " ",
			},
		},
		icons = {
			web_devicons = {
				file = {
					enable = true,
					color = true,
				},
				folder = {
					enable = false,
					color = true,
				},
			},
			git_placement = "before",
			modified_placement = "after",
			hidden_placement = "after",
			diagnostics_placement = "signcolumn",
			bookmarks_placement = "signcolumn",
			padding = {
				icon = " ",
				folder_arrow = " ",
			},
			symlink_arrow = " ➛ ",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
				modified = true,
				hidden = false,
				diagnostics = true,
				bookmarks = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				bookmark = "󰆤",
				modified = "●",
				hidden = "󰜌",
				folder = {
					arrow_closed = "",
					arrow_open = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	update_focused_file = {
		enable = false,
		update_root = {
			enable = false,
			ignore_list = {},
		},
		exclude = false,
	},
	system_open = {
		cmd = "",
		args = {},
	},
	git = {
		enable = true,
		show_on_dirs = true,
		show_on_open_dirs = true,
		disable_for_dirs = {},
		timeout = 400,
		cygwin_support = false,
	},
	diagnostics = {
		enable = false,
		show_on_dirs = false,
		show_on_open_dirs = true,
		debounce_delay = 500,
		severity = {
			min = vim.diagnostic.severity.HINT,
			max = vim.diagnostic.severity.ERROR,
		},
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	modified = {
		enable = false,
		show_on_dirs = true,
		show_on_open_dirs = true,
	},
	filters = {
		enable = true,
		git_ignored = true,
		dotfiles = false,
		git_clean = false,
		no_buffer = false,
		no_bookmark = false,
		custom = {},
		exclude = {},
	},
	live_filter = {
		prefix = "[FILTER]: ",
		always_show_folders = true,
	},
	filesystem_watchers = {
		enable = true,
		debounce_delay = 50,
		ignore_dirs = {
			"/.ccls-cache",
			"/build",
			"/node_modules",
			"/target",
		},
	},
	actions = {
		use_system_clipboard = true,
		change_dir = {
			enable = true,
			global = false,
			restrict_above_cwd = false,
		},
		expand_all = {
			max_folder_discovery = 300,
			exclude = {},
		},
		file_popup = {
			open_win_config = {
				col = 1,
				row = 1,
				relative = "cursor",
				border = "shadow",
				style = "minimal",
			},
		},
		open_file = {
			quit_on_open = false,
			eject = true,
			resize_window = true,
			relative_path = true,
			window_picker = {
				enable = false,
				picker = "default",
				chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
				exclude = {
					filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
					buftype = { "nofile", "terminal", "help" },
				},
			},
		},
		remove_file = {
			close_window = true,
		},
	},
	trash = {
		cmd = "gio trash",
	},
	tab = {
		sync = {
			open = false,
			close = false,
			ignore = {},
		},
	},
	notify = {
		threshold = vim.log.levels.INFO,
		absolute_path = true,
	},
	help = {
		sort_by = "key",
	},
	ui = {
		confirm = {
			remove = true,
			trash = true,
			default_yes = false,
		},
	},
	experimental = {
		multi_instance = false,
	},
	log = {
		enable = false,
		truncate = false,
		types = {
			all = false,
			config = false,
			copy_paste = false,
			dev = false,
			diagnostics = false,
			git = false,
			profile = false,
			watcher = false,
		},
	},
})
