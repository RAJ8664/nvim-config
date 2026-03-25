return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" }, -- Lazy load on file save
	config = function()
		require("conform").setup({
			format_on_save = function(bufnr)
				-- Disable autoformat on certain filetypes
				local disable_filetypes = { c = true, cpp = true }
				return {
					timeout_ms = 2000,
					lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
				}
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black", "ruff_format" },
				javascript = { "prettier", "prettierd", stop_after_first = true },
				typescript = { "prettier", "prettierd", stop_after_first = true },
				javascriptreact = { "prettier", "prettierd", stop_after_first = true },
				typescriptreact = { "prettier", "prettierd", stop_after_first = true },
				html = { "prettier", "prettierd", stop_after_first = true },
				css = { "prettier", "prettierd", stop_after_first = true },
				json = { "prettier", "prettierd", stop_after_first = true },
				yaml = { "prettier", "prettierd", stop_after_first = true },
				markdown = { "prettier" },
				sh = { "shfmt" },
				go = { "gofmt" },
				rust = { "rustfmt" },
				java = { "astyle" },
				c = { "clang_format" },
				cpp = { "clang_format" },
				sql = { "sql_formatter" },
				php = { "phpcbf" },
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
