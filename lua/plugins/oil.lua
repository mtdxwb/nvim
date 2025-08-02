return {
	"stevearc/oil.nvim",
	lazy = false,
	-- Optional dependencies
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
    { "benomahony/oil-git.nvim", opts = {} },
    { "JezerM/oil-lsp-diagnostics.nvim", opts = {} },
	},
	config = function()
		require("plugins.configs.oil-config")
	end,
}
