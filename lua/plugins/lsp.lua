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
         ensure_installed = { 'lua_ls', 'pyright', 'bashls', 'texlab', 'sqls' }
      })

      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

      -- Ensure sqls LSP works
      lspconfig.sqls.setup({
         on_attach = function(client, bufnr)
            require('sqls').on_attach(client, bufnr) -- Ensure sqls.nvim is correctly loaded
         end,
         capabilities = capabilities,
      })

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
      })

      -- Set up other LSP servers
      lspconfig.pyright.setup { capabilities = capabilities }
      lspconfig.bashls.setup { capabilities = capabilities }
      lspconfig.texlab.setup { capabilities = capabilities }

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
