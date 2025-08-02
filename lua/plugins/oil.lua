return {
	"stevearc/oil.nvim",
	lazy = false,
	-- Optional dependencies
	dependencies = {
		{ "echasnovski/mini.icons", opts = {} },
    { "benomahony/oil-git.nvim", opts = {} },
    { "JezerM/oil-lsp-diagnostics.nvim", opts = {} },
	},
	config = function()
		require("plugins.configs.oil-config")
	end,
}
