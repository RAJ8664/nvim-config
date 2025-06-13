return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      -- ToggleTerm global config
      size = 40,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      direction = "float", -- default direction (will override per terminal later)
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)

      -- Create and manage multiple float terminals using Alt+1 to Alt+9
      local Terminal = require("toggleterm.terminal").Terminal
      local terminals = {}

      local function toggle_named_term(name)
        if not terminals[name] then
          terminals[name] = Terminal:new({
            name = name,
            direction = "float",
            hidden = true,
            on_open = function(term)
              vim.cmd("startinsert!")
            end,
          })
        end
        terminals[name]:toggle()
      end

      -- Set mappings for Alt+1 to Alt+9 in normal and terminal mode
      for i = 1, 9 do
        local key = string.format("<A-%d>", i)
        local term_name = tostring(i)

        vim.keymap.set("n", key, function()
          toggle_named_term(term_name)
        end, { noremap = true, silent = true, desc = "Toggle float terminal " .. i })

        vim.keymap.set("t", key, function()
          toggle_named_term(term_name)
        end, { noremap = true, silent = true, desc = "Toggle float terminal " .. i })
      end
    end,
  },
}
