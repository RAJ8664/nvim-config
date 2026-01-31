return {
	"davidmh/mdx.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		vim.filetype.add({
			extension = {
				mdx = "mdx",
			},
		})
	end,
}
