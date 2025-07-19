return {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	priority = 1000,

	config = function()
		require("catppuccin").setup({
			transparent_background = true, -- disables setting the background color.
			show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
			term_color = true,

			integrations = {
				notify = true,
				treesitter = true,
				noice = true,

				-- lsp-config
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
						ok = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
						ok = { "underline" },
					},
					inlay_hints = {
						background = true,
					},
				},

				blink_cmp = true,

				dropbar = {
					enabled = true,
					color_mode = false, -- enable color for kind's texts, not just kind's icons
				},

				indent_blankline = {
					enabled = true,
					scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
					colored_indent_levels = false,
				},

				illuminate = { enabled = false },
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
