local M = {}

_G.tab_names = _G.tab_names or {}
_G.pinned_buffers = _G.pinned_buffers or {}        -- Store pinned buffers
_G.show_pinned_only = _G.show_pinned_only or false -- Toggle state for buffer visibility

local function get_tab_name(tab)
   return _G.tab_names[tab.number] or "Tab " .. tab.number
end

local tab_name_file = vim.fn.stdpath("data") .. "/tab_names.txt"

local function save_tab_names()
   local lines = {}
   for tab, name in pairs(_G.tab_names) do
      table.insert(lines, tab .. "|" .. name)
   end
   vim.fn.writefile(lines, tab_name_file)
end

local function load_tab_names()
   if vim.fn.filereadable(tab_name_file) == 1 then
      local lines = vim.fn.readfile(tab_name_file)
      for _, line in ipairs(lines) do
         local tab, name = line:match("^(%d+)|(.+)$")
         if tab and name then
            _G.tab_names[tonumber(tab)] = name
         end
      end
   end
end

-- Load tab names on startup
load_tab_names()

-- Save tab names when exiting Neovim
vim.api.nvim_create_autocmd("VimLeave", { callback = save_tab_names })

vim.api.nvim_create_user_command("RenameTab", function(args)
   local tab_number = vim.fn.tabpagenr()
   _G.tab_names[tab_number] = args.args
   print("Renamed Tab " .. tab_number .. " to: " .. args.args)
   save_tab_names()
end, { nargs = 1 })

M.Init_Popup_Term = function()
   print("Popup Term initialized") -- Placeholder
end

return M

