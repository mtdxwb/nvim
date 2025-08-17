return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("plugins.configs.dap-config")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "theHamsta/nvim-dap-virtual-text", "nvim-neotest/nvim-nio" },
    config = function()
      require("nvim-dap-virtual-text").setup()
      require("noice").setup()
      require("plugins.configs.dapui")
    end,
  },
}
