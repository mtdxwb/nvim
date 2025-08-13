local opt = vim.opt

-- 行号
opt.number = true
opt.relativenumber = true

-- 缩进
opt.tabstop = 2
opt.shiftwidth = 0
opt.expandtab = true
opt.autoindent = true

-- 防止包裹
opt.wrap = false

-- 启用鼠标
opt.mouse:append('a')

-- 搜索
opt.ignorecase = true
opt.smartcase = true

-- 外观
opt.cursorline = true
opt.termguicolors = true
opt.signcolumn = "yes"
opt.colorcolumn = "100"

opt.updatetime = 100

-- 分割窗口
opt.splitbelow = true
opt.splitright = true

-- netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- 显示行尾空格
opt.list = true
opt.listchars = [[tab:│ ,trail:▫]]

-- others
opt.scrolloff = 8
opt.tw = 0
opt.indentexpr = " "
opt.autoread = true

-- 代码折叠
opt.foldenable = true
opt.foldlevelstart = 99
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldcolumn = "0"
opt.fillchars = "eob: ,fold: ,foldopen:,foldsep: ,foldclose:"

local function fold_virt_text(result, start_text, lnum)
	local text = ""
	local hl
	for i = 1, #start_text do
		local char = start_text:sub(i, i)
		local captured_highlights = vim.treesitter.get_captures_at_pos(0, lnum, i - 1)
		local outmost_highlight = captured_highlights[#captured_highlights]
		if outmost_highlight then
			local new_hl = "@" .. outmost_highlight.capture
			if new_hl ~= hl then
				-- as soon as new hl appears, push substring with current hl to table
				table.insert(result, { text, hl })
				text = ""
				hl = nil
			end
			text = text .. char
			hl = new_hl
		else
			text = text .. char
		end
	end
	table.insert(result, { text, hl })
end
function _G.custom_foldtext()
	local start_text = vim.fn.getline(vim.v.foldstart):gsub("\t", string.rep(" ", vim.o.tabstop))
	local nline = vim.v.foldend - vim.v.foldstart
	local result = {}
	fold_virt_text(result, start_text, vim.v.foldstart - 1)
	table.insert(result, { " ... ", "@comment" })
	table.insert(result, { "| ", "@comment.warning.gitcommit" })
	table.insert(result, { "↙ " .. nline .. " lines", "@comment.warning.gitcommit" })
	table.insert(result, { " |", "@comment.warning.gitcommit" })
	return result
end
opt.foldtext = "v:lua.custom_foldtext()"
