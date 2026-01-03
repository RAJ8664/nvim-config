return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			local purple = "#bd93f9"
			local pink = "#ff79c6"

			vim.api.nvim_set_hl(0, "MultiTermBorder", { fg = pink })

			require("toggleterm").setup({
				size = 40,
				open_mapping = [[<c-\>]],
				hide_numbers = true,
				direction = "float",
				float_opts = {
					border = "curved",
					winhighlight = "FloatBorder:MultiTermBorder",
				},
			})

			local Terminal = require("toggleterm.terminal").Terminal
			local terminals = {}

			local function toggle_named_term(name)
				if not terminals[name] then
					terminals[name] = Terminal:new({
						name = "Terminal " .. name,
						direction = "float",
						float_opts = {
							border = {
								{ "╭", "MultiTermBorder" },
								{ "─", "MultiTermBorder" },
								{ "╮", "MultiTermBorder" },
								{ "│", "MultiTermBorder" },
								{ "╯", "MultiTermBorder" },
								{ "─", "MultiTermBorder" },
								{ "╰", "MultiTermBorder" },
								{ "│", "MultiTermBorder" },
							},
							winblend = 0,
						},
						on_open = function(term)
							vim.cmd("startinsert!")
							vim.api.nvim_buf_set_keymap(
								term.bufnr,
								"t",
								"<Esc>",
								[[<C-\><C-n>]],
								{ noremap = true, silent = true }
							)
						end,
					})
				end
				terminals[name]:toggle()
			end

			for i = 1, 9 do
				local key = string.format("<A-%d>", i)
				local term_name = tostring(i)
				vim.keymap.set("n", key, function()
					toggle_named_term(term_name)
				end, { silent = true })
				vim.keymap.set("t", key, function()
					toggle_named_term(term_name)
				end, { silent = true })
			end
		end,
	},
}
