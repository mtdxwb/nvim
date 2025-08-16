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

	-- dashboard
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				-- config
				theme = "hyper",
				config = {
					header = {
						"██╗    ██╗██████╗       ██╗   ██╗██╗███╗   ███╗",
						"██║    ██║██╔══██╗      ██║   ██║██║████╗ ████║",
						"██║ █╗ ██║██████╔╝  🐢  ██║   ██║██║██╔████╔██║",
						"██║███╗██║██╔══██╗      ╚██╗ ██╔╝██║██║╚██╔╝██║",
						"╚███╔███╔╝██████╔╝       ╚████╔╝ ██║██║ ╚═╝ ██║",
						" ╚══╝╚══╝ ╚═════╝         ╚═══╝  ╚═╝╚═╝     ╚═╝",
					},
					shortcut = {
						{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
						{
							icon = " ",
							icon_hl = "@variable",
							desc = "Files",
							group = "Label",
							action = "FzfLua files",
							key = "f",
						},
						{ desc = " Config", group = "Number", action = "edit $MYVIMRC", key = "c" },
					},
					project = { enable = true, limit = 4, icon = " Recent Projects", label = "", action = "FzfLua files cwd=" },
					mru = { enable = true, limit = 5, icon = " Recent Files", label = "", cwd_only = false },
				},
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
}
