local function on_attach(client, bufnr)
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
end

local function default_lsp_config()
	local capabilities = require("cmp_nvim_lsp").default_capabilities()
	return {
		capabilities = capabilities,
		on_attach = on_attach,
	}
end

require("lspconfig").cmake.setup(default_lsp_config())
require("lspconfig").sqlls.setup(default_lsp_config())
require("lspconfig").pyright.setup(default_lsp_config())
require("lspconfig").gopls.setup(default_lsp_config())
require('lspconfig').lua_ls.setup(default_lsp_config())
require('lspconfig').clangd.setup(default_lsp_config())
require('lspconfig').nixd.setup(default_lsp_config())

local nlspsettings = require("nlspsettings")
nlspsettings.setup({
	config_home = vim.fn.stdpath('config') .. '/nlsp-settings',
	local_settings_dir = ".nlsp-settings",
	local_settings_root_markers_fallback = { '.git' },
	append_default_schemas = true,
	loader = 'json'
})

require("rust-tools").setup(default_lsp_config())

require("copilot").setup({
	suggestion = {
		auto_trigger = true,
		keymap = {
			accept = "<M-CR>",
		}
	}
})
