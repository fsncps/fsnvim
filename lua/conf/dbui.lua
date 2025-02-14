 vim.api.nvim_create_user_command("DBUIToggle", function()
    -- Select NeoTree if it's open
    local wins = vim.api.nvim_list_wins()
    for _, win in ipairs(wins) do
       local buf = vim.api.nvim_win_get_buf(win)
       if vim.bo[buf].filetype == "neo-tree" then
          vim.api.nvim_set_current_win(win) -- Move focus to NeoTree
          break
       end
    end

    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc><Esc>", true, false, true), "n", false)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc><Esc>", true, false, true), "n", false)
    -- Open or toggle DBUI
    vim.cmd("DBUI")

    -- Toggle NeoTree after a short delay

    -- Simulate repeated ESC presses
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc><Esc>", true, false, true), "n", false)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc><Esc>", true, false, true), "n", false)

    vim.cmd("Neotree toggle")
 end, {})

 -- Bind to <Leader>D to execute `DBUIToggle`
 vim.api.nvim_set_keymap("n", "<Leader>D", ":DBUIToggle<CR>", { noremap = true, silent = true })

 vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "dbout",
    callback = function()
       vim.cmd("wincmd J")  -- Move the dbout window to the bottom
       vim.cmd("resize 40") -- Adjust height
    end,
 })

 vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "dbui",
    callback = function()
       vim.cmd("vertical resize 50") -- Adjust DBUI width
    end,
 })

 vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "dbsql",
    callback = function()
       vim.cmd("resize 20") -- Adjust height of SQL query buffer
    end,
 })
