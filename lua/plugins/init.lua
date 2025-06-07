local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
	vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
-- Core plugins
	'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

	-- Other plugins will be loaded from their respective files
	{ import = 'plugins.telescope' },
	-- { import = 'plugins.lsp' },
	{ import = 'plugins.blink-cmp' },
	{ import = 'plugins.vim-lsp' },
	{ import = 'plugins.treesitter' },
	{ import = 'plugins.harpoon' },
	{ import = 'plugins.fugitive' },
	{ import = 'plugins.dap' },
	{ import = 'plugins.conform' },
	{ import = 'plugins.oil' },
	{ import = 'plugins.toggleterm' },
	{ import = 'plugins.undotree' },
	-- { import = 'plugins.cmp' },
	{ import = 'plugins.dadbod' },
	{ import = 'plugins.catpuccin' },
	{ import = 'plugins.goimport' },
	{ import = 'plugins.lualine' },
	{ import = 'plugins.luasnip' },
}, {
	ui = {
		icons = vim.g.have_nerd_font and {} or {
			cmd = '⌘',
			config = '🛠',
			event = '📅',
			ft = '📂',
			init = '⚙',
			keys = '🗝',
			plugin = '🔌',
			runtime = '💻',
			require = '🌙',
			source = '📄',
			start = '🚀',
			task = '📌',
			lazy = '💤 ',
		},
	},
})
