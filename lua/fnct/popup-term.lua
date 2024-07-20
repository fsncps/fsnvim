local TermPopup = require("nui.popup")
local PopupTerm = {}
local IsTermPopupVisible = false
vim.cmd([[highlight MyPopupBg guibg=#282c34]])

local function init_popup_term()
   local popup_width = 100
   local popup_height = 23
   local total_cols = vim.o.columns
   local total_lines = vim.o.lines

   PopupTerm = TermPopup({
      enter = true,
      focusable = true,
      border = {
         style = "rounded",
         text = {
            top = { " #!/bin/bash ", highlight = "MyPopupTextTop" },
            top_align = "center",
            bottom = { " 'q' to close ", hightlight = "MyPopupTextBottom" },
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
   PopupTerm:on("BufEnter", function()
      vim.api.nvim_buf_add_highlight(PopupTerm.bufnr, -1, "MyPopupTextTop", 0, 0, -1)
      vim.api.nvim_buf_add_highlight(PopupTerm.bufnr, -1, "MyPopupTextBottom", -1, 0, -1)
   end)

   -- Mount the popup
   PopupTerm:mount()
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
