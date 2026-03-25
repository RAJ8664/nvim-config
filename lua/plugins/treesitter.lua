return { -- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		-- Setup treesitter
		require("nvim-treesitter").setup({
			-- Directory to install parsers and queries to
			install_dir = vim.fn.stdpath("data") .. "/site",
		})

		-- Install parsers
		local parsers = {
			"bash",
			"c",
			"cpp",
			"diff",
			"html",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"query",
			"vim",
			"vimdoc",
			"java",
			"javascript",
			"typescript",
			"python",
			"json",
			"tsx",
			"css",
			"yaml",
		}

		require("nvim-treesitter").install(parsers)

		-- Configure highlighting and indentation
		vim.treesitter.language.register("markdown", "mdx")
	end,
}
