return {
	{
		dir = "/home/rkroy/Desktop/code/chatbot.nvim",
		cmd = { "ChatbotOpen", "ChatbotToggle", "ChatbotGenerate" },
		config = function()
			require("chatbot").setup()
		end,
	},
}
