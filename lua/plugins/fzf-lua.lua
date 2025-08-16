return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
  config = function(_, opts)
    require("fzf-lua").setup(opts)
    vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<CR>", { desc = "FzfLua find files" })
    vim.keymap.set("n", "<leader>fb", "<cmd>FzfLua buffers<CR>", { desc = "FzfLua find buffers" })
		vim.keymap.set("n", "<leader>lg", "<cmd>FzfLua live_grep<CR>", { desc = "FzfLua live grep" })
  end,
}
