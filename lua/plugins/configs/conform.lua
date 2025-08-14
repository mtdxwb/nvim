-- conform config
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		cpp = { "clang-format" },
		rust = { "rustfmt" },
	},
})
