local cmp = require('cmp')

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	sources = cmp.config.sources({
		{ name = "copilot",                 group_index = 2 },
		{ name = "luasnip",                 keyword_length = 2 },
		{ name = "nvim_lsp" },
		{ name = "nvim_lsp_signature_help", keyword_length = 3 },
		{ name = "buffer" },
		{ name = "async_path",              keyword_length = 3 },
	}),
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
})

cmp.setup.filetype('lua', {
	sources = cmp.config.sources({
		{ name = "luasnip",                 keyword_length = 2 },
		{ name = "nvim_lua" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lsp_signature_help", keyword_length = 3 },
		{ name = "buffer" },
		{ name = "async_path",              keyword_length = 3 },
	})
})

cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})
