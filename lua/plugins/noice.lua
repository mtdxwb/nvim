-- noice
return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = { },
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		{
			"rcarriga/nvim-notify",
			config = function()
				require("notify").setup({
					background_colour = "#000000", -- 设置透明背景
				})
			end,
		},

		-- treesitter
		"nvim-treesitter/nvim-treesitter",
	},
}
