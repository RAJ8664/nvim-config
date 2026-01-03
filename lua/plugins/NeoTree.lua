return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	keys = {
		{ "<C-b>", ":Neotree float reveal<CR>", desc = "NeoTree Float", silent = true },
	},
	config = function(_, opts)
		local mixed_color = "#da70d6"
		local purple = "#bd93f9"
		local bg_dark = "#1e1e2e"
		local hl = vim.api.nvim_set_hl

		hl(0, "NeoTreeMixedBorder", { fg = mixed_color, bold = true })
		hl(0, "NeoTreeFloatTitle", { fg = bg_dark, bg = mixed_color, bold = true })

		hl(0, "NeoTreeTabActive", { fg = mixed_color, bg = bg_dark, bold = true, underline = true })
		hl(0, "NeoTreeTabInactive", { fg = purple, bg = bg_dark })
		hl(0, "NeoTreeTabSeparatorActive", { fg = bg_dark, bg = bg_dark })
		hl(0, "NeoTreeTabSeparatorInactive", { fg = bg_dark, bg = bg_dark })

		hl(0, "NeoTreeMessage", { fg = purple, italic = true })

		require("neo-tree").setup(opts)
	end,
	opts = {
		enable_git_status = true,
		enable_diagnostics = true,
		popup_border_style = {
			{ "╭", "NeoTreeMixedBorder" },
			{ "─", "NeoTreeMixedBorder" },
			{ "╮", "NeoTreeMixedBorder" },
			{ "│", "NeoTreeMixedBorder" },
			{ "╯", "NeoTreeMixedBorder" },
			{ "─", "NeoTreeMixedBorder" },
			{ "╰", "NeoTreeMixedBorder" },
			{ "│", "NeoTreeMixedBorder" },
		},

		source_selector = {
			winbar = true,
			content_layout = "center",
			sources = {
				{ source = "filesystem", display_name = " 󰉓 Files " },
				{ source = "buffers", display_name = " 󰓩 Buffers " },
				{ source = "git_status", display_name = " 󰊢 Git " },
			},
		},

		default_component_configs = {
			indent = {
				with_markers = true,
				indent_marker = "│",
				last_indent_marker = "└",
				indent_size = 2,
			},
			icon = {
				folder_closed = "",
				folder_open = "",
				folder_empty = "󰜌",
			},
		},

		window = {
			position = "float",
			popup = {
				size = { height = "40", width = "80" },
				position = "50%",
			},
			mappings = {
				["<C-b>"] = "close_window",
				["<cr>"] = "open",
				["l"] = "open",
				["h"] = "close_node",
				["P"] = { "toggle_preview", config = { use_float = true } },

				["/"] = "fuzzy_finder",
				["f"] = "filter_on_submit",

				["<Tab>"] = "next_source",
				["<S-Tab>"] = "prev_source",
			},
		},

		filesystem = {
			filtered_items = {
				visible = true,
				hide_dotfiles = false,
				hide_gitignored = false,
			},
			follow_current_file = { enabled = true },
			fuzzy_finder_mappings = {
				["<down>"] = "move_cursor_down",
				["<C-n>"] = "move_cursor_down",
				["<up>"] = "move_cursor_up",
				["<C-p>"] = "move_cursor_up",
			},
		},

		event_handlers = {
			{
				event = "file_opened",
				handler = function()
					require("neo-tree.command").execute({ action = "close" })
				end,
			},
		},
	},
}
