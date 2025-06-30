_G.pinned_buffers = _G.pinned_buffers or {} -- Store pinned buffers per tab
_G.show_all_buffers = false                 -- Toggle state for showing all buffers

_G.tab_names = {}                           -- No need to persist names anymore

local function get_tab_name(tab)
   local tab_num = tab.number
   return _G.tab_names[tab_num] or ("TAB_" .. tab_num)
end

vim.api.nvim_create_user_command("RenameTab", function(args)
   local tab_number = vim.fn.tabpagenr()
   _G.tab_names[tab_number] = args.args
   print("Renamed Tab " .. tab_number .. " to: " .. args.args)
end, { nargs = 1 })

require("cokeline").setup({
   show_if_buffers_are_at_least = 1,

   buffers = {
      filter_valid = function(buffer)
         if buffer.filetype == "neo-tree" then return true end
         if buffer.type == "terminal" or buffer.filename == "" then return false end

         local tab_id = vim.fn.tabpagenr()

         if _G.show_all_buffers then return true end -- Show all buffers when toggled

         local tab_buffers = vim.fn.gettabvar(tab_id, "buffers", {})
         return vim.tbl_contains(tab_buffers, buffer.number)
      end,
   },

   -- 🔹 Display Tabs on the Left
   -- tabs = {
   --    placement = "right",
   --    components = {
   --       {
   --          text = function(tab)
   --             local tabname = get_tab_name(tab)
   --             if tab.is_active then
   --                return "   " .. tabname .. "   "
   --             else
   --                return tabname
   --             end
   --          end,
   --          fg = function(tab)
   --             return tab.is_active and "#43c121" or "#888888" -- White for active, Grey for inactive
   --          end,
   --          bg = function(tab)
   --             return tab.is_active and "#132b06" or "#0d1d04" -- Darker background for active
   --          end,
   --          bold = function(tab)
   --             return tab.is_active -- Bold only if active
   --          end,
   --       },
   --    }
   -- },

   -- 🔹 Display Buffers on the Right
   components = {
      {
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

   -- 🔹 Sidebar integration to keep Neo-tree visible
   sidebar = {
      filetype = { "NvimTree", "neo-tree", "SidebarNvim" },
      components = {
         {
            text = "📂 Neo-tree",
            fg = "#ffcc00",
            bg = "#1e2030",
         },
      },
   },
})

-- 🔹 Toggle Between Showing Buffers Per Tab or All Buffers
vim.keymap.set("n", "<Leader>bt", function()
   _G.show_all_buffers = not _G.show_all_buffers
   print("Toggled buffer visibility: " .. (_G.show_all_buffers and "All Buffers" or "Per Tab"))
   vim.cmd("redrawtabline") -- **Force Cokeline to refresh**
end, { silent = true, desc = "Toggle Tab Buffers" })


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
