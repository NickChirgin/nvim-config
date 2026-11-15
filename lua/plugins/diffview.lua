return {
	"sindrets/diffview.nvim",
	cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewFocusFiles', 'DiffviewRefresh', 'DiffviewFileHistory', 'DiffviewLog' },
	opts = {
		use_icons = true,
		enhanced_diff_hl = true,
		show_help_hints = false,
		view = {
			default = {
				layout = 'diff2_horizontal',
				disable_diagnostics = true,
				winbar_info = true,
			},
			merge_tool = {
				layout = 'diff3_horizontal',
				disable_diagnostics = true,
				winbar_info = true,
			},
			file_history = {
				layout = 'diff2_horizontal',
				disable_diagnostics = true,
				winbar_info = true,
			},
		},
		hooks = {
			diff_buf_read = function()
				vim.opt_local.wrap = false
				vim.opt_local.list = false
			end,
		},
	}
}
