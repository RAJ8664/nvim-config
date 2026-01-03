return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function(_, opts)
		local notify = require("notify")
		notify.setup({
			stages = "fade_in_slide_out",
			timeout = 3000,
			render = "wrapped-compact",
			background_colour = "#000000",
		})

		local purple = "#bd93f9"
		local pink = "#ff79c6"
		local green = "#50fa7b"
		local bg = "#1e1e2e"
		local hl = vim.api.nvim_set_hl

		local function apply_ui_colors()
			hl(0, "NoiceCmdlinePopupBorder", { fg = pink })
			hl(0, "NoiceCmdlinePopupTitle", { fg = bg, bg = purple, bold = true })
			hl(0, "NoiceCmdlineIcon", { fg = pink })
			hl(0, "NoiceCmdlineIconLua", { fg = green })

			hl(0, "NotifyINFOBorder", { fg = purple })
			hl(0, "NotifyINFOTitle", { fg = purple, bold = true })
			hl(0, "NotifyINFOIcon", { fg = purple })

			hl(0, "NotifySUCCESSBorder", { fg = green })
			hl(0, "NotifySUCCESSTitle", { fg = green, bold = true })
			hl(0, "NotifySUCCESSIcon", { fg = green })

			hl(0, "NotifyWARNBorder", { fg = pink })
			hl(0, "NotifyWARNTitle", { fg = pink, bold = true })
			hl(0, "NotifyWARNIcon", { fg = pink })

			hl(0, "NotifyERRORBorder", { fg = "#ff5555" })
			hl(0, "NotifyERRORTitle", { fg = "#ff5555", bold = true })
		end

		apply_ui_colors()

		require("noice").setup(opts)

		vim.defer_fn(apply_ui_colors, 100)
	end,
	opts = {
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		presets = {
			bottom_search = true,
			command_palette = true,
			long_message_to_split = true,
			lsp_doc_border = true,
		},
		views = {
			cmdline_popup = {
				position = { row = 25, col = "50%" },
				size = { width = 50, height = "auto" },
				border = {
					style = "rounded",
					text = { top = " Command " },
				},
			},
		},
	},
}
