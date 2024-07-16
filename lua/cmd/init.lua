Require_All("cmd")

vim.api.nvim_create_user_command('ToggleTerminal', function()
   require('fnct.popup-term').Toggle_Terminal()
end, {})
