return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lua",
		"windwp/nvim-autopairs",
		"onsails/lspkind-nvim",
		{ "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
	},
	config = function()
		local cmp = require("cmp")
		local lsp_kind = require("lspkind")
		local cmp_next = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif require("luasnip").expand_or_jumpable() then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
			else
				fallback()
			end
		end
		local cmp_prev = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif require("luasnip").jumpable(-1) then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
			else
				fallback()
			end
		end

		lsp_kind.init()
		---@diagnostic disable-next-line
		cmp.setup({
			enabled = true,
			preselect = cmp.PreselectMode.None,
			formatting = {
				fields = { "kind", "abbr", "menu" }, -- order and fields to show
				format = function(entry, vim_item)
					-- Add nice icons for kind (function, var, etc.)
					local kind_icons = {
						Text = "",
						Method = "",
						Function = "",
						Constructor = "",
						Field = "ﰠ",
						Variable = "",
						Class = "ﴯ",
						Interface = "",
						Module = "",
						Property = "ﰠ",
						Unit = "塞",
						Value = "",
						Enum = "",
						Keyword = "",
						Snippet = "",
						Color = "",
						File = "",
						Reference = "",
						Folder = "",
						EnumMember = "",
						Constant = "",
						Struct = "פּ",
						Event = "",
						Operator = "",
						TypeParameter = "",
					}

					vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind] or "", vim_item.kind)

					-- Show source name in the menu part
					vim_item.menu = ({
						nvim_lsp = "[LSP]",
						buffer = "[Buffer]",
						path = "[Path]",
						luasnip = "[Snippet]",
					})[entry.source.name] or ""

					return vim_item
				end,
			},
			window = {
				completion = cmp.config.window.bordered({
					winhighlight = "Normal:Normal,FloatBorder:LspBorderBG,CursorLine:PmenuSel,Search:None",
				}),
				documentation = cmp.config.window.bordered({
					winhighlight = "Normal:Normal,FloatBorder:LspBorderBG,CursorLine:PmenuSel,Search:None",
				}),
			},
			---@diagnostic disable-next-line
			view = {
				entries = "bordered",
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = {
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<S-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.close(),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
				["<tab>"] = cmp_next,
				["<down>"] = cmp_next,
				["<C-p>"] = cmp_prev,
				["<up>"] = cmp_prev,
			},
			sources = {
				{ name = "nvim_lsp_signature_help", group_index = 1 },
				{ name = "luasnip", max_item_count = 5, group_index = 1 },
				{ name = "nvim_lsp", max_item_count = 20, group_index = 1 },
				{ name = "nvim_lua", group_index = 1 },
				{ name = "vim-dadbod-completion", group_index = 1 },
				{ name = "path", group_index = 2 },
				{ name = "buffer", keyword_length = 2, max_item_count = 5, group_index = 2 },
			},
		})
		local presentAutopairs, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
		if not presentAutopairs then
			return
		end
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
	end,
}
