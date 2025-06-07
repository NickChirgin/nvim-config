return {
	'williamboman/mason.nvim',
	'williamboman/mason-tool-installer.nvim',
	{ 'j-hui/fidget.nvim', opts = {} },

	config = function()
		-- Set up Mason first
		require('mason').setup()
		require('mason-tool-installer').setup {
			ensure_installed = { 'lua-language-server', 'gopls' } -- Add your LSP servers here
		}
	end

}
