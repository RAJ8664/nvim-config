return {
	{
		"Bekaboo/dropbar.nvim",
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		config = function()
			local dropbar_api = require("dropbar.api")

			vim.keymap.set("n", "<Leader>;", dropbar_api.pick, {
				desc = "󰙅 pick symbols (winbar)",
			})

			vim.keymap.set("n", "[;", dropbar_api.goto_context_start, {
				desc = " go to context start",
			})

			vim.keymap.set("n", "];", dropbar_api.select_next_context, {
				desc = " next context",
			})
		end,
	},
}
