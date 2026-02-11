return {
	"supermaven-inc/supermaven-nvim",
	config = function()
		local sm = require("supermaven-nvim")
		local api = require("supermaven-nvim.api")
		sm.setup({
			keymaps = {
				accept_suggestion = "<Tab>",
				clear_suggestion = "<C-x>",
			},
			delay = 1500,
		})
		local is_enabled = true
		vim.keymap.set("n", "<leader>st", function()
			if is_enabled then
				api.stop()
				print("Supermaven Stopped")
			else
				api.start()
				print("Supermaven Started")
			end
			is_enabled = not is_enabled
		end, { desc = "Toggle Supermaven AI" })
	end,
}
