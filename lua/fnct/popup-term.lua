TermPopup = require("nui.popup")

PopupTerm = {}
IsTermPopupVisible = false

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
         highlight = "FloatBorder",
      },
      position = {
         row = total_lines - popup_height - 5,
         col = total_cols - popup_width + 5,
      },
      size = {
         width = popup_width,
         height = popup_height,
      },
   })

   PopupTerm:mount()
   vim.api.nvim_command('terminal')
   PopupTerm:hide()
end

local function toggle_terminal()
   if not IsTermPopupVisible == true then
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
