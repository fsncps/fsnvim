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
         -- Show only buffers for the current tab
         local current_tab = vim.api.nvim_get_current_tabpage()
         local buffer_tab = nil

         for _, tab in ipairs(vim.api.nvim_list_tabpages()) do
            for _, win in ipairs(vim.api.nvim_tabpage_list_wins(tab)) do
               if vim.api.nvim_win_get_buf(win) == buffer.number then
                  buffer_tab = tab
                  break
               end
            end
         end

         return buffer_tab == current_tab
      end,
      focus_on_delete = "prev",
      new_buffers_position = "last",
      delete_on_right_click = true,
   },

   mappings = {
      cycle_prev_next = true,
      disable_mouse = false,
   },

   history = { enabled = true, size = 2 },

   rendering = { max_buffer_width = 999 },

   tabs = {
      placement = "left",
      components = {
         {
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
         },
      },
   },

   components = {
      {
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

   -- Sidebar integration
   sidebar = {
      filetype = { "NvimTree", "neo-tree", "SidebarNvim" },
      components = {},
   },
})
