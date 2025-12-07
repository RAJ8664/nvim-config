return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = " " },
				change = { text = " " },
				delete = { text = " " },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "<leader>g]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "<leader>g]c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end, { desc = "󰅁 next git change" })

				map("n", "<leader>g[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "<leader>g[c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end, { desc = "󰅂 previous git change" })

				-- Actions
				-- visual mode
				map("v", "<leader>gss", function()
					gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = " stage hunk" })

				map("v", "<leader>grr", function()
					gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "󰍉 reset hunk" })

				-- normal mode
				map("n", "<leader>gs", gitsigns.stage_hunk, { desc = " stage hunk" })
				map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "󰍉 reset hunk" })

				map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "󰈙 stage buffer" })
				map("n", "<leader>gu", gitsigns.undo_stage_hunk, { desc = " undo stage hunk" })

				map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "󰁯 reset buffer" })
				map("n", "<leader>gp", gitsigns.preview_hunk, { desc = " preview hunk" })
				map("n", "<leader>gb", gitsigns.blame_line, { desc = "󰊢 blame line" })

				map("n", "<leader>gd", gitsigns.diffthis, { desc = " diff against index" })

				map("n", "<leader>gD", function()
					gitsigns.diffthis("@")
				end, { desc = "󰜘 diff against last commit" })

				-- Toggles

				map("n", "<leader>gt", gitsigns.toggle_current_line_blame, { desc = "󱂈 toggle blame line" })

				map("n", "<leader>gD", gitsigns.preview_hunk_inline, { desc = "󰮘 show deleted inline" })
			end,
		},
	},
}
