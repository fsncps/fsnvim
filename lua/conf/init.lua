vim.cmd("colorscheme catppuccin-macchiato")
vim.cmd([[highlight MsgArea guibg=#212438 guifg=#7ce322]])
vim.cmd([[highlight Pmenu guibg=#1e2030]])
vim.cmd([[highlight PmenuSel guibg=#f5a97f guifg=#24273a]])

----colorize HEY
require 'colorizer'.setup()
--
-- vim.cmd([[highlight Normal guibg=#212438]])
Require_All("conf")

-- vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#5e0102", bg = "NONE" }) -- Red separator
-- vim.o.fillchars = "vert:│,horiz:─"

require("fnct.popup-term").Init_Popup_Term()

-- require("colorful-winsep").setup({
--    -- highlight for Window separator
--    hi = {
--       bg = "#dc1619",
--       fg = "#2ddc67",
--    },
--    -- This plugin will not be activated for filetype in the following table.
--    no_exec_files = { "packer", "TelescopePrompt", "mason", "CompetiTest", "NvimTree" },
--    -- Symbols for separator lines, the order: horizontal, vertical, top left, top right, bottom left, bottom right.
--    symbols = { "━", "┃", "┏", "┓", "┗", "┛" },
--    -- #70: https://github.com/nvim-zh/colorful-winsep.nvim/discussions/70
--    only_line_seq = true,
--    -- Smooth moving switch
--    smooth = true,
--    exponential_smoothing = true,
--    anchor = {
--       left = { height = 1, x = -1, y = -1 },
--       right = { height = 1, x = -1, y = 0 },
--       up = { width = 0, x = -1, y = 0 },
--       bottom = { width = 0, x = 1, y = 0 },
--    },
--    light_pollution = function(lines) end,
-- })

-- Define the active and inactive separator colors
local active_sep = { fg = "#5e0102", bg = "NONE" }
local inactive_sep = { fg = "#1F3442", bg = "NONE" }

-- Set up autocommands for window enter and leave
vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter" }, {
   callback = function()
      vim.api.nvim_set_hl(0, "WinSeparator", active_sep)
   end,
})

vim.api.nvim_create_autocmd("WinLeave", {
   callback = function()
      vim.api.nvim_set_hl(0, "WinSeparator", inactive_sep)
   end,
})
