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
			defaults = {
				prompt_prefix = "   ",
				selection_caret = " ❯ ",
				entry_prefix = "   ",
				initial_mode = "insert",
				selection_strategy = "reset",
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						width = 0.9,
						height = 0.8,
						preview_width = 0.6,
					},
				},
				borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },

				path_display = { "tail" },
				get_status_text = function()
					return ""
				end,
			},
			pickers = {
				buffers = {
					show_all_buffers = true,
					sort_lastused = true,
					entry_maker = function(entry)
						local make_entry = require("telescope.make_entry")
						local displayer = require("telescope.pickers.entry_display").create({
							separator = " ",
							items = {
								{ width = 2 },
								{ remaining = true },
							},
						})

						local original_entry = make_entry.gen_from_buffer({})(entry)
						original_entry.display = function(ent)
							local icon, icon_hl = require("nvim-web-devicons").get_icon(
								ent.filename,
								string.match(ent.filename, "%a+$"),
								{ default = true }
							)
							return displayer({
								{ icon, icon_hl },
								{ ent.filename, "TelescopeFileName" },
							})
						end
						return original_entry
					end,
				},
				oldfiles = {
					path_display = { "tail" },
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		local purple = "#bd93f9"
		local bg_dark = "#1e1e2e"
		local selection_bg = "#3d375e"
		local pink = "#ff79c6"
		local green = "#50fa7b"

		local hl = vim.api.nvim_set_hl

		hl(0, "TelescopeBorder", { fg = pink })
		hl(0, "TelescopePromptBorder", { fg = pink })
		hl(0, "TelescopeResultsBorder", { fg = pink })
		hl(0, "TelescopePreviewBorder", { fg = pink })

		hl(0, "TelescopePromptTitle", { fg = bg_dark, bg = purple, bold = true })
		hl(0, "TelescopeResultsTitle", { fg = bg_dark, bg = pink, bold = true }) -- Pink for Results
		hl(0, "TelescopePreviewTitle", { fg = bg_dark, bg = green, bold = true }) -- Green for Preview

		hl(0, "TelescopeSelection", { bg = selection_bg, fg = "#ffffff", bold = true })
		hl(0, "TelescopeMatching", { fg = pink, bold = true })
		hl(0, "TelescopePromptPrefix", { fg = purple })
		hl(0, "TelescopeFileName", { fg = "#ffffff" })

		hl(0, "TelescopeResultsNumber", { fg = bg_dark })
		hl(0, "TelescopeResultsSpecialComment", { fg = bg_dark })

		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

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
