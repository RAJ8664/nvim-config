return {

	{
		"VidocqH/lsp-lens.nvim",
		event = "LspAttach",
		opts = {},
	},
	{
		"oribarilan/lensline.nvim",
		tag = "1.0.0", -- or: branch = 'release/1.x' for latest non-breaking updates
		event = "LspAttach",
		config = function()
			require("lensline").setup()
		end,
	},
}
