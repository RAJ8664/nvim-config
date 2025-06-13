return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		adapter = "gemini",
		model = "models/gemini-2.0-flash", -- or "models/gemini-1.5-pro" if you prefer
		display_mode = "split", -- or "popup" or "float"
		mappings = {
			chat = {
				submit = "<C-s>", -- change as needed
				close = "q",
			},
		},
		system_prompt = "You are a helpful coding assistant.",
		token = "",
		url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent",
	},
	cmd = { "CodeCompanionChat", "CodeCompanion" },
}
