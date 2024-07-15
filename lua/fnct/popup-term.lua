local Popup = require("nui.popup")

local termPopup              -- Keeps popup instance local to the module
local isPopupVisible = false -- Tracks visibility state of the popup

local function init_popup_term()
   local popup_width = 90
   local popup_height = 20
   local total_cols = vim.o.columns
   local total_lines = vim.o.lines

   termPopup = Popup({
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

   termPopup:mount()
   vim.api.nvim_command('terminal')
   vim.cmd('startinsert')
   termPopup:hide()
end

local function toggle_terminal()
   if not termPopup then
      init_popup_term() -- Initialize if not already done
   elseif isPopupVisible then
      termPopup:hide()
      isPopupVisible = false
   else
      termPopup:show()
      isPopupVisible = true
   end
end

return {
   Init_Popup_Term = init_popup_term,
   Toggle_Terminal = toggle_terminal
}
