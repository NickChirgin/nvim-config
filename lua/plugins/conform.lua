return {
	'stevearc/conform.nvim',
	event = { 'BufReadPre', 'BufNewFile' },
	config = function()
		local conform = require 'conform'

		conform.setup {
			formatters_by_ft = {
				proto = { 'buf' },
				yaml = { 'yamlfix' },
				go = { 'goimports' },
			},
			format_on_save = {
				-- I recommend these options. See :help conform.format for details.
				lsp_fallback = true,
				timeout_ms = 500,
			},
			-- If this is set, Conform will run the formatter asynchronously after save.
			-- It will pass thke table to conform.format().
			-- This can also be a function that returns the table.
			format_after_save = {
				lsp_fallback = true,
			},
		}

		vim.keymap.set({ 'n', 'v' }, '<leader>l', function()
			conform.format {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			}
		end, { desc = 'Format file or range (in visual mode)' })
	end,
}
