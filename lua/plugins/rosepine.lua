return {
	"rose-pine/neovim",
	name = "rose-pine",
	lazy = false, -- Load immediately (not lazy-loaded)
	priority = 1000, -- Load before other plugins
	config = function()
		require("rose-pine").setup({
			--- @usage 'main' | 'moon' | 'dawn'
			variant = 'moon', -- Choose between dark ('main'), darker ('moon'), or light ('dawn')
			dark_variant = 'main', -- Dark mode variant
			bold_vert_split = false,
			dim_nc_background = false,
			disable_background = false, -- Set to `true` for transparency
			disable_float_background = false,
			disable_italics = false,

			-- Custom highlights (optional)
			highlight_groups = {
				-- Override default highlights
				Comment = { fg = 'foam', italic = true },
				-- Make the cursor line stand out
				CursorLine = { bg = 'highlight_med', blend = 10 },
			}
		})

		-- Set the colorscheme after setup
		vim.cmd('colorscheme rose-pine')
	end
}
