local wk = require("which-key")

-- Initialize which-key with setup
wk.setup({
   plugins = {
      marks = true,
      registers = true,
      spelling = { enabled = true, suggestions = 20 },
   },
   window = {
      border = "rounded",
      position = "bottom",
      margin = { 1, 0, 1, 0 },
      padding = { 1, 1, 1, 1 },
   },
   layout = {
      height = { min = 4, max = 25 },
      width = { min = 20, max = 50 },
      spacing = 3,
      align = "left",
   },
   triggers = { { "<leader>", mode = { "n", "v" } } }, -- Manual triggers for which-key
})

-- Use `which-key.add()` for mapping spec
wk.add({
   -- Buffers Group
   { "<leader>b",  group = "Buffers" },
   {
      "<leader>bt",
      function()
         _G.show_all_buffers = not _G.show_all_buffers
         print("Toggled buffer visibility: " .. (_G.show_all_buffers and "All Buffers" or "Per Tab"))
         vim.cmd("redrawtabline") -- Force Cokeline to refresh
      end,
      desc = "Toggle tab buffers"
   },
   { "<leader>bp", "<Plug>(cokeline-pick-focus)",            desc = "Pick buffer to focus" },
   { "<leader>bc", "<Plug>(cokeline-pick-close)",            desc = "Pick buffer to close" },

   -- Tabs Group
   { "<leader>t",  group = "Tabs" },
   { "<leader>tn", ":tabnext<CR>",                           desc = "Next Tab" },
   { "<leader>tp", ":tabprevious<CR>",                       desc = "Previous Tab" },

   -- Window Navigation Group
   { "<leader>w",  group = "Window" },
   { "<leader>wc", ":close<CR>",                             desc = "Close window" },
   { "<leader>ws", ":split<CR>",                             desc = "Horizontal split" },
   { "<leader>wv", ":vsplit<CR>",                            desc = "Vertical split" },

   -- File Management Group
   { "<leader>f",  group = "File" },
   { "<leader>fs", ":w<CR>",                                 desc = "Save file" },
   { "<leader>fq", ":q<CR>",                                 desc = "Quit file" },

   -- Telescope Group (Search Functions)
   { "<leader>s",  group = "Search" },
   { "<leader>sf", require("telescope.builtin").find_files,  desc = "Find Files" },
   { "<leader>sw", require("telescope.builtin").grep_string, desc = "Search Current Word" },
   { "<leader>sg", require("telescope.builtin").live_grep,   desc = "Search by Grep" },
   { "<leader>sb", require("telescope.builtin").buffers,     desc = "Search Buffers" },

   -- NeoTree (File Explorer)
   { "<leader>e",  ":Neotree<CR>",                           desc = "Toggle File Explorer" },

   -- Clipboard Group
   { "<leader>c",  group = "Clipboard" },
   { "<leader>cy", '"+y',                                    desc = "Yank to System Clipboard" },
   { "<leader>cp", '"+p',                                    desc = "Paste from System Clipboard" },

   -- Projects Group
   { "<leader>p",  group = "Projects" },
   { "<leader>pp", ":CdProject<CR>",                         desc = "Select Project" },
   { "<leader>pa", ":CdProjectManualAdd<CR>",                desc = "Add Project" },

   -- Custom Navigation (Moving between splits)
   { "<C-Left>",   "<C-w><C-h>",                             desc = "Move focus left" },
   { "<C-Right>",  "<C-w><C-l>",                             desc = "Move focus right" },
   { "<C-Up>",     "<C-w><C-k>",                             desc = "Move focus up" },
   { "<C-Down>",   "<C-w><C-j>",                             desc = "Move focus down" },
})

