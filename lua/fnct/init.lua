function Require_All(dir)
   local scan = require('plenary.scandir')
   local files = scan.scan_dir(vim.fn.stdpath('config') .. '/lua/' .. dir, { depth = 1 })
   for _, file in ipairs(files) do
      local module_path = file:match('^.+/(.+)%.lua$')
      if module_path and module_path ~= 'init' then
         require(dir .. '.' .. module_path)
      end
   end
end

function ToggleTrueFalse()
   local line = vim.api.nvim_get_current_line()
   local new_line = line:gsub("%f[%a]true%f[%A]", "false"):gsub("%f[%a]false%f[%A]", "true")
   vim.api.nvim_set_current_line(new_line)
end

function Is_Neo_Tree()
   local bufname = vim.api.nvim_buf_get_name(0)
   return bufname:match("neo%-tree filesystem") ~= nil
end

local function get_directory(buffer)
   local path = buffer.path
   local dir = vim.fn.fnamemodify(path, ":h:t")
   return dir
end

----KEEP WINDOW WHEN CLOSING BUFFER
---
---
-- local function close_buffer_keep_window()
--    local current_win = vim.api.nvim_get_current_win()
--    local buffers = vim.api.nvim_list_bufs()
--    local current_buf = vim.api.nvim_get_current_buf()
--
--    -- Find another buffer to display
--    for _, buf in ipairs(buffers) do
--       if vim.api.nvim_buf_is_valid(buf) and vim.api.nvim_buf_get_option(buf, "buflisted") and buf ~= current_buf then
--          vim.api.nvim_win_set_buf(current_win, buf)
--          vim.cmd("bdelete! " .. current_buf)
--          return
--       end
--    end
--
--    -- If no other buffer is available, simply wipe out the buffer
--    vim.cmd("bdelete!")
-- end
--
-- -- Create a command for convenience
-- vim.api.nvim_create_user_command("BDelete", close_buffer_keep_window, { nargs = 0 })


local function get_buffer_name(buffer)
   local dir = get_directory(buffer)
   local filename = buffer.filename
   return dir .. "/" .. filename
end

Require_All("fnct")

return { GET_DIR = get_directory }
