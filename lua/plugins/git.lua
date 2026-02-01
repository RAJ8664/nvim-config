return {
	{
		"SuperBo/fugit2.nvim",
		build = false,
		opts = {
			width = 100,
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
			"nvim-lua/plenary.nvim",
			{
				"chrisgrieser/nvim-tinygit",
				dependencies = { "stevearc/dressing.nvim" },
			},
		},
		cmd = { "Fugit2", "Fugit2Diff", "Fugit2Graph" },
		keys = {
			{ "<leader>F", mode = "n", "<cmd>Fugit2<cr>", desc = "Git UI (Fugit2)" },
		},
	},

	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = " " },
				change = { text = " " },
				delete = { text = " " },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "<leader>g]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "<leader>g]c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end, { desc = "󰅁 next git change" })

				map("n", "<leader>g[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "<leader>g[c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end, { desc = "󰅂 previous git change" })

				-- Actions
				-- visual mode
				map("v", "<leader>gss", function()
					gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = " stage hunk" })

				map("v", "<leader>grr", function()
					gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "󰍉 reset hunk" })

				-- normal mode
				map("n", "<leader>gs", gitsigns.stage_hunk, { desc = " stage hunk" })
				map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "󰍉 reset hunk" })

				map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "󰈙 stage buffer" })
				map("n", "<leader>gu", gitsigns.undo_stage_hunk, { desc = " undo stage hunk" })

				map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "󰁯 reset buffer" })
				map("n", "<leader>gp", gitsigns.preview_hunk, { desc = " preview hunk" })
				map("n", "<leader>gb", gitsigns.blame_line, { desc = "󰊢 blame line" })

				map("n", "<leader>gd", gitsigns.diffthis, { desc = " diff against index" })

				map("n", "<leader>gD", function()
					gitsigns.diffthis("@")
				end, { desc = "󰜘 diff against last commit" })

				-- Toggles

				map("n", "<leader>gt", gitsigns.toggle_current_line_blame, { desc = "󱂈 toggle blame line" })

				map("n", "<leader>gD", gitsigns.preview_hunk_inline, { desc = "󰮘 show deleted inline" })
			end,
		},
	},

	{
		"ruifm/gitlinker.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("gitlinker").setup({
				opts = {
					add_current_line_on_normal_mode = true,
					print_url = true,
					action_callback = require("gitlinker.actions").copy_to_clipboard,
				},
				mappings = nil,
			})

			local linker = require("gitlinker")
			local actions = require("gitlinker.actions")

			-- 1. Copy Link (Normal & Visual)
			vim.keymap.set("n", "<leader>gc", function()
				linker.get_buf_range_url("n")
			end, { desc = "Git: Copy link to clipboard" })
			vim.keymap.set("v", "<leader>gc", function()
				linker.get_buf_range_url("v")
			end, { desc = "Git: Copy link to clipboard" })

			-- 2. Open in Browser (Normal & Visual)
			vim.keymap.set("n", "<leader>go", function()
				linker.get_buf_range_url("n", { action_callback = actions.open_in_browser })
			end, { desc = "Git: Open in browser" })

			vim.keymap.set("v", "<leader>go", function()
				linker.get_buf_range_url("v", { action_callback = actions.open_in_browser })
			end, { desc = "Git: Open in browser" })

			-- 3. Repo Homepage
			vim.keymap.set("n", "<leader>gg", function()
				linker.get_repo_url()
			end, { desc = "Git: Copy repo homepage" })
		end,
	},

	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim", -- For the telescope extension
		},
		keys = {
			-- The most common trigger
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit (Root Dir)" },
			-- Useful for working on submodules or nested repos
			{ "<leader>lf", "<cmd>LazyGitCurrentFile<cr>", desc = "LazyGit (Current File)" },
			-- Git history/commits
			{ "<leader>ll", "<cmd>LazyGitFilter<cr>", desc = "LazyGit Commits" },
		},
		config = function()
			-- 1. Configuration variables
			vim.g.lazygit_floating_window_winblend = 0 -- 0 to 100 for transparency
			vim.g.lazygit_floating_window_scaling_factor = 0.85
			vim.g.lazygit_floating_window_border_chars = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
			vim.g.lazygit_use_neovim_remote = 1 -- Better integration if nvr is installed

			-- 2. Load Telescope Extension
			-- This allows you to search through your git repositories
			local ok, telescope = pcall(require, "telescope")
			if ok then
				telescope.load_extension("lazygit")
			end

			-- 3. Automatically track project roots for Telescope
			-- This ensures any git repo you visit shows up in the Telescope switcher
			vim.api.nvim_create_autocmd("BufEnter", {
				callback = function()
					require("lazygit.utils").project_root_dir()
				end,
			})
		end,
	},
}
