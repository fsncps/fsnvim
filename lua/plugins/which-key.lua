return {
   "folke/which-key.nvim",
   event = "VeryLazy",
   init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
   end,
   opts = {
      preset = "modern",
      delay = function(ctx)
         return ctx.plugin and 0 or 200
      end,
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
      spec = {
         { "<leader>b", group = "Buffers" },
         { "<leader>t", group = "Tabs" },
         { "<leader>w", group = "Window" },
         { "<leader>f", group = "File" },
         { "<leader>s", group = "Search" },
         { "<leader>c", group = "Clipboard" },
         { "<leader>p", group = "Projects" },
         { "<leader>x", group = "Trouble" },
      },
   },
   keys = {
      {
         "<leader>?",
         function()
            require("which-key").show({ global = false })
         end,
         desc = "Buffer Local Keymaps",
      },
      {
         "<leader>K",
         function()
            require("which-key").show()
         end,
         desc = "Show All Keymaps",
      },
      {
         "<leader>Z",
         function()
            require("which-key").show({ keys = "z" })
         end,
         desc = "Show z Commands",
      },
      {
         "<leader>W",
         function()
            require("which-key").show({ keys = "<C-w>", loop = true })
         end,
         desc = "Show Window Commands",
      },
   },
}
