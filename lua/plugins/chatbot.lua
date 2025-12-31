return {
	{
		dir = "/home/rkroy/Desktop/code/chatbot.nvim",
		cmd = { "ChatbotOpen", "ChatbotToggle" },
		config = function()
			require("chatbot").setup()
		end,
	},
}
