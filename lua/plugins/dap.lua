return {
	'mfussenegger/nvim-dap',
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"leoluz/nvim-dap-go",
		"nvim-neotest/nvim-nio",
		-- Shows variable values inline as virtual text
		'theHamsta/nvim-dap-virtual-text',
	},

	config = function()
		require("dap-go").setup({
			-- Additional delve configurations
			delve = {
				-- Set the port for delve to use
				port = "38697",
				-- Additional build flags
				build_flags = "-tags=integration -v",
			},
		})
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
				name = "Launch",
				request = "launch",
				program = "${fileDirname}",
				env = {
					VALULT_ADDR = "",
					BOZON_BRIN_NG_LOCAL_CONFIG_ENABLED = "true",
					BOZON_BRIN_NG_LOCAL_CONFIG_PATH =
					"/Users/nchirgin/Documents/ozon/brin/brin-ng/.o3/k8s",
					BOZON_BRIN_NG_LOCAL_CONFIG_NAME = "values_test.yaml",
					BOZON_BRIN_NG_BIND_LOCALHOST = "true",
				},
			},
			{
				type = "go",
				name = "Debug with Env Vars",
				request = "launch",
				mode = "test",
				program = "${fileDirname}",
				env = {
					VALULT_ADDR = "",
					BOZON_BRIN_NG_LOCAL_CONFIG_ENABLED = "true",
					BOZON_BRIN_NG_LOCAL_CONFIG_PATH =
					"/Users/nchirgin/Documents/ozon/brin/brin-ng/.o3/k8s",
					BOZON_BRIN_NG_LOCAL_CONFIG_NAME = "values_test.yaml",
					BOZON_BRIN_NG_BIND_LOCALHOST = "true",
				},
				buildFlags = "-tags=integration",
				buildPackage = ".",
			}
		}
		-- Add this to your existing config function
		vim.keymap.set('n', '<leader>dm', function()
			-- Run debug_test with custom configuration
			require('dap-go').debug_test({
				env = {
					VAULT_ADDR = "",
					BOZON_BRIN_NG_LOCAL_CONFIG_ENABLED = "true",
					BOZON_BRIN_NG_LOCAL_CONFIG_PATH =
					"/Users/nchirgin/Documents/ozon/brin/brin-ng/.o3/k8s",
					BOZON_BRIN_NG_LOCAL_CONFIG_NAME = "values_test.yaml",
					BOZON_BRIN_NG_BIND_LOCALHOST = "true",
				},
				buildFlags = "-tags=integration",
				callback = function()
					require('dapui').open() -- Ensure UI opens
				end
			})
		end, { desc = "Debug current test method" })
	end,
}
