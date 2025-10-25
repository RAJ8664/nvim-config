require("core.keymaps")
require("core.options")

vim.opt.list = false
vim.opt.signcolumn = "yes"

vim.cmd([[
  highlight! DiagnosticLineNrError guifg=#ff0000 gui=bold
  highlight! DiagnosticLineNrWarn guifg=#ffaa00 gui=bold
  highlight! DiagnosticLineNrInfo guifg=#00aaff gui=bold
  highlight! DiagnosticLineNrHint guifg=#00ff00 gui=bold
]])

for type, hl in pairs({
	Error = "DiagnosticLineNrError",
	Warn = "DiagnosticLineNrWarn",
	Info = "DiagnosticLineNrInfo",
	Hint = "DiagnosticLineNrHint",
}) do
	local sign = "DiagnosticSign" .. type
	vim.fn.sign_define(sign, { numhl = hl })
end

-- plugin manager for Neovim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	require("plugins.NeoTree"),
	require("plugins.auto_pairs"),
	-- require("plugins.Bufferline"),
	require("plugins.git_signs"),
	require("plugins.which_key"),
	require("plugins.my_terminal"),
	require("plugins.lualine"),
	require("plugins.color_scheme"),
	require("plugins.noise"),
	require("plugins.debugger"),
	require("plugins.linters"),
	require("plugins.telescope"),
	require("plugins.auto_format"),
	require("plugins.mason"),
	require("plugins.null_ls"),
	require("plugins.treesitter"),
	require("plugins.auto_completion"),
	require("plugins.small_minor_plg"),
	require("plugins.auto_session"),
	require("plugins.better_esc"),
	require("plugins.flash"),
	require("plugins.leetcode"),
	require("plugins.my_copilot"),
	require("plugins.colorizer"),
	require("plugins.nvim_jdtls"),
	require("plugins.lsp_config"),
	require("plugins.comment_box"),
	require("plugins.code_companion"),
	--	require("plugins.github_copilot"),
	require("plugins.avante_ai"),
	require("plugins.blink_cmp"),
	--require("plugins.image"),
	require("plugins.folding"),
	require("plugins.markdown"),
	-- require("plugins.smoothScroll"),
	require("plugins.MenuUI"),
	require("plugins.typing"),
	-- require("plugins.dropBar"),
	require("plugins.Gemini-Cli"),
	-- require("plugins.dashboard"),
	require("plugins.minty"),
	require("plugins.bg"),
	require("plugins.vimtex"),
	-- require("plugins.indent_line"),
	require("plugins.wakatime"),
	require("plugins.zoxide"),
	require("plugins.spotify"),
	-- require("plugins.lsp_lens"),
	require("plugins.ThemeHub"),
	require("plugins.topbar"),

	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})
