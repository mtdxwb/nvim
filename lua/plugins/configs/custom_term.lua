-- toggleterm custom term

local Terminal = require("toggleterm.terminal").Terminal

--  --> lazygit
local lazygit = Terminal:new({
	cmd = "lazygit",
	hidden = true,
	display_name = "LazyGit",
	direction = "float",
	float_opts = { border = "rounded" },
})

function _lazygit_toggle()
	lazygit:toggle()
end

--  --> floating term
local float_term = Terminal:new({
	hidden = true,
	display_name = "Floating Terminal",
	direction = "float",
	float_opts = { border = "rounded" },
})

function _floating_term()
	float_term:toggle()
end
