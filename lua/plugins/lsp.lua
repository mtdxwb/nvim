return {
	-- lspconfig
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = { "saghen/blink.cmp", "williamboman/mason.nvim" },

		-- example using `opts` for defining servers
		opts = {
			servers = {
				-- lua
				lua_ls = {},

				-- c/c++
				cmake = {},
				clangd = { capabilities = { offsetEncoding = "utf-8" }, cmd = { "clangd" } },

				-- bash/sh
				bashls = {},
			},
		},

		config = function(_, opts)
			local lspconfig = require("lspconfig")
			for server, config in pairs(opts.servers) do
				-- passing config.capabilities to blink.cmp merges with the capabilities in your
				-- `opts[server].capabilities, if you've defined it
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end
		end,
	},

	-- lsp-saga
	{
		"nvimdev/lspsaga.nvim",
		lazy = false,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			-- lsp sgaga config
			require("lspsaga").setup({
				ui = {
					title = true,
					border = "rounded", -- 窗口边框样式
					colors = {
						normal_bg = "#1d1536",
					},
				},
				symbol_in_winbar = {
					enable = true, -- 在窗口栏显示当前符号路径
				},
				lightbulb = {
					enable = false, -- 显示代码操作提示图标
				},
				hover = {
					max_width = 0.8,
					max_height = 0.9,
					border = "rounded",
					show_arrow = true,
					auto_close = true,
					mouse = true,
				},
			})
		end,
	},

	-- blink.cmp
	{
		"saghen/blink.cmp",
		lazy = false,
		-- optional: provides snippets for the snippet source
		dependencies = { "rafamadriz/friendly-snippets" },

		version = "*",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				preset = "none",
				["<C-o>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-e>"] = { "hide", "fallback" },
				["<CR>"] = { "accept", "fallback" },

				["<C-n>"] = { "snippet_forward", "fallback" },
				["<C-p>"] = { "snippet_backward", "fallback" },

				["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
				["<Tab>"] = { "select_next", "snippet_forward", "fallback" },

				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },

				["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
			},

			completion = {
				keyword = { range = "full" }, -- 在一个单词中间时，自动检测整个单词
				list = { selection = { preselect = false, auto_insert = false } },
				menu = { border = "rounded" },
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 500,
					window = { border = "rounded" },
				},
			},

			signature = { window = { border = "rounded" } },

			appearance = {
				-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "normal",
			},

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},

			-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
			-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
			-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
			--
			-- See the fuzzy documentation for more information
			-- fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
}
