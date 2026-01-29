return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" }, -- Lazy load on file save
	config = function()
		require("conform").setup({
			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 2000,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_format" },
				javascript = { "prettierd", "prettier" },
				typescript = { "prettierd", "prettier" },
				javascriptreact = { "prettierd", "prettier" },
				typescriptreact = { "prettierd", "prettier" },
				html = { "prettierd", "prettier" },
				css = { "prettierd", "prettier" },
				json = { "prettierd", "prettier" },
				yaml = { "prettierd", "prettier" },
				markdown = { "prettier" },
				sh = { "shfmt" },
				go = { "gofmt" },
				rust = { "rustfmt" },
				java = { "astyle" },
				c = { "clang_format" },
				cpp = { "clang_format" },
				sql = { "sql_formatter" }, -- Add SQL formatter
				php = { "phpcbf" },
				rust = { "rustfmt" },
				xml = { "xmlformat" },
			},
			formatters = {
				prettier = {
					prepend_args = {
						"--tab-width=2",
						"--use-tabs=false",
						"--semi=false",
						"--single-quote",
						"--trailing-comma=all",
						"--print-width=100",
					},
				},
				prettierd = {
					prepend_args = {
						"--tab-width=2",
						"--use-tabs=false",
						"--semi=false",
						"--single-quote",
						"--trailing-comma=all",
						"--print-width=100",
					},
				},
				xmlformat = {
					command = "xmlformat",
					args = {},
					stdin = true,
				},
				xmllint = {
					command = "xmllint",
					args = { "--format", "-" },
					stdin = true,
				},
				eclipse_formatter = {
					command = "java",
					args = {
						"-jar",
						vim.fn.expand("~/.local/share/formatters/google-java-format.jar"),
						"--aosp", -- optional: use AOSP style
						"-",
					},
					stdin = true,
				},
				clang_format = {
					command = "clang-format",
					args = { "-style={BasedOnStyle: LLVM, IndentWidth: 4}" },
				},
				astyle = {
					command = "astyle",
					args = {
						"--mode=java", -- language mode
						"--indent=spaces=4", -- 4-space indentation
						"--style=google", -- Java style (you can try other styles like google, kr, linux)
						"--align-pointer=name", -- align pointers with variable names
						"--pad-oper",
						"--pad-comma", -- pad commas with spaces
						"--pad-header", -- pad control statements like `if (...)`
						"--unpad-paren", -- remove unnecessary padding inside parentheses
						"--suffix=none", -- prevent creating backup files like `.orig`
						"--quiet",
						"--break-one-line-headers", -- suppress output
						"--remove-braces",
						"--remove-comment-prefix",
					},
					stdin = true,
				},
			},
		})
		-- Optional: keymap to format manually
		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			require("conform").format({ async = true, lsp_fallback = true })
		end, { desc = "Format file or range" })
	end,
}
