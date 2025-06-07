return {
	'williamboman/mason.nvim',
	'williamboman/mason-tool-installer.nvim',
	{ 'j-hui/fidget.nvim', opts = {} },

	config = function()
		-- Set up Mason first
		require('mason').setup()
		require('mason-tool-installer').setup {
			ensure_installed = { 'stylua', 'gopls' } -- Add your LSP servers here
		}

		-- LSP capabilities
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

		-- Common on_attach function
		local on_attach = function(client, bufnr)
			-- Helper function for keymaps
			local map = function(keys, func, desc)
				vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
			end

			-- Key mappings
			map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
			map('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
			map('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
			map('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
			map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
			map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
			map('K', vim.lsp.buf.hover, 'Hover Documentation')
			map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

			-- Document highlight
			if client.server_capabilities.documentHighlightProvider then
				vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
					buffer = bufnr,
					callback = vim.lsp.buf.document_highlight,
				})

				vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
					buffer = bufnr,
					callback = vim.lsp.buf.clear_references,
				})
			end
		end
	end
}
