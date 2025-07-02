return {
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		init = function()
			vim.g.mkdp_auto_start = 0
			vim.g.mkdp_auto_close = 1
			vim.g.mkdp_refresh_slow = 0
			vim.g.mkdp_command_for_global = 0

			-- ✅ Set custom browser (firefox)
			vim.g.mkdp_browser = "/usr/bin/firefox"

			-- ✅ Set custom port (4040)
			vim.g.mkdp_port = "4040"

			-- Optional: Hide the preview page title and use Markdown file name
			vim.g.mkdp_page_title = "${name}"

			-- Optional: Only preview markdown files in current buffer
			vim.g.mkdp_open_to_the_world = 0
		end,
	},
}
