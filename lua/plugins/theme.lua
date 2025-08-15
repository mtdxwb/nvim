return {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	priority = 1000,

	config = function()
		require("catppuccin").setup({
			transparent_background = true, -- disables setting the background color.
			float = {
				transparent = true,
				solid = true,
			},
			term_color = true,
			auto_integrations = true,

			integrations = {
				illuminate = { enabled = false },
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
