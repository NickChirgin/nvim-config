return {
	'akinsho/toggleterm.nvim',
	version = '*',
	config = function()
		require('toggleterm').setup({
			-- Add this to close on Esc in terminal mode
			on_open = function(term)
				vim.api.nvim_buf_set_keymap(
					term.bufnr,
					't', -- Terminal mode
					'<Esc>',
					'<Cmd>close<CR>',
					{ noremap = true, silent = true }
				)
			end,
		})
		vim.keymap.set('n', '<C-z>', function()
			require('toggleterm').toggle(0, 0, nil, 'float')
		end, { noremap = true, silent = true })
	end,
}
