-- cokeline 配置样式

local get_hex = require("cokeline.hlgroups").get_hl_attr

require("cokeline").setup({
	default_hl = {
		fg = function(buffer)
			return buffer.is_focused and get_hex("Normal", "fg") or get_hex("Comment", "fg")
		end,
		bg = "NONE", -- get_hex('ColorColumn', 'bg'),
	},

	components = {
		{
			text = " ", -- '｜',
			-- fg = function(buffer)
			-- 	return buffer.is_modified and yellow or green
			-- end,
			fg = get_hex("Normal", "fg"),
		},
		{
			text = function(buffer)
				return buffer.devicon.icon
			end,
			fg = function(buffer)
				return buffer.devicon.color
			end,
		},
		{
			text = function(buffer)
				return buffer.unique_prefix
			end,
			fg = get_hex("Comment", "fg"),
			italic = true,
		},
		{
			text = function(buffer)
				return buffer.filename
			end,
			bold = function(buffer)
				return buffer.is_focused
			end,
		},
		{
			text = " ",
		},
	},
})
