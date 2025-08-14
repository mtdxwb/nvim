return {
	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		config = function()
			require("plugins.configs.treesitter")
		end,
	},

	-- RRethy/vim-illuminate
	{ "RRethy/vim-illuminate" },

	-- conform.nvim
	{
		"stevearc/conform.nvim",
		keys = {
			{
				"<leader>=",
				function()
					require("conform").format()
				end,
				noremap = true,
				silent = true,
			},
		},
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
				chunk = { enable = false },
				indent = { enable = true },
			})
		end,
	},

	-- toggleterm.nvim
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		event = "VeryLazy",
		opts = {},
	},

	-- nvim-auto-pairs
	{ "windwp/nvim-autopairs", event = "InsertEnter", config = true },

	-- vim-translate
	{
		"voldikss/vim-translator",
		event = "VeryLazy",
		config = function()
			vim.g.translator_window_type = "popup"
			vim.g.translator_default_engines = { "bing", "youdao" }
		end,
		keys = {
			{ "<leader>tt", { "n", "v" }, "<cmd>TranslateW<CR>", noremap = true, silent = true },
		},
	},

	-- gitsigns.nvim
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("plugins.configs.gitsigns")
		end,
	},
}
