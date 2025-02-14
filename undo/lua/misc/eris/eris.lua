-- ~/.config/nvim/lua/my_chatbot_plugin/init.lua

local M = {}

-- Function to run the chatbot
function M.run_chatbot()
   -- Replace 'python3' with the path to your Python interpreter if needed
   local command = "python3 /HAL/fsncps/proj/dev/aibots/eris/eris1.py"
   local handle = io.popen(command)
   local result = handle:read("*a")
   handle:close()

   -- Output the chatbot's response in a Neovim buffer
   vim.api.nvim_out_write(result)
end

-- Command to invoke the chatbot
vim.api.nvim_create_user_command('ChatBot', M.run_chatbot, {})

return M

