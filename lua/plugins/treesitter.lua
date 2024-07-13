return {
   {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
         local configs = require("nvim-treesitter.configs")
         configs.setup({
            -- ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "html", "bash", "latex" },
            -- sync_install = false,
            -- highlight = { enable = true },
            -- indent = { enable = true },
            --
            ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "html", "bash" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
            modules = {},
            ignore_install = {},
            auto_install = false,
         })
      end,
   },
}
