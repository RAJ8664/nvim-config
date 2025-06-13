return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {},
		})
		vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", {})
		vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", {})
	end,
}

