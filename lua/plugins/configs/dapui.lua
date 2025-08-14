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
vim.fn.sign_define(
	"DapBreakpointCondition",
	{
		text = "",
		texthl = "DapBreakpointCondition",
		linehl = "DapBreakpointCondition",
		numhl = "DapBreakpointCondition",
	}
)
vim.fn.sign_define("DapStopped", { text = "󰐊", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" })
