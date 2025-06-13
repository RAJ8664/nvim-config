return {
	"nvimtools/none-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local null_ls_status_ok, null_ls = pcall(require, "null-ls")
		if not null_ls_status_ok then
			return
		end

		local formatting = null_ls.builtins.formatting
		-- local diagnostics = null_ls.builtins.diagnostics -- Uncomment if you need diagnostics
		null_ls.setup({
			debug = false,
			sources = {
				formatting.prettier.with({
					extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
				}),
				formatting.black.with({ extra_args = { "--fast" } }),
				formatting.stylua,
				-- diagnostics.flake8, -- Uncomment to enable
			},
		})
	end,
}
