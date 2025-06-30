return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim", config = true },
    {
      "mason-org/mason-lspconfig.nvim",
      opts = {
        ensure_installed = { "lua_ls", "pyright", "bashls", "texlab", "sqls" },
      },
      dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
      },
    },
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    { "j-hui/fidget.nvim", opts = {} },
    { "folke/neodev.nvim", opts = {} },
    -- nvim-cmp and friends
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    "saghen/blink.cmp", -- <== make sure this is included
  },
  config = function()
    require("mason").setup()

    vim.schedule(function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "stylua",
          "black",
          "shfmt",
          "latexindent",
        },
      })
    end)

    local lspconfig = require("lspconfig")

    -- Optional: additional custom capabilities (folding, etc.)
    local custom_capabilities = {
      textDocument = {
        foldingRange = {
          dynamicRegistration = false,
          lineFoldingOnly = true,
        },
      },
    }

    -- Final merged capabilities via blink.cmp
    local capabilities = require("blink.cmp").get_lsp_capabilities(
      vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), custom_capabilities)
    )

    local function on_attach(client, bufnr)
      if client.name == "sqls" then
        local ok, sqls = pcall(require, "sqls")
        if ok then sqls.on_attach(client, bufnr) end
      end
    end

    local servers = {
      lua_ls = {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            telemetry = { enable = false },
            format = {
              enable = true,
              defaultConfig = {
                indent_style = "space",
                indent_size = "3",
              },
            },
          },
        },
      },
      pyright = {},
      bashls = {},
      texlab = {},
      sqls = {},
    }

    for name, config in pairs(servers) do
      config.capabilities = capabilities
      config.on_attach = config.on_attach or on_attach
      lspconfig[name].setup(config)
    end
  end,
}


