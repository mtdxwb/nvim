return {
  -- blink.cmp
  "saghen/blink.cmp",
  event = { "BufReadPost", "BufNewFile" },
  -- optional: provides snippets for the snippet source
  dependencies = { "rafamadriz/friendly-snippets" },

  version = "*",

  ---@module 'blink.cmp'
  ---@type blink.cmp.config
  opts = {
    keymap = {
      preset = "none",
      ["<c-o>"] = { "show", "show_documentation", "hide_documentation" },
      ["<c-e>"] = { "hide", "fallback" },
      ["<cr>"] = { "accept", "fallback" },

      ["<c-n>"] = { "snippet_forward", "fallback" },
      ["<c-p>"] = { "snippet_backward", "fallback" },

      ["<s-tab>"] = { "select_prev", "snippet_backward", "fallback" },
      ["<tab>"] = { "select_next", "snippet_forward", "fallback" },

      ["<c-b>"] = { "scroll_documentation_up", "fallback" },
      ["<c-f>"] = { "scroll_documentation_down", "fallback" },

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

    signature = { enabled = true, window = { border = "rounded" } },

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
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
