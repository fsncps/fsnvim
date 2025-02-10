require("which-key").setup {
   plugins = {
      marks = true,
      registers = true,
      spelling = {
         enabled = true,
         suggestions = 20,
      },
      presets = {
         operators = true,
         motions = true,
         text_objects = true,
         windows = true,
         nav = true,
         z = true,
         g = true,
      },
   },
   icons = {
      breadcrumb = "»",
      separator = "➜",
      group = "+",
   },
   keys = {
      scroll_down = "<c-d>",
      scroll_up = "<c-u>",
   },
   win = {
      border = "none",
      position = "bottom",
      margin = { 1, 0, 1, 0 },
      padding = { 1, 2, 1, 2 },
      winblend = 0,
      zindex = 1000,
   },
   layout = {
      height = { min = 4, max = 25 },
      width = { min = 20, max = 50 },
      spacing = 3,
      align = "left",
   },
   triggers = { "<leader>", "g" }, -- ✅ FIXED: Only 1-2 triggers allowed
   disable = {
      buftypes = { "nofile", "prompt" },
      filetypes = { "TelescopePrompt" },
   },
}

