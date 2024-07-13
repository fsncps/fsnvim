require("ibl").setup()

local sqlite = require("sqlite") -- This assumes sqlite.lua is accessible as 'sqlite'
require("neoclip").setup({
   history = 1000,
   enable_persistent_history = true,
   db_path = vim.fn.stdpath("data") .. "/neoclip.sqlite3",
   storage = { sqlite = sqlite },
})
