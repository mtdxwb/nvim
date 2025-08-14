return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	keys = {
		{ "<leader>ff", "<cmd>FzfLua files<CR>", desc = "FzfLua find files" },
		{ "<leader>fb", "<cmd>FzfLua buffers<CR>", desc = "FzfLua find buffers" },
		{ "<leader>lg", "<cmd>FzfLua live_grep<CR>", desc = "FzfLua live grep" },
	},
}
