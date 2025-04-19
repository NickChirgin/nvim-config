return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('oil').setup {
      use_default_keymaps = true,
      default_file_explorer = true,
      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' }),
      view_options = {
        show_hidden = true,
      },
      -- This is where icons are configured
      icons = {
        git_placement = "signcolumn",
        folder_mappings = {}, -- Disable default folder icons
        file_mappings = {},   -- Disable default file icons
        -- Use web-devicons instead
        use_devicons = true,
      },
    }
  end,
}
