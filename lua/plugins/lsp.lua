return {
   "neovim/nvim-lspconfig",
   dependencies = {
      { "williamboman/mason.nvim", config = true },
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      { "j-hui/fidget.nvim",       opts = {} },
      { "folke/neodev.nvim",       opts = {} },
   },
   config = function()
      -- Set up Mason
      require('mason').setup()
      require('mason-lspconfig').setup({
         ensure_installed = { 'lua_ls' }
      })

      local lspconfig = require('lspconfig')

      -- Set up lua_ls with Mason
      lspconfig.lua_ls.setup({
         settings = {
            Lua = {
               format = {
                  enable = true,
                  defaultConfig = {
                     indent_style = "space",
                     indent_size = "3",
                  },
               },
               runtime = {
                  version = 'LuaJIT',
                  path = vim.split(package.path, ';'),
               },
               diagnostics = {
                  globals = { 'vim' },
               },
               workspace = {
                  library = vim.api.nvim_get_runtime_file("", true),
               },
               telemetry = {
                  enable = false,
               },
            },
         },
      })

      -- Configure capabilities for autocompletion
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

      -- Ensure additional tools are installed
      require("mason-tool-installer").setup({
         ensure_installed = {
            "stylua",     -- Used to format Lua code
         },
      })
   end,
}
