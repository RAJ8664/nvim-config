return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local colors = require("tokyonight.colors").setup()
		local tokyonight = require("tokyonight.colors").setup({ style = "moon" })

		local custom_tn_theme = {
			normal = {
				a = { fg = tokyonight.bg, bg = tokyonight.blue, gui = "bold" },
				b = { fg = tokyonight.fg, bg = tokyonight.bg_highlight },
				c = { fg = tokyonight.fg, bg = tokyonight.bg },
			},
			inactive = {
				a = { fg = tokyonight.bg, bg = tokyonight.blue, gui = "bold" },
				b = { fg = tokyonight.fg, bg = tokyonight.bg_highlight },
				c = { fg = tokyonight.fg, bg = tokyonight.bg },
			},
		}

		local function clock()
			return os.date(" %H:%M")
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
				return "" -- no LSP client attached
			end
			-- return the name of the first client
			return " " .. clients[1].name
		end

		require("lualine").setup({
			options = {
				icons_enable = true,
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				theme = custom_tn_theme,
				globalstatus = true,
			},
			sections = {
				lualine_a = {
					{
						"mode",
						icon = " ",
						color = { gui = "bold" },
						separator = { left = "" },
						right_padding = 1,
					},
				},
				lualine_b = {
					{
						"branch",
						icon = "",
						color = { fg = colors.fg, bg = colors.bg, gui = "bold" },
					},
					{
						"diff",
						symbols = { added = " ", modified = " ", removed = " " },
						diff_color = {
							added = { fg = colors.green },
							modified = { fg = colors.orange },
							removed = { fg = colors.red },
						},
						-- cond = conditions.hide_in_width,
					},
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = { error = " ", warn = " ", info = " " },
						diagnostics_color = {
							color_error = { fg = colors.red },
							color_warn = { fg = colors.yellow },
							color_info = { fg = colors.cyan },
						},
					},
					{ filetype_icon, color = { gui = "bold" } },
					{ "filename", color = { fg = colors.orange, gui = "bold" } },
				},
				lualine_c = { { "%=  Host : RkRoy  ", color = { fg = colors.red, gui = "bold" } } },
				lualine_x = { "encoding", "fileformat", "filetype", single_lsp_status },
				lualine_y = { "progress" },
				lualine_z = {
					{ clock, color = { gui = "bold" } },
					{ os_icon, color = { gui = "bold" } },
					{
						"location",
						color = { fg = colors.black, gui = "bold" },
						separator = { right = "" },
						left_padding = 1,
					},
					right_circle,
				},
			},

			-- for inactive buffer
			inactive_sections = {
				lualine_a = {
					{
						"mode",
						icon = " ",
						color = { gui = "bold" },
						separator = { left = "" },
						right_padding = 1,
					},
				},
				lualine_b = {
					{
						"branch",
						icon = "",
						color = { fg = colors.fg, bg = colors.bg, gui = "bold" },
					},
					{
						"diff",
						symbols = { added = " ", modified = " ", removed = " " },
						diff_color = {
							added = { fg = colors.green },
							modified = { fg = colors.orange },
							removed = { fg = colors.red },
						},
						-- cond = conditions.hide_in_width,
					},
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = { error = " ", warn = " ", info = " " },
						diagnostics_color = {
							color_error = { fg = colors.red },
							color_warn = { fg = colors.yellow },
							color_info = { fg = colors.cyan },
						},
					},
					{ filetype_icon, color = { gui = "bold" } },
					{ "filename" },
				},
				lualine_c = { { "%=  Host : RkRoy  ", color = { fg = colors.red, gui = "bold" } } },
				lualine_x = { "encoding", "fileformat", "filetype", single_lsp_status },
				lualine_y = { "progress" },
				lualine_z = {
					{ clock, color = { gui = "bold" } },
					{ os_icon, color = { gui = "bold" } },
					{
						"location",
						color = { gui = "bold" },
						separator = { right = "" },
						left_padding = 1,
					},
					right_circle,
				},
			},
		})
	end,
}
