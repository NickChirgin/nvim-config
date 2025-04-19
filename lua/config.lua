-- ~/.config/nvim/lua/config.lua
-- Core settings
require('core.options')
require('core.autocmds')
require('core.keymaps')

-- Plugin configurations
require('plugins.init') -- This will load lazy.nvim and all other plugins
