return {
	"mikavilpas/yazi.nvim",
	version = "*", -- use the latest stable version
  lazy = false,
	dependencies = {
		{ "nvim-lua/plenary.nvim", lazy = true },
	},
	keys = {
		{
			"<leader>-",
			"<cmd>Yazi<CR>",
			desc = "Open yazi at the current file",
			silent = true,
		},
	},
	---@type YaziConfig | {}
	opts = {
		-- if you want to open yazi instead of netrw, see below for more info
		open_for_directories = true,
		keymaps = {
			show_help = "<f1>",
		},
	},
}
