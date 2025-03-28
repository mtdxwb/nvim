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
		border = "single",
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

-- 快捷键
local keymap = vim.keymap

local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- set keybinds
	-- rename
	keymap.set("n", "<leader>r", "<cmd>lsp vim.lsp.buf.rename<CR>", opts)
	-- go to definition
	keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	-- 以浮窗形式显示错误
	keymap.set("n", "go", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	keymap.set("n", "gp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	keymap.set("n", "gn", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
end

-- blink
local capabilities = require("blink.cmp").get_lsp_capabilities()

-- lsp 配置
--  --> lua
nvlsp.lua_ls.setup({
	on_attach = on_attach,
	on_init = function(client)
		local path = client.workspace_folders[1].name
		if
			not vim.loop.fs_stat(path .. "~/.config/nvim/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc")
		then
			client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
						},
					},
				},
			})

			client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
		end
		return true
	end,
	capabilities = capabilities,
})

--  --> c/c++(clang)
nvlsp.clangd.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
