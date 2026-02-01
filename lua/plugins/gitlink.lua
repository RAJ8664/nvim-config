return {
	"ruifm/gitlinker.nvim",
	dependencies = "nvim-lua/plenary.nvim",
	config = function()
		require("gitlinker").setup({
			opts = {
				add_current_line_on_normal_mode = true,
				print_url = true,
				action_callback = require("gitlinker.actions").copy_to_clipboard,
			},
			mappings = nil,
		})

		local linker = require("gitlinker")
		local actions = require("gitlinker.actions")

		-- 1. Copy Link (Normal & Visual)
		vim.keymap.set("n", "<leader>gc", function()
			linker.get_buf_range_url("n")
		end, { desc = "Git: Copy link to clipboard" })
		vim.keymap.set("v", "<leader>gc", function()
			linker.get_buf_range_url("v")
		end, { desc = "Git: Copy link to clipboard" })

		-- 2. Open in Browser (Normal & Visual)
		vim.keymap.set("n", "<leader>go", function()
			linker.get_buf_range_url("n", { action_callback = actions.open_in_browser })
		end, { desc = "Git: Open in browser" })

		vim.keymap.set("v", "<leader>go", function()
			linker.get_buf_range_url("v", { action_callback = actions.open_in_browser })
		end, { desc = "Git: Open in browser" })

		-- 3. Repo Homepage
		vim.keymap.set("n", "<leader>gg", function()
			linker.get_repo_url()
		end, { desc = "Git: Copy repo homepage" })
	end,
}
