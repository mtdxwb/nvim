return {
	-- lualine
	-- {
	-- 	"nvim-lualine/lualine.nvim",
	-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
	--
	-- 	config = function()
	-- 		require("plugins.configs.lualine")
	-- 	end,
	-- },

	-- dropbar
	{
		"Bekaboo/dropbar.nvim",
		-- optional, but required for fuzzy finder support
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},

	-- cokeline
	-- {
	-- 	"willothy/nvim-cokeline",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim", -- Required for v0.4.0+
	-- 		"nvim-tree/nvim-web-devicons", -- If you want devicons
	-- 		"stevearc/resession.nvim", -- Optional, for persistent history
	-- 	},
	-- 	config = function()
	-- 		require("plugins.configs.cokeline")
	-- 	end,
	-- },
}
