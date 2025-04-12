return {
	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugins.configs.treesitter")
		end,
	},

	-- comment
	{
		"numToStr/Comment.nvim",
		opts = {
			-- add any options here
		},
	},

	-- RRethy/vim-illuminate
	{ "RRethy/vim-illuminate" },

	-- conform.nvim
	{
		"stevearc/conform.nvim",
		config = function()
			require("plugins.configs.conform")
		end,
	},

	-- hlchunk
	{
		"shellRaining/hlchunk.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("hlchunk").setup({
				chunk = { enable = true },
				indent = { enable = true },
			})
		end,
	},

	-- toggleterm.nvim
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {},
	},

	-- nvim-auto-pairs
	{ "windwp/nvim-autopairs", event = "InsertEnter", config = true },

	-- vim-translate
	{
		"voldikss/vim-translator",
		config = function()
			vim.g.translator_window_type = "popup"
			vim.g.translator_default_engines = { "bing", "youdao" }
		end,
	},

	-- gitsigns.nvim
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("plugins.configs.gitsigns")
		end,
	},

	-- cellular-automaton.nvim (实现代码坍塌效果)
	{ "Eandrju/cellular-automaton.nvim", event = "VeryLazy" },

	-- snacks.nvim
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			animate = { enabled = true },
			bigfile = { enabled = true },
			dashboard = { enabled = true },
			quickfile = { enabled = true },
			scope = { enabled = true },
			scroll = { enabled = true },
			image = {},
		},
	},
}
