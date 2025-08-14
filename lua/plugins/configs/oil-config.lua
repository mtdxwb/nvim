function _G.get_oil_winbar()
	local dir = require("oil").get_current_dir()
	if dir then
		return vim.fn.fnamemodify(dir, ":~")
	else
		return vim.api.nvim_buf_get_name(0)
	end
end

require("oil").setup({
	default_file_explorer = true,
	win_options = {
		winbar = "%!v:lua.get_oil_winbar()",
	},
})
