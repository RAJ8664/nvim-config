return { -- Fuzzy Finder (files, lsp, etc)
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ -- If encountering errors, see telescope-fzf-native README for installation instructions
			"nvim-telescope/telescope-fzf-native.nvim",
			-- `build` is used to run some command when the plugin is installed/updated.
			-- This is only run then, not every time Neovim starts up.
			build = "make",

			-- `cond` is a condition used to determine whether this plugin should be
			-- installed and loaded.
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		-- Useful for getting pretty icons, but requires a Nerd Font.
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = function()
		-- Telescope is a fuzzy finder that comes with a lot of different things that
		-- it can fuzzy find! It's more than just a "file finder", it can search
		-- many different aspects of Neovim, your workspace, LSP, and more!
		--
		-- The easiest way to use Telescope, is to start by doing something like:
		--  :Telescope help_tags
		--
		-- After running this command, a window will open up and you're able to
		-- type in the prompt window. You'll see a list of `help_tags` options and
		-- a corresponding preview of the help.
		--
		-- Two important keymaps to use while in Telescope are:
		--  - Insert mode: <c-/>
		--  - Normal mode: ?
		--
		-- This opens a window that shows you all of the keymaps for the current
		-- Telescope picker. This is really useful to discover what Telescope can
		-- do as well as how to actually do it!

		-- [[ Configure Telescope ]]
		-- See `:help telescope` and `:help telescope.setup()`
		require("telescope").setup({
			--defaults = {
			--layout_strategy = 'horizontal',
			--layout_config = {
			--width = 0.95,
			--height = 0.95,
			--preview_width = 0.70,
			--},
			--},

			-- You can put your default mappings / updates / etc. in here
			--  All the info you're looking for is in `:help telescope.setup()`
			--
			-- defaults = {
			--   mappings = {
			--     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
			--   },
			-- },
			-- pickers = {}
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		-- Enable Telescope extensions if they are installed
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		-- See `:help telescope.builtin`
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "󰋖 search help" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "󰌌 search keymaps" })
		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "󰱼 search files" })
		vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "󰍉 select telescope" })
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "󰈭 search word" })
		vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "󰱽 search by grep" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = " search diagnostics" })
		vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "󰑖 resume search" })
		vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = "󰋚 recent files" })
		vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "󰈔 buffers" })

		vim.keymap.set(
			"n",
			"<leader>pt",
			":Precognition toggle<CR>",
			{ desc = "󰗐 precognition toggle", noremap = true, silent = true }
		)

		-- Slightly advanced example of overriding default behavior and theme
		vim.keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, {
			desc = " fuzzy search (buffer)",
		})

		-- It's also possible to pass additional configuration options.
		--  See `:help telescope.builtin.live_grep()` for information about particular keys

		vim.keymap.set("n", "<leader>s/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, {
			desc = "󰱽 search in open files",
		})

		-- Shortcut for searching your Neovim configuration files
		vim.keymap.set("n", "<leader>sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, {
			desc = " search neovim config",
		})
	end,
}
