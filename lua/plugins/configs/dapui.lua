-- UI 配置
local dap, dapui = require("dap"), require("dapui")
dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end

-- 自定义 ui layout
dapui.setup({
	layouts = {
		{
			position = "left",
			size = 0.4,
			elements = {
				{ id = "stacks", size = 0.2 },
				{ id = "scopes", size = 0.5 },
				{ id = "breakpoints", size = 0.15 },
				{ id = "watches", size = 0.15 },
			},
		},
		{
			position = "bottom",
			size = 0.2,
			elements = {
				{ id = "repl", size = 0.3 },
				{ id = "console", size = 0.7 },
			},
		},
	},
})

-- 自定义 breakpoint icons
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "DapBreakpoint" })
vim.fn.sign_define("DapBreakpointCondition", {
	text = "",
	texthl = "DapBreakpointCondition",
	linehl = "DapBreakpointCondition",
	numhl = "DapBreakpointCondition",
})
vim.fn.sign_define("DapStopped", { text = "󰐊", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" })
vim.fn.sign_define("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })

local nmappings = {
	{ from = "<leader>du", to = dapui.toggle, opts = { desc = "DAP: Toggle UI." } },
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
	{
		from = "<leader>dB",
		to = function()
			local input = vim.fn.input("Condition for breakpoint:")
			dap.set_breakpoint(input)
		end,
		opts = { desc = "DAP: Conditional Breakpoint" },
	},
	{ from = "<leader>dD", to = dap.clear_breakpoints, opts = { desc = "DAP: Clear Breakpoints" } },
}

for _, mapping in ipairs(nmappings) do
	vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to, mapping.opts or { silent = true })
end
