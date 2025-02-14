<<<<<<< HEAD
_G.pinned_buffers = _G.pinned_buffers or {} -- Store pinned buffers per tab
_G.show_all_buffers = false                 -- Toggle state for showing all buffers

_G.tab_names = {}

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
=======
-- local function get_directory(buffer)
--    local path = buffer.path
--    local dir = vim.fn.fnamemodify(path, ":h:t")
--    return dir
-- end

-- local function get_buffer_name(buffer)
--    local dir = get_directory(buffer)
--    local filename = buffer.filename
--    return dir .. "/" .. filename
-- end
>>>>>>> d06ecc7d64874b4372873a889557a3dc5ad6f4f6

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

require("cokeline").setup({
   show_if_buffers_are_at_least = 1,

   buffers = {
      filter_valid = function(buffer)
         -- Always keep Neo-tree visible
         if buffer.filetype == "neo-tree" then
            return true
         end

         -- Exclude terminal and empty buffers
         if buffer.type == "terminal" or buffer.filename == "" then
            return false
         end

         local tab_id = vim.fn.tabpagenr()

         if _G.show_all_buffers then
            return true -- Show all buffers across tabs when toggled
         end

         -- Default: Only show buffers assigned to the current tab
         local tab_buffers = vim.fn.gettabvar(tab_id, "buffers", {})
         return vim.tbl_contains(tab_buffers, buffer.number)
      end,
   },

   -- 🔹 Display Tabs on the Left
   tabs = {
      placement = "left",
      components = {
         {
<<<<<<< HEAD
            text = function(tab)
               return get_tab_name(tab)
            end,
            fg = function(tab)
               return tab.is_active and "#ffffff" or "#888888"
            end,
            bg = function(tab)
               return tab.is_active and "#1e2030" or "#282c34"
            end,
            bold = function(tab)
               return tab.is_active
            end,
=======
            text = "",
            --    function()
            --    return vim.g.GIT_STATUS or ""
            -- end,
            fg = '#dccd00',
            bg = '#1e2030',
>>>>>>> d06ecc7d64874b4372873a889557a3dc5ad6f4f6
         },
      },
   },

   -- 🔹 Display Buffers on the Right
   components = {
      {
<<<<<<< HEAD
         text = " │ ",
         fg = "#444444",
         bg = "#1e2030",
      },
      {
         text = function(buffer)
            return buffer.devicon.icon or ""
         end,
         fg = function(buffer)
            return buffer.devicon.color or (buffer.is_focused and "#00ff00" or "#888888")
         end,
         bg = function(buffer)
            return buffer.is_modified and "#472929" or "#24273a"
         end,
      },
      {
         text = function(buffer)
            return buffer.filename
         end,
         fg = function(buffer)
            return buffer.is_focused and "#72ad24" or "#888888"
         end,
         bg = function(buffer)
            return buffer.is_modified and "#472929" or "#24273a"
         end,
         style = function(buffer)
            return buffer.is_focused and "bold" or nil
         end,
      },
      {
         text = " │ ",
         fg = "#444444",
         bg = "#1e2030",
      },
   },

   -- 🔹 Sidebar integration to keep Neo-tree visible
   sidebar = {
      filetype = { "NvimTree", "neo-tree", "SidebarNvim" },
      components = {
         {
            text = "📂 Neo-tree",
            fg = "#ffcc00",
            bg = "#1e2030",
         },
=======
         text = function(buffer) return ' ' .. buffer.devicon.icon or ' ' end,
         fg = function(buffer) return buffer.devicon.color or (buffer.is_focused and '#dccd00' or '#888888') end,
         bg = function(buffer) return buffer.is_modified and '#473131' or '#1e2030' end,
         style = function(buffer) return buffer.is_focused and 'bold' or nil end,
      },
      {
         text = function(buffer) return buffer.unique_prefix end,
         fg = function(buffer) return buffer.is_focused and '#dccd00' or '#888888' end,
         bg = function(buffer) return buffer.is_modified and '#473131' or '#1e2030' end,
         style = function(buffer) return buffer.is_focused and 'bold' or nil end,
>>>>>>> d06ecc7d64874b4372873a889557a3dc5ad6f4f6
      },
      {
         text = function(buffer) return '' .. buffer.filename .. '' end,
         fg = function(buffer) return buffer.is_focused and '#dccd00' or '#888888' end,
         bg = function(buffer) return buffer.is_modified and '#473131' or '#1e2030' end,
         style = function(buffer) return buffer.is_focused and 'bold' or nil end,
      },
      {
         text = function(buffer) return buffer.is_focused and ' ' or ' ' end,
         fg = function(buffer) return buffer.is_focused and '#dccd00' or '#888888' end,
         bg = function(buffer) return buffer.is_modified and '#473131' or '#1e2030' end,
         style = function(buffer) return buffer.is_focused and 'bold' or nil end,
      },

   },
})

require("lualine").setup({
   options = {
      disabled_filetypes = {
         "neo-tree" -- Disable Lualine for Neotree
      },
      theme = "powerline_dark_2",
      section_separators = '',
      component_separators = '',
      globalstatus = true, -- If you want a global status line
      icons_enabled = true,
   },
   sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff', 'diagnostics' },
      lualine_c = {
         function()
            local filepath = vim.fn.expand('%:p')       -- Get absolute path
            filepath = filepath:gsub(vim.env.HOME, '~') -- Replace $HOME with ~
            return filepath
         end, },
      lualine_x = { 'encoding', 'fileformat', 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
   },
   winbar = {
      lualine_a = { "filename" },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {}
   },

   inactive_winbar = {
      lualine_a = { 'filename' },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {}
   },
})

-- 🔹 Toggle Between Showing Buffers Per Tab or All Buffers
vim.keymap.set("n", "<Leader>bt", function()
   _G.show_all_buffers = not _G.show_all_buffers
   print("Toggled buffer visibility: " .. (_G.show_all_buffers and "All Buffers" or "Per Tab"))
   vim.cmd("redrawtabline") -- **Force Cokeline to refresh**
end, { silent = true })

-- 🔹 Track buffers per tab
vim.api.nvim_create_autocmd("BufEnter", {
   pattern = "*",
   callback = function()
      if _G.show_all_buffers then return end -- Skip modification if toggled

      local tab = vim.fn.tabpagenr()
      local buf = vim.api.nvim_get_current_buf()
      local tab_buffers = vim.fn.gettabvar(tab, "buffers", {})

      if not vim.tbl_contains(tab_buffers, buf) then
         table.insert(tab_buffers, buf)
         vim.fn.settabvar(tab, "buffers", tab_buffers)
      end
   end
})

-- 🔹 Switch between tabs without delete errors
vim.keymap.set("n", "<Leader>tn", function()
   local next_tab = vim.fn.tabpagenr() + 1
   if next_tab > vim.fn.tabpagenr("$") then
      next_tab = 1
   end
   vim.cmd("tabnext " .. next_tab)
end, { noremap = true, silent = true })

vim.keymap.set("n", "<Leader>tp", function()
   local prev_tab = vim.fn.tabpagenr() - 1
   if prev_tab < 1 then
      prev_tab = vim.fn.tabpagenr("$")
   end
   vim.cmd("tabprevious " .. prev_tab)
end, { noremap = true, silent = true })

-- 🔹 Switch between buffers
vim.keymap.set("n", "<Leader>bn", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>bp", ":bprevious<CR>", { noremap = true, silent = true })

