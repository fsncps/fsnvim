vim.api.nvim_create_user_command("Bufdelete", function()
	local current_win = vim.api.nvim_get_current_win()
	local current_buf = vim.api.nvim_get_current_buf()
	local alt_buf = vim.fn.bufnr("#")
	local listed_bufs = vim.tbl_filter(function(b)
		return vim.api.nvim_buf_is_loaded(b) and vim.bo[b].buflisted
	end, vim.api.nvim_list_bufs())

	vim.cmd("NvimTreeClose")
	-- Only switch buffers if more than one listed buffer exists
	if #listed_bufs > 1 then
		-- Pick an alternate valid buffer (fallback to bnext)
		if vim.api.nvim_buf_is_valid(alt_buf) and alt_buf ~= current_buf and vim.bo[alt_buf].buflisted then
			vim.api.nvim_set_current_buf(alt_buf)
		else
			vim.cmd("bnext")
		end
	else
		-- Open a new empty buffer if this is the last listed one
		vim.cmd("enew")
	end

	-- At this point, current_buf is no longer visible in any window
	-- Now it’s safe to delete it without affecting layout
	vim.cmd("bdelete " .. current_buf)

	-- Optional: Reopen NvimTree if you want
	vim.cmd("NvimTreeOpen")
end, {})

vim.keymap.set("n", "<A-q>", ":Bufdelete<CR>", { desc = "Close buffer but keep layout" })
