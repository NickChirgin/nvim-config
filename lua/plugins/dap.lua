return {
	'mfussenegger/nvim-dap',
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"leoluz/nvim-dap-go",
		"nvim-neotest/nvim-nio",
	},

	config = function()
		require("dap-go").setup()
		require("dapui").setup()

		local dap, dapui = require("dap"), require("dapui")
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
		vim.keymap.set('n', '<Leader>b', dap.toggle_breakpoint)
		vim.keymap.set('n', '<F1>', dap.continue)
		vim.keymap.set('n', '<F2>', dap.step_over)
		vim.keymap.set('n', '<F3>', dap.step_into)
		vim.keymap.set('n', '<F4>', dap.step_out)
		dap.configurations.go = {
			{
				type = "go",
				name = "Launch with dynamic args",
				request = "launch",
				program = "${file}",
				args = function()
					return vim.fn.input('Enter args (space-separated): ', '', 'file')
				end,
			},
		}
	end,
}
