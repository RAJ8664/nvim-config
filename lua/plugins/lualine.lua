return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local colors = {
			bg = "#1F1F28",
			fg = "#DCD7BA",
			mauve = "#CBA6F7",
			blue = "#89B4FA",
			sapphire = "#74C7EC",
			grey = "#2A2A37",
			red = "#E46876",
			green = "#98BB6C",
			orange = "#FF9E3B",
			yellow = "#E6C384",
			cyan = "#7AA89F",
		}

		local custom_theme = {
			normal = {
				a = { fg = colors.bg, bg = colors.mauve, gui = "bold" },
				b = { fg = colors.mauve, bg = colors.grey },
				c = { fg = colors.fg, bg = colors.bg },
			},
			insert = { a = { fg = colors.bg, bg = colors.blue, gui = "bold" } },
			visual = { a = { fg = colors.bg, bg = colors.sapphire, gui = "bold" } },
			replace = { a = { fg = colors.bg, bg = colors.red, gui = "bold" } },
			inactive = {
				a = { fg = colors.fg, bg = colors.bg },
				b = { fg = colors.fg, bg = colors.bg },
				c = { fg = colors.fg, bg = colors.bg },
			},
		}

		local function clock()
			return "󱑊 " .. os.date("%H:%M")
		end

		local function os_icon()
			local os_name = vim.loop.os_uname().sysname
			if os_name == "Linux" then
				return "󰣛 Linux"
			elseif os_name == "Darwin" then
				return " macOS"
			elseif os_name == "Windows_NT" then
				return " Windows"
			else
				return os_name
			end
		end

		local devicons = require("nvim-web-devicons")
		local function filetype_icon()
			local filetype = vim.bo.filetype
			local icon = devicons.get_icon_by_filetype(filetype, { default = true })
			return icon
		end

		local function single_lsp_status()
			local clients = vim.lsp.get_active_clients()
			if next(clients) == nil then
				return ""
			end
			return "󰒓 " .. clients[1].name
		end

		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = custom_theme,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				globalstatus = true,
			},
			sections = {
				lualine_a = {
					{ "mode", icon = "󰈸", separator = { left = "" }, right_padding = 2 },
				},
				lualine_b = {
					{ "branch", icon = "󰊢", color = { fg = colors.mauve, gui = "bold" } },
					{
						"diff",
						symbols = { added = "󰐖 ", modified = "󰏫 ", removed = "󰍶 " },
						diff_color = {
							added = { fg = colors.green },
							modified = { fg = colors.orange },
							removed = { fg = colors.red },
						},
					},
					{ filetype_icon, color = { gui = "bold" }, padding = { left = 1, right = 0 } },
					{ "filename", color = { fg = colors.fg, gui = "bold" } },
				},
				lualine_c = {
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = { error = "󰅚 ", warn = "󰀪 ", info = "󰋽 " },
						diagnostics_color = {
							color_error = { fg = colors.red },
							color_warn = { fg = colors.yellow },
							color_info = { fg = colors.cyan },
						},
					},
					{ "%= 󰚀  Host: RkRoy ", color = { fg = colors.orange, gui = "bold" } },
				},
				lualine_x = {
					{ single_lsp_status, color = { fg = colors.green, gui = "bold" } },
					{ "encoding", color = { fg = colors.yellow, gui = "bold" } },
					{ "filetype", color = { fg = colors.mauve } },
				},
				lualine_y = {
					{ "progress", color = { fg = colors.mauve, gui = "bold" } },
				},
				lualine_z = {
					{ clock, color = { gui = "bold" } },
					{ os_icon, color = { gui = "bold" } },
					{ "location", separator = { right = "" }, left_padding = 2 },
				},
			},
		})
	end,
}
