<<<<<<< HEAD
_G.tab_names = {}
_G.pinned_buffers = {}      -- Store pinned buffers
_G.show_pinned_only = false -- Toggle state for buffer visibility

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
         -- Always keep Neo-tree visible
         if buffer.filetype == "neo-tree" then
            return true
         end

         -- Exclude terminal buffers
         if buffer.type == "terminal" then
            return false
         end

         -- Exclude empty unnamed buffers
         if buffer.filename == "" then
            return false
         end

         -- If toggle is active, show only pinned buffers
         if _G.show_pinned_only then
            return _G.pinned_buffers[buffer.number] or false
         end

         return true    -- Default: Show all valid buffers
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

   -- 🔹 Display Tabs on the Left
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

   -- 🔹 Display Buffers on the Right
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

-- 🔹 Fix Tab Switching (No Delete Errors)
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

-- 🔹 Switch between buffers without closing the previous one
vim.keymap.set("n", "<Leader>bn", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>bp", ":bprevious<CR>", { noremap = true, silent = true })

-- 🔹 Pin/Unpin Buffers
vim.keymap.set("n", "<Leader>bp", function()
   local buf = vim.api.nvim_get_current_buf()
   if _G.pinned_buffers[buf] then
      _G.pinned_buffers[buf] = nil
      print("Unpinned buffer " .. buf)
   else
      _G.pinned_buffers[buf] = true
      print("Pinned buffer " .. buf)
   end
end, { noremap = true, silent = true })

-- 🔹 Toggle Between Showing Pinned Buffers or All Buffers
vim.keymap.set("n", "<Leader>bt", function()
   _G.show_pinned_only = not _G.show_pinned_only
   print("Toggled buffer visibility: " .. (_G.show_pinned_only and "Pinned Only" or "All Buffers"))
   vim.cmd("redrawtabline")  -- Force Cokeline to update
end, { noremap = true, silent = true })

=======
-- local TermPopup = require("nui.popup")
-- local PopupTerm = {}
-- local IsTermPopupVisible = false
-- vim.cmd([[highlight MyPopupBg guibg=#282c34]])
--
-- local function init_popup_term()
--    local popup_width = 100
--    local popup_height = 23
--    local total_cols = vim.o.columns
--    local total_lines = vim.o.lines
--
--    PopupTerm = TermPopup({
--       enter = true,
--       focusable = true,
--       border = {
--          style = "rounded",
--          text = {
--             top = { " #!/bin/bash ", highlight = "MyPopupTextTop" },
--             top_align = "center",
--             bottom = { " Ctrl+T to close ", hightlight = "MyPopupTextBottom" },
--             bottom_align = "right",
--          },
--       },
--       position = {
--          row = total_lines - popup_height - 5,
--          col = total_cols - popup_width,
--       },
--       size = {
--          width = popup_width,
--          height = popup_height,
--       },
--       win_options = {
--          winblend = 10, -- Transparency
--          winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
--       },
--    })
--    PopupTerm:on("BufEnter", function()
--       vim.api.nvim_buf_add_highlight(PopupTerm.bufnr, -1, "MyPopupTextTop", 0, 0, -1)
--       vim.api.nvim_buf_add_highlight(PopupTerm.bufnr, -1, "MyPopupTextBottom", -1, 0, -1)
--    end)

--    -- Mount the popup
--    PopupTerm:mount()
--    -- Mount the pop-up and open a terminal
--    PopupTerm:mount()
--    vim.api.nvim_command('terminal')
--    PopupTerm:hide()
--
--    -- Set autocommands to handle pop-up events
--    vim.api.nvim_create_autocmd("TermClose", {
--       buffer = PopupTerm.bufnr,
--       callback = function()
--          PopupTerm:unmount()
--       end,
--    })
--
--    vim.api.nvim_buf_set_keymap(PopupTerm.bufnr, "n", "q", "", {
--       noremap = true,
--       silent = true,
--       callback = function()
--          PopupTerm:hide()
--          IsTermPopupVisible = false
--       end,
--    })
-- end
--
-- local function toggle_terminal()
--    if not IsTermPopupVisible then
--       PopupTerm:show()
--       IsTermPopupVisible = true
--       vim.cmd("startinsert")
--    else
--       PopupTerm:hide()
--       IsTermPopupVisible = false
--    end
-- end
--
-- return {
--    Init_Popup_Term = init_popup_term,
--    Toggle_Terminal = toggle_terminal
-- }
>>>>>>> d06ecc7d64874b4372873a889557a3dc5ad6f4f6
