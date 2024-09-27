return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui", -- Optional UI
			"nvim-neotest/nvim-nio",
			"mfussenegger/nvim-dap-python", -- Debugger for Python
		},
		config = function()
			local dap = require("dap")
			local dap_python = require("dap-python")
			local dapui = require("dapui")

			-- Setup dap-python with path to debugpy (make sure it's installed via Mason)
			dap_python.setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")

			-- Setup dap-ui for better debugging experience
			dapui.setup()

			-- Python-specific configurations
			dap.configurations.python = {
				{
					type = "python",
					request = "launch",
					name = "Launch file",
					program = "${file}", -- This will launch the current file
					pythonPath = function()
						-- Use virtual environment if available, otherwise fallback to system Python
						local venv_path = os.getenv("VIRTUAL_ENV")
						if venv_path then
							return venv_path .. "/bin/python"
						else
							return "/usr/bin/python" -- Default Python path
						end
					end,
				},
			}

			-- Automatically open dap-ui on debug start, close on debug end
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			-- Debugging keymaps
			vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Debug continue" })
			vim.keymap.set("n", "<leader>dv", dap.step_over, { desc = "Debug step over" })
			vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Debug step into" })
			vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "Debug step out" })
			vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug toggle breakpoint" })
			vim.keymap.set("n", "<leader>dB", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { desc = "Debug toggle breakpoint with condition" })
		end,
	},
}
