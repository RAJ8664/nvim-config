return {
	{
		"atlassian-labs/rovo-dev.nvim",
		opts = {
			terminal = {
				cmd = { "acli", "rovodev", "run" },
				side = "right",
				width = 0.33, -- ratio of total columns when 0<width<1, else fixed cols
			},
			file_refresh = {
				enable = true,
				refresh_on_terminal_output = true,
				refresh_debounce_ms = 200,
			},
			keymaps = {
				toggle = {
					normal = "<C-,>",
					terminal = "<C-,>",
				},
				run = {
					restore = "<leader>rR",
					verbose = "<leader>rV",
					shadow = "<leader>rS",
					yolo = "<leader>rY",
				},
			},
			window = { number = false, signcolumn = "no", winfixwidth = true },
		},
	},
}
