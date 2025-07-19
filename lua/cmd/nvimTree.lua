local preview_ns = {
	win = nil,
	buf = nil,
	enabled = false,
}
local M = {}
local function open_preview(path)
	local buf = vim.api.nvim_create_buf(false, true)
	if not vim.api.nvim_buf_is_valid(buf) then
		return
	end

	-- Correct order of arguments
	vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
	local filetype = vim.filetype.match({ filename = path }) or ""
	vim.api.nvim_buf_set_option(buf, "filetype", filetype)

	local ok, lines = pcall(vim.fn.readfile, path)
	if not ok or type(lines) ~= "table" then
		lines = { "[Preview failed]" }
	end

	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

	local width = math.floor(vim.o.columns * 0.6)
	local height = math.floor(vim.o.lines * 0.9)
	local row = math.floor((vim.o.lines - height) / 2)
	local col = math.floor((vim.o.columns - width) / 2)

	local win = vim.api.nvim_open_win(buf, false, {
		relative = "editor",
		width = width,
		height = height,
		row = row,
		col = col,
		border = "rounded",
		style = "minimal",
	})

	preview_ns.buf = buf
	preview_ns.win = win
end

local function close_preview()
	if preview_ns.win and vim.api.nvim_win_is_valid(preview_ns.win) then
		vim.api.nvim_win_close(preview_ns.win, true)
	end
	preview_ns.win = nil
	preview_ns.buf = nil
end

function M.ToggleNvimTreePreview()
	preview_ns.enabled = not preview_ns.enabled

	if not preview_ns.enabled then
		vim.api.nvim_clear_autocmds({ group = "NvimTreePreview" })
		close_preview()
		vim.notify("NvimTree preview: OFF")
		return
	end

	vim.notify("NvimTree preview: ON")

	vim.api.nvim_create_autocmd("BufEnter", {
		group = group,
		callback = function()
			local current_win = vim.api.nvim_get_current_win()
			local current_buf = vim.api.nvim_win_get_buf(current_win)
			local bufname = vim.api.nvim_buf_get_name(current_buf)

			-- If we are no longer in a NvimTree buffer, close preview
			if not bufname:match("^NvimTree_") then
				close_preview()
			end
		end,
	})

	local api = require("nvim-tree.api")
	local group = vim.api.nvim_create_augroup("NvimTreePreview", { clear = true })

	local function show_selected_node()
		local node = api.tree.get_node_under_cursor()
		if node and node.type == "file" then
			close_preview()
			open_preview(node.absolute_path)
		else
			close_preview()
		end
	end

	-- Immediately show preview for the current node
	-- Immediately show preview
	show_selected_node()

	-- Preview on tree movement
	vim.api.nvim_create_autocmd("CursorMoved", {
		group = group,
		pattern = "NvimTree_*",
		callback = show_selected_node,
	})

	-- Close preview when entering a non-NvimTree buffer
	vim.api.nvim_create_autocmd("BufEnter", {
		group = group,
		callback = function()
			local current = vim.api.nvim_get_current_buf()
			local name = vim.api.nvim_buf_get_name(current)
			if not name:match("^NvimTree_") then
				close_preview()
			end
		end,
	})
end

function M.focus_current_file_in_tree()
	local file = vim.api.nvim_buf_get_name(0)
	if file == "" then
		vim.notify("No file in current buffer", vim.log.levels.WARN)
		return
	end

	local parent = vim.fn.fnamemodify(file, ":h")

	-- Set tree root to parent folder
	api.tree.change_root(parent)

	-- Ensure tree is open and file is revealed
	api.tree.open()
	api.tree.find_file()
end

return M
-- Keybind (adjust as needed)
-- vim.keymap.set("n", "<leader>P", ToggleNvimTreePreview, { desc = "Toggle NvimTree live preview" })
