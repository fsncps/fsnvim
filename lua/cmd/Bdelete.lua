vim.api.nvim_create_user_command("Bufdelete", function()
	local buf = vim.api.nvim_get_current_buf()
	local alt_buf = vim.fn.bufnr("#") -- Get the alternate buffer
	local buffers = vim.fn.getbufinfo({ buflisted = 1 }) -- Get all listed buffers
	local wins = vim.api.nvim_list_wins()

	-- Close NeoTree if it's open in any window
	for _, win in ipairs(wins) do
		local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
		if bufname:match("NvimTree.*") then
			vim.cmd("NvimTreeClose")
		end
	end

	-- If there are multiple buffers, switch before deleting
	if #buffers > 1 then
		if vim.api.nvim_buf_is_valid(alt_buf) and vim.bo[alt_buf].buflisted then
			vim.cmd("buffer " .. alt_buf) -- Switch to the alternate buffer
		else
			vim.cmd("bnext") -- Otherwise, switch to the next available buffer
		end
	else
		vim.cmd("enew") -- If it's the last buffer, create a new empty buffer
	end

	-- Delete the original buffer
	vim.cmd("bdelete " .. buf)

	-- Reopen NeoTree if necessary
	-- vim.cmd("Neotree")
	vim.cmd("NvimTreeOpen")
	vim.cmd("wincmd l") -- Move focus to the right window
end, {})

vim.keymap.set("n", "<A-q>", ":Bufdelete<CR>", { desc = "Close Buffer but Keep Window" })
