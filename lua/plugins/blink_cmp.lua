return {
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"moyiz/blink-emoji.nvim",
			"huijiro/blink-cmp-supermaven",
			"https://github.com/xzbdmw/colorful-menu.nvim",
			"onsails/lspkind.nvim",
		},
		version = "1.*",

		-- Custom highlight groups for colorful appearance
		config = function(_, opts)
			require("blink.cmp").setup(opts)

			-- Set up beautiful transparent and colorful highlights
			vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = "NONE", blend = 20 })
			vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = "#7aa2f7", bg = "NONE" })
			vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { bg = "#2d3149", fg = "NONE", blend = 30 })

			-- Colorful kind icons
			vim.api.nvim_set_hl(0, "BlinkCmpKindText", { fg = "#c0caf5" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindMethod", { fg = "#bb9af7" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindFunction", { fg = "#7dcfff" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindConstructor", { fg = "#ff9e64" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindField", { fg = "#7aa2f7" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindVariable", { fg = "#9d7cd8" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindClass", { fg = "#e0af68" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindInterface", { fg = "#73daca" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindModule", { fg = "#89ddff" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindProperty", { fg = "#7aa2f7" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindUnit", { fg = "#b4f9f8" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindValue", { fg = "#ff9e64" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindEnum", { fg = "#bb9af7" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindKeyword", { fg = "#f7768e" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindSnippet", { fg = "#9ece6a" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindColor", { fg = "#db4b4b" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindFile", { fg = "#c0caf5" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindReference", { fg = "#2ac3de" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindFolder", { fg = "#7aa2f7" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindEnumMember", { fg = "#73daca" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindConstant", { fg = "#ff9e64" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindStruct", { fg = "#e0af68" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindEvent", { fg = "#f7768e" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindOperator", { fg = "#89ddff" })
			vim.api.nvim_set_hl(0, "BlinkCmpKindTypeParameter", { fg = "#2ac3de" })

			-- Label colors
			vim.api.nvim_set_hl(0, "BlinkCmpLabel", { fg = "#c0caf5" })
			vim.api.nvim_set_hl(0, "BlinkCmpLabelMatch", { fg = "#f7768e", bold = true })
			vim.api.nvim_set_hl(0, "BlinkCmpLabelDescription", { fg = "#565f89", italic = true })

			-- Documentation window
			vim.api.nvim_set_hl(0, "BlinkCmpDoc", { bg = "NONE", blend = 20 })
			vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg = "#bb9af7", bg = "NONE" })
			vim.api.nvim_set_hl(0, "BlinkCmpDocCursorLine", { bg = "#2d3149", blend = 30 })

			-- Signature help
			vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelp", { bg = "NONE", blend = 20 })
			vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelpBorder", { fg = "#9ece6a", bg = "NONE" })
		end,

		opts = {
			keymap = {
				preset = "default",
				["<C-x>"] = { "hide", "fallback" },
				["<CR>"] = { "accept", "fallback" },
				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			},

			appearance = {
				nerd_font_variant = "mono",
				kind_icons = {
					Text = "󰉿",
					Method = "󰆧",
					Function = "󰊕",
					Constructor = "",
					Field = "󰜢",
					Variable = "󰀫",
					Class = "󰠱",
					Interface = "",
					Module = "",
					Property = "󰜢",
					Unit = "󰑭",
					Value = "󰎠",
					Enum = "",
					Keyword = "󰌋",
					Snippet = "",
					Color = "󰏘",
					File = "󰈙",
					Reference = "󰈇",
					Folder = "󰉋",
					EnumMember = "",
					Constant = "󰏿",
					Struct = "󰙅",
					Event = "",
					Operator = "󰆕",
					TypeParameter = "",
				},
			},

			completion = {
				accept = {
					auto_brackets = {
						enabled = true,
					},
				},
				menu = {
					draw = {
						columns = {
							{ "kind_icon", gap = 1 },
							{ "label", "label_description", gap = 1 },
							{ "kind", gap = 1 },
						},
						components = {
							label = {
								width = { fill = true, max = 60 },
								text = function(ctx)
									local highlights_info = require("colorful-menu").blink_highlights(ctx)
									if highlights_info ~= nil then
										return highlights_info.label
									else
										return ctx.label
									end
								end,
								highlight = function(ctx)
									local highlights = {}
									local highlights_info = require("colorful-menu").blink_highlights(ctx)
									if highlights_info ~= nil then
										highlights = highlights_info.highlights
									end
									for _, idx in ipairs(ctx.label_matched_indices) do
										table.insert(highlights, { idx, idx + 1, group = "BlinkCmpLabelMatch" })
									end
									return highlights
								end,
							},
							label_description = {
								width = { max = 30 },
								text = function(ctx)
									return ctx.label_description
								end,
								highlight = "BlinkCmpLabelDescription",
							},
							kind_icon = {
								text = function(ctx)
									return ctx.kind_icon .. " "
								end,
								highlight = function(ctx)
									return "BlinkCmpKind" .. ctx.kind
								end,
							},
							kind = {
								text = function(ctx)
									return ctx.kind
								end,
								highlight = function(ctx)
									return "BlinkCmpKind" .. ctx.kind
								end,
							},
						},
					},
					border = "rounded",
					winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
					max_height = 20,
				},
				ghost_text = {
					enabled = true,
					highlight = "Comment",
				},
				documentation = {
					window = {
						border = "rounded",
						winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
					},
					auto_show = true,
					auto_show_delay = 350,
				},
			},

			signature = {
				enabled = true,
				auto_show = true,
				auto_show_delay = 500,
				window = {
					border = "rounded",
					winhighlight = "Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelpBorder",
				},
			},

			sources = {
				default = { "lsp", "path", "snippets", "buffer", "emoji", "supermaven" },
				providers = {
					lsp = {
						name = "LSP",
						module = "blink.cmp.sources.lsp",
						score_offset = 100, -- Prioritize LSP
						-- Only show the most relevant items
						max_items = 30,
					},
					path = {
						name = "Path",
						module = "blink.cmp.sources.path",
						score_offset = 3,
						opts = {
							trailing_slash = true,
							label_trailing_slash = true,
							get_cwd = function(context)
								return vim.fn.expand("#" .. context.bufnr .. ":p:h")
							end,
							show_hidden_files_by_default = false,
						},
					},
					snippets = {
						name = "Snippets",
						module = "blink.cmp.sources.snippets",
						score_offset = 80,
						max_items = 10,
					},
					buffer = {
						name = "Buffer",
						module = "blink.cmp.sources.buffer",
						max_items = 10,
						min_keyword_length = 3, -- Don't show buffer completions for short words
						score_offset = -3,
					},
					emoji = {
						module = "blink-emoji",
						name = "Emoji",
						score_offset = 15,
						opts = {
							insert = true,
							trigger = function()
								return { ":" }
							end,
						},
						should_show_items = function()
							return vim.tbl_contains({ "gitcommit", "markdown", "text" }, vim.o.filetype)
						end,
					},
					supermaven = {
						name = "supermaven",
						module = "blink-cmp-supermaven",
						score_offset = 90,
						async = true,
					},
				},
			},

			fuzzy = {
				implementation = "prefer_rust_with_warning",
				-- Better fuzzy matching
				prebuilt_binaries = {
					download = true,
					force_version = nil,
				},
			},
		},
		opts_extend = { "sources.default" },
	},
}
