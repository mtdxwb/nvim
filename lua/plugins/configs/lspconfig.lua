-- mason.lua
local mason_status, mason = pcall(require, "mason")
if not mason_status then
	vim.notify("没有找到 mason")
	return
end

local nlsp_status, nvlsp = pcall(require, "lspconfig")
if not nlsp_status then
	vim.notify("没有找到 lspconfig")
	return
end

-- mason config
mason.setup({
	ui = {
		border = "rounded",
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

-- 错误信息显示边框
vim.diagnostic.config({
	float = {
		border = "rounded", -- 可选样式：none/single/double/rounded/solid/shadow
		format = function(diagnostic)
			return string.format("%s (%s)", diagnostic.message, diagnostic.source)
		end,
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "󰌵",
			[vim.diagnostic.severity.INFO] = "",
		},
	},
})

-- 禁用所有 LSP 客户端的原生签名帮助
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "Disable native signature help",
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client then
			client.server_capabilities.signatureHelpProvider = false
		end
	end,
})

-- 快捷键
local keymap = vim.keymap

local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- set keybinds
	-- rename
	keymap.set("n", "<leader>r", "<cmd>Lspsaga rename<CR>", opts)

	-- go to definition
	keymap.set("n", "gd", "<cmd>Lspsaga finder def+ref<CR>", opts)

	-- 代码操作
	keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)

	-- 以浮窗形式显示错误
	keymap.set("n", "gp", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
	keymap.set("n", "gn", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)

	-- 悬停文档
	keymap.set("n", "<leader>h", "<cmd>Lspsaga hover_doc<CR>", opts)
end

-- blink
local capabilities = require("blink.cmp").get_lsp_capabilities()

-- lsp 配置
--  --> lua
nvlsp.lua_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

--  --> c/c++(clang)
nvlsp.clangd.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

--  --> cmake
nvlsp.cmake.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

--  --> bash
nvlsp.bashls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
