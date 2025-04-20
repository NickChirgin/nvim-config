return { -- Autocompletion
	'hrsh7th/nvim-cmp',

	dependencies = {
		"onsails/lspkind.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
		{ "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
		"saadparwaiz1/cmp_luasnip",
	},
	config = function()
		-- See `:help cmp`
		local cmp = require 'cmp'
		local lspkind = require 'lspkind'
		local ls = require 'luasnip'
		lspkind.init {}

		cmp.setup {
			snippet = {
				expand = function(args)
					vim.snippet.expand(args.body)
				end,
			},
			completion = { completeopt = 'menu,menuone,noinsert' },

			-- For an understanding of why these mappings were
			-- chosen, you will need to read `:help ins-completion`
			--
			-- No, but seriously. Please read `:help ins-completion`, it is really good!
			mapping = cmp.mapping.preset.insert {
				-- Select the [n]ext item
				['<C-n>'] = cmp.mapping.select_next_item(),
				-- Select the [p]revious item
				['<C-p>'] = cmp.mapping.select_prev_item(),

				-- Accept ([y]es) the completion.
				--  This will auto-import if your LSP supports it.
				--  This will expand snippets if the LSP sent a snippet.
				['<C-y>'] = cmp.mapping.confirm {
					behavior = cmp.ConfirmBehavior.Insert,
					select = true,
				},
			},
			sources = {
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' },
				{ name = 'path' },
				{ name = 'cody' },
				{ name = 'buffer' },
			},
		}
	end,
}
