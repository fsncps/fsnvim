local TermPopup = require("nui.popup")
local PopupTerm = {}
local IsTermPopupVisible = false

local function init_popup_term()
   local popup_width = 90
   local popup_height = 20
   local total_cols = vim.o.columns
   local total_lines = vim.o.lines

   PopupTerm = TermPopup({
      enter = true,
      focusable = true,
      border = {
         style = "rounded",
         highlight = "Normal",
         text = {
            top = " #!/bin/bash",
            top_align = "center",
            bottom = " Press 'q' to close ",
            bottom_align = "right",
         },
      },
      position = {
         row = total_lines - popup_height - 5,
         col = total_cols - popup_width,
      },
      size = {
         width = popup_width,
         height = popup_height,
      },
      win_options = {
         winblend = 10, -- Transparency
         winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
      },
   })

   -- Mount the pop-up and open a terminal
   PopupTerm:mount()
   vim.api.nvim_command('terminal')
   PopupTerm:hide()

   -- Set autocommands to handle pop-up events
   vim.api.nvim_create_autocmd("TermClose", {
      buffer = PopupTerm.bufnr,
      callback = function()
         PopupTerm:unmount()
      end,
   })

   vim.api.nvim_buf_set_keymap(PopupTerm.bufnr, "n", "q", "", {
      noremap = true,
      silent = true,
      callback = function()
         PopupTerm:hide()
         IsTermPopupVisible = false
      end,
   })
end

local function toggle_terminal()
   if not IsTermPopupVisible then
      PopupTerm:show()
      IsTermPopupVisible = true
      vim.cmd("startinsert")
   else
      PopupTerm:hide()
      IsTermPopupVisible = false
   end
end

return {
   Init_Popup_Term = init_popup_term,
   Toggle_Terminal = toggle_terminal
}
