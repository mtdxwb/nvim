return {
  {
    'mfussenegger/nvim-dap',
    event = "VeryLazy",
    config = function()
      require "plugins.configs.dap-config"
    end
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap', 'theHamsta/nvim-dap-virtual-text', 'nvim-neotest/nvim-nio' },
    event = "VeryLazy",
    config = function()
      require("nvim-dap-virtual-text").setup()
      require("noice").setup()
      require "plugins.configs.dapui"
    end
  },
}
