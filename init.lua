require("core.keymaps")
require("core.options")

vim.opt.list = false
vim.opt.signcolumn = "yes"
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
	require("plugins.which_key"),
	require("plugins.my_terminal"),
	require("plugins.lualine"),
	require("plugins.color_scheme"),
	require("plugins.noise"),
	-- require("plugins.debugger"),
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
	-- require("plugins.avante_ai"),
	require("plugins.blink_cmp"),
	--require("plugins.image"),
	require("plugins.folding"),
	require("plugins.markdown"),
	-- require("plugins.smoothScroll"),
	require("plugins.MenuUI"),
	require("plugins.typing"),
	-- require("plugins.dropBar"),
	-- require("plugins.Gemini-Cli"),
	-- require("plugins.dashboard"),
	require("plugins.minty"),
	require("plugins.bg"),
	require("plugins.vimtex"),
	-- require("plugins.indent_line"),
	-- require("plugins.wakatime"),
	require("plugins.zoxide"),
	require("plugins.spotify"),
	-- require("plugins.lsp_lens"),
	require("plugins.ThemeHub"),
	-- require("plugins.topbar"),
	require("plugins.todo_comments"),
	require("plugins.mdx"),
	require("plugins.inline"),
	require("plugins.git"),
	require("plugins.chatbot"),
	require("plugins.rovo-dev"),
	-- require("plugins.smooth_scroll"),
	require("plugins.namu"),

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

local function set_tmux_bg(color)
	if os.getenv("TMUX") then
		os.execute("tmux set-option status-style bg='" .. color .. "'")
	end
end

local tmux_group = vim.api.nvim_create_augroup("TmuxSync", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter", "FocusGained", "TermResponse" }, {
	group = tmux_group,
	callback = function()
		set_tmux_bg("#1E1E27")
	end,
})

vim.api.nvim_create_autocmd({ "VimLeave", "FocusLost" }, {
	group = tmux_group,
	callback = function()
		set_tmux_bg("default")
	end,
})
