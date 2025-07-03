return {
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		name = "kanagawa-wave",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("kanagawa-wave")
		end,
	},
	{
		"folke/tokyonight.nvim",
		opts = {
			transparent = false,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
			on_highlights = function(hl, c)
				local prompt = "#292e42"
				hl.FloatBorder = { fg = prompt }
				hl.TelescopeNormal = { fg = c.fg_dark }
				hl.TelescopeBorder = { fg = prompt }
				hl.TelescopePromptBorder = { fg = prompt }
				hl.TelescopeResultsBorder = { fg = prompt }
				hl.TelescopePromptTitle = { fg = c.fg_dark }
				hl.TelescopeResultsTitle = { fg = c.fg_dark }
			end,
		},
	},
	{ "EdenEast/nightfox.nvim" },
	{ "morhetz/gruvbox" },
	{ "rose-pine/neovim" },
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
	},
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
}
