-- source: https://github.com/NeuralNine/config-files/blob/fe08d1d6f44b28a0ddbf4abe9d0b9d3057f59bbe/.config/nvim/lua/plugins/nvim-dap.lua
return {
	{
		"mfussenegger/nvim-dap",
		recommend = true,
		dependencies = {
			"nvim-neotest/nvim-nio",
			"rcarriga/nvim-dap-ui",
			"mfussenegger/nvim-dap-python",
			"theHamsta/nvim-dap-virtual-text",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			local dap_python = require("dap-python")

			require("dapui").setup({})
			require("nvim-dap-virtual-text").setup({
				commented = true, -- Show virtual text alongside comment
			})

			dap_python.setup("python")

			-- JavaScript/TypeScript (using vscode-js-debug via nvim-dap)
			dap.adapters["pwa-node"] = {
				type = "server",
				host = "localhost",
				port = "${port}",
				executable = {
					command = "node",
					args = {
						os.getenv("HOME")
							.. "/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
						"${port}",
					},
				},
			}
			for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
				dap.configurations[language] = {
					{
						type = "pwa-node",
						request = "launch",
						name = "Launch file",
						program = "${file}",
						cwd = "${workspaceFolder}",
					},
					{
						type = "pwa-node",
						request = "attach",
						name = "Attach",
						processId = require("dap.utils").pick_process,
						cwd = "${workspaceFolder}",
					},
				}
			end

			vim.fn.sign_define("DapBreakpoint", {
				text = "",
				texthl = "DiagnosticSignError",
				linehl = "",
				numhl = "",
			})

			vim.fn.sign_define("DapBreakpointRejected", {
				text = "", -- or "❌"
				texthl = "DiagnosticSignError",
				linehl = "",
				numhl = "",
			})

			vim.fn.sign_define("DapStopped", {
				text = "", -- or "→"
				texthl = "DiagnosticSignWarn",
				linehl = "Visual",
				numhl = "DiagnosticSignWarn",
			})

			-- Automatically open/close DAP UI
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end

			local opts = { noremap = true, silent = true }

			-- Toggle breakpoint
			vim.keymap.set("n", "<leader>db", function()
				dap.toggle_breakpoint()
			end, opts)

			-- Continue / Start
			vim.keymap.set("n", "<leader>dc", function()
				dap.continue()
			end, opts)

			-- Step Over
			vim.keymap.set("n", "<leader>do", function()
				dap.step_over()
			end, opts)

			-- Step Into
			vim.keymap.set("n", "<leader>di", function()
				dap.step_into()
			end, opts)

			-- Step Out
			vim.keymap.set("n", "<leader>dO", function()
				dap.step_out()
			end, opts)

			-- Keymap to terminate debugging
			vim.keymap.set("n", "<leader>dq", function()
				require("dap").terminate()
			end, opts)

			-- Toggle DAP UI
			vim.keymap.set("n", "<leader>du", function()
				dapui.toggle()
			end, opts)
		end,
	},
}
