local function disable_indent_in_lstlisting()
   local lst_start, lst_end = nil, nil
   local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

   -- Identify lstlisting blocks
   for i, line in ipairs(lines) do
      if line:match("\\begin{lstlisting}") then
         lst_start = i
      elseif line:match("\\end{lstlisting}") then
         lst_end = i
         if lst_start and lst_end then
            -- Disable autoindent for this block
            for j = lst_start, lst_end do
               vim.api.nvim_buf_set_lines(0, j - 1, j, false, { lines[j - 1]:gsub("^%s+", "") })
            end
            lst_start, lst_end = nil, nil
         end
      end
   end
end

-- Attach to BufWritePre for *.tex
vim.api.nvim_create_autocmd("BufWritePre", {
   pattern = "*.tex",
   callback = function()
      disable_indent_in_lstlisting()
   end,
})
