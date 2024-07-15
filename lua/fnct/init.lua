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

Require_All("fnct")
