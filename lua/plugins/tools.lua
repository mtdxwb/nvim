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
}
