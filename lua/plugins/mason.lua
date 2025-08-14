return {
	"mason-org/mason.nvim",
	event = { "BufReadPost", "BufNewFile", "VimEnter" },
	opts = {
		ui = {
			border = "rounded",
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	},
}
