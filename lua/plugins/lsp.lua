return {
  -- lspconfig
  { "neovim/nvim-lspconfig" },

  -- mason.nvim
  {
    "williamboman/mason.nvim",
    opts = function()
      require("plugins.configs.lsp-config")
    end
  },
}

