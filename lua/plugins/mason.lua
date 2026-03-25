return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					-- LSP servers
					"lua_ls",
					"ts_ls",
					"eslint",
					"html",
					"tailwindcss",
					"clangd",
					"jdtls",
					"angularls",
					"marksman",
					"phpactor",
					"graphql",
					"sqls",
					"mdx_analyzer",

					-- Formatters
					"stylua",
					"prettier",
					"prettierd",
					"black",
					"shfmt",
					"clang-format",
					"astyle",
					"sql-formatter",

					-- Linters
					"ruff",
					"biome",
				},
				auto_update = false,
				run_on_start = true,
			})
		end,
	},
}
