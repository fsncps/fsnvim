return {
   "neovim/nvim-lspconfig",
   dependencies = {
      { "williamboman/mason.nvim", config = true },
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      { "j-hui/fidget.nvim",       opts = {} },
      { "folke/neodev.nvim",       opts = {} },
      "nanotee/sqls.nvim", -- Ensure sqls.nvim is installed
      -- Add nvim-cmp and related plugins
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
   },
   config = function()
      -- Set up Mason
      require('mason').setup()
      require('mason-lspconfig').setup({
<<<<<<< HEAD
         ensure_installed = { 'lua_ls', 'pyright', 'bashls', 'texlab', 'sqls' } -- Added sqls
=======
         ensure_installed = { 'lua_ls', 'pyright', 'bashls', 'texlab', 'sqls' }
>>>>>>> d06ecc7d64874b4372873a889557a3dc5ad6f4f6
      })

      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

<<<<<<< HEAD
      -- Common on_attach function
      local on_attach = function(client, bufnr)
         -- Add keybindings or custom behavior for LSPs if needed
         if client.name == "sqls" then
            require('sqls').on_attach(client, bufnr)
         end
      end
=======
      -- Ensure sqls LSP works
      lspconfig.sqls.setup({
         on_attach = function(client, bufnr)
            require('sqls').on_attach(client, bufnr) -- Ensure sqls.nvim is correctly loaded
         end,
         capabilities = capabilities,
      })
>>>>>>> d06ecc7d64874b4372873a889557a3dc5ad6f4f6

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
         capabilities = capabilities,
         on_attach = on_attach,
      })

      -- Set up other LSP servers
      lspconfig.pyright.setup { capabilities = capabilities, on_attach = on_attach }
      lspconfig.bashls.setup { capabilities = capabilities, on_attach = on_attach }
      lspconfig.texlab.setup { capabilities = capabilities, on_attach = on_attach }

      -- Set up SQLS
      lspconfig.sqls.setup {
         capabilities = capabilities,
         on_attach = on_attach
      }

      -- Ensure additional tools are installed
      require("mason-tool-installer").setup({
         ensure_installed = {
            "stylua",      -- Used to format Lua code
            "black",       -- Used to format Python code
            "shfmt",       -- Used to format Shell scripts
            "latexindent", -- Used to format LaTeX code
         },
      })
   end,
}
