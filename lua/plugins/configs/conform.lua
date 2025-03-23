vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

-- conform config
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
	},

	-- 保存时自动格式化
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})
