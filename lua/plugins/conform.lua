return {
	"stevearc/conform.nvim",
	lazy = false,
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = function(bufnr)
			local disable_filetypes = { c = true, cpp = true }
			return {
				timeout_ms = 500,
				lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
			}
		end,
		formatters_by_ft = {
			python = { "black" },
			lua = { "stylua" },
			sh = { "shfmt" },
			json = { "prettier" },
			yaml = { "yamlfmt" },
			toml = { "taplo" },
			php = { "php-cs-fixer" },
			html = { "prettier" },
		},
	},
	init = function()
		-- Optional: only enable for supported filetypes
		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function(args)
				require("conform").format({
					bufnr = args.buf,
					lsp_fallback = true,
					timeout_ms = 500,
				})
			end,
		})
	end,
}
