Require_All("cmd")

vim.api.nvim_create_user_command('ToggleTerminal', function()
   require('fnct.popup-term').Toggle_Terminal()
end, {})

--vim.keymap.set('n', '<C-t>', 'require('fnct.popup-term').Toggle_Terminal()')
vim.keymap.set('n', '<C-t>', function()
   require("fnct.popup-term").Toggle_Terminal()
end, { noremap = true, silent = true })
