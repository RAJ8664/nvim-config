return {
	{
		"nanozuki/tabby.nvim",
		config = function()
			vim.o.showtabline = 2 -- Always show tabline
			require("tabby").setup({})
		end,
	},
}
