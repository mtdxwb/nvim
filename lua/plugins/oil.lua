return {
  'stevearc/oil.nvim',
  lazy = false,
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  config = function()
    require "plugins.configs.oil-config"
  end
}
