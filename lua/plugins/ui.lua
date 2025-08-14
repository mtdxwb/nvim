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
		event = { "BufReadPre", "BufNewFile" },
		-- optional, but required for fuzzy finder support
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		opts = function()
			vim.keymap.set("n", "<leader>;", require("dropbar.api").pick, { desc = "Pick symbols in winbar" })
			vim.keymap.set("n", "[;", require("dropbar.api").goto_context_start, { desc = "Go to start of current context" })
			vim.keymap.set("n", "];", require("dropbar.api").select_next_context, { desc = "Select next context" })
		end,
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
