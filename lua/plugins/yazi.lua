-- yazi.nvim
---@type LazySpec
return {
	"mikavilpas/yazi.nvim",
  event = "VeryLazy",
	dependencies = { "folke/snacks.nvim" },
	keys = {
		{ "<leader>e", "<cmd>Yazi cwd<cr>", desc = "Open the file manager in nvim's working directory" },
	},
	---@type YaziConfig | {}
	opts = {
		-- if you want to open yazi instead of netrw, see below for more info
		open_for_directories = true,
		keymaps = { show_help = "<f1>" },
	},
	-- 👇 if you use `open_for_directories=true`, this is recommended
	init = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
	end,
}
