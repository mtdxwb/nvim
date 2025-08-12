-- custom term
require("plugins.configs.custom_term")

-- 主键
vim.g.mapleader = " "

local mode_nv = { "n", "v" }
local mode_v = { "v" }
local mode_i = { "i" }

local bufnr = vim.api.nvim_get_current_buf()

-- dropbar
local dropbar_api = require("dropbar.api")

-- dap
local dap = require("dap")

local nmappings = {
	-- 功能性设置
	{ from = ";", to = ":" },
	{ from = "<leader>nh", to = ":nohl<CR>" }, -- 取消高亮

	-- 移动
	{ from = "<C-h>", to = "<C-w>h" },
	{ from = "<C-j>", to = "<C-w>j" },
	{ from = "<C-k>", to = "<C-w>k" },
	{ from = "<C-l>", to = "<C-w>l" },
	{ from = "H", to = "<cmd>bprevious<CR>" },
	{ from = "L", to = "<cmd>bnext<CR>" },

	-- 移动单行或多行
	{ from = "mj", to = ":m '>+1<CR>gv=gv", mode = mode_v },
	{ from = "mk", to = ":m '<-2<CR>gv=gv", mode = mode_v },

  -- fzf-lua
  { from = "<leader>ff", to = "<cmd>FzfLua files<CR>", opts = { desc = "FzfLua find files" } },
  { from = "<leader>fb", to = "<cmd>FzfLua buffers<CR>", opts = { desc = "FzfLua find buffers" } },
  { from = "<leader>lg", to = "<cmd>FzfLua live_grep<CR>", opts = { desc = "FzfLua live grep" } },

	-- custom term
	{ from = "<leader>g", to = "<cmd>lua _lazygit_toggle()<CR>", opts = { noremap = true, silent = true } },
	{ from = "<leader>tf", to = "<cmd>lua _floating_term()<CR>", opts = { noremap = true, silent = true } },

	-- vim-translator
	{ from = "<leader>tt", to = "<cmd>TranslateW<CR>", opts = { noremap = true, silent = true } },
	{ from = "<leader>tt", to = "<cmd>TranslateW<CR>", mode = mode_v, opts = { noremap = true, silent = true } },

	-- conform
	{
		from = "<leader>=",
		to = function()
			require("conform").format()
		end,
		opts = { noremap = true, silent = true },
	},

	-- dropbar
	{ from = "<leader>;", to = dropbar_api.pick, opts = { desc = "Pick symbols in winbar" } },
	{ from = "[;", to = dropbar_api.goto_context_start, opts = { desc = "Go to start of current context" } },
	{ from = "];", to = dropbar_api.select_next_context, opts = { desc = "Select next context" } },

  -- cellular-automaton.nvim
  { from = "<leader>fml", to = "<cmd>CellularAutomaton make_it_rain<CR>" },

  -- oil.nvim
  { from = "-", to = "<cmd>Oil<cr>", opts = { desc = "Open parent directory" } },

  -- debugger
  { from = "<leader>du", to = require("dapui").toggle , opts = { desc = "DAP: Toggle UI." } },
  { from = "<leader>ds", to = dap.continue, opts = { desc = " Start/Continue" } },
  { from = "<leader>di", to = dap.step_into, opts = { desc = " Step into" } },
  { from = "<leader>do", to = dap.step_over, opts = { desc = " Step over" } },
  { from = "<leader>dO", to = dap.step_out, opts = { desc = " Step out" } },
  { from = "<leader>dq", to = dap.close, opts = { desc = "DAP: Close session" } },
  { from = "<leader>dQ", to = dap.terminate, opts = { desc = " Terminate session" } },
  { from = "<leader>dr", to = dap.restart_frame, opts = { desc = "DAP: Restart" } },
  { from = "<leader>dc", to = dap.run_to_cursor, opts = { desc = "DAP: Run to cursor" } },
  { from = "<leader>dR", to = dap.repl.toggle, opts = { desc = "DAP: Toggle REPL" } },
  { from = "<leader>dh", to = require("dap.ui.widgets").hover, opts = { desc = "DAP: Hover" } },

  { from = "<leader>db", to = dap.toggle_breakpoint, opts = { desc = "DAP: Breakpoint" } },
  { from = "<leader>dB", to = function()
    local input = vim.fn.input 'Condition for breakpoint:'
    dap.set_breakpoint(input)
  end, opts = { desc = "DAP: Conditional Breakpoint" } },
  { from = "<leader>dD", to = dap.clear_breakpoints, opts = { desc = "DAP: Clear Breakpoints" } },

	-- rustaceanvim
	{ from = "K", to = "<Plug>RustHoverAction", opts = { silent = true, buffer = bufnr } },
	{ from = "cp", to = "<cmd>Crun<CR>", opts = { desc = "Rust: Cargo run..." } },
	{ from = "ln", to = "<cmd>RustLsp relatedDiagnostics<CR>", opts = { silent = true, buffer = bufnr } },
}

for _, mapping in ipairs(nmappings) do
	vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to, mapping.opts or { noremap = true })
end
