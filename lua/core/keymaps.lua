-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = true }

--save files;
vim.keymap.set("n", "<C-s>", "<cmd> w <CR>", opts)

--undo
vim.keymap.set("i", "<C-z>", "<C-o>u", { noremap = true, silent = true })

--select all in normal mode;
vim.keymap.set("n", "<C-a>", "gg<S-v>G", { noremap = true, silent = true })

--save files without auto formatting;
vim.keymap.set("n", "<leader>sn", "<cmd>noautocmd w<CR>", opts)

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
-- Clear highlights on search when pressing <Esc> in normal mode
-- See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
-- :Use CTRL+<hjkl> to switch between windows
-- See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

--my cpp related stuffs;
--used to replace the copied test case to input.txt;
vim.keymap.set("n", "<leader>jc", function()
	local file_dir = vim.fn.expand("%:p:h")
	local script = file_dir .. "/input.sh"
	vim.cmd("terminal bash " .. script)
	vim.cmd("bd")
end)

--to run the java code and display the output along with dbg file;
vim.keymap.set("n", "<leader>jr", function()
	local file_dir = vim.fn.expand("%:p:h")
	local script = file_dir .. "/run_java.sh"
	vim.cmd("terminal bash " .. script)
end)

--to run the cpp code and display the output along with dbg file;
vim.keymap.set("n", "<leader>jf", function()
	local file_dir = vim.fn.expand("%:p:h")
	local script = file_dir .. "/run_cpp.sh"
	vim.cmd("terminal bash " .. script)
end)
