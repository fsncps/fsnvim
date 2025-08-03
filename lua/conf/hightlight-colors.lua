-- Enable true colors
vim.opt.termguicolors = true

-- Setup highlight-colors plugin
require("nvim-highlight-colors").setup({
	render = "background",
	virtual_symbol = "■",
	virtual_symbol_prefix = "",
	virtual_symbol_suffix = " ",
	virtual_symbol_position = "inline",
	enable_hex = true,
	enable_short_hex = true,
	enable_rgb = true,
	enable_hsl = true,
	enable_ansi = true,
	enable_hsl_without_function = true,
	enable_var_usage = true,
	enable_named_colors = true,
	enable_tailwind = false,
	custom_colors = {
		{ label = "%-%-theme%-primary%-color", color = "#0f1219" },
		{ label = "%-%-theme%-secondary%-color", color = "#5a5d64" },
	},
	exclude_filetypes = {},
	exclude_buftypes = {},
	exclude_buffer = function(bufnr) end,
})

-- Set up cmp formatting with highlight-colors and lspkind
-- require("cmp").setup({
--    formatting = {
--       expandable_indicator = true,
--       fields = { "abbr", "kind", "menu" },
--       format = function(entry, item)
--          local color_item = require("nvim-highlight-colors").format(entry, { kind = item.kind })
--
--          -- Use lspkind to format base item
--          item = require("lspkind").cmp_format({
--             mode = "symbol_text", -- optional, "text" | "symbol" | "symbol_text"
--             maxwidth = 50,        -- optional
--             menu = {
--                nvim_lsp = "[LSP]",
--                luasnip = "[Snippet]",
--                buffer = "[Buffer]",
--                path = "[Path]",
--             },
--          })(entry, item)
--
--          -- Override kind/icon if highlight-colors provides custom styling
--          if color_item.abbr_hl_group then
--             item.kind_hl_group = color_item.abbr_hl_group
--             item.kind = color_item.abbr
--          end
--
--          return item
--       end,
--    }
-- })
--
--
-- -- blink.cmp integration
-- require("blink").use_cmp({
--    completion = {
--       menu = {
--          draw = {
--             components = {
--                kind_icon = {
--                   text = function(ctx)
--                      local icon = ctx.kind_icon
--                      if ctx.item.source_name == "LSP" then
--                         local color_item = require("nvim-highlight-colors").format(ctx.item.documentation,
--                            { kind = ctx.kind })
--                         if color_item and color_item.abbr ~= "" then
--                            icon = color_item.abbr
--                         end
--                      end
--                      return icon .. ctx.icon_gap
--                   end,
--                   highlight = function(ctx)
--                      local highlight = "BlinkCmpKind" .. ctx.kind
--                      if ctx.item.source_name == "LSP" then
--                         local color_item = require("nvim-highlight-colors").format(ctx.item.documentation,
--                            { kind = ctx.kind })
--                         if color_item and color_item.abbr_hl_group then
--                            highlight = color_item.abbr_hl_group
--                         end
--                      end
--                      return highlight
--                   end,
--                },
--             },
--          },
--       },
--    },
-- })
