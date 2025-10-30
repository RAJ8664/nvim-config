<div align="center">

# 👨‍💻 My Personal Code Engine

</div>

## 🌟 Features

- **🚀 Fast & Lightweight**: Optimized for speed with lazy-loading plugins via `lazy.nvim`.
- **💡 Smart Completion**: Advanced code completion with `nvim-cmp`, powered by multiple sources.
- **💻 Integrated Tooling**: Built-in LSP, linting, formatting, and debugging support.
- **🎨 Beautiful UI**: A clean and modern aesthetic with a custom color scheme, file icons, and status line.
- **🧩 Rich Plugin Ecosystem**: A curated set of plugins for everything from Git integration to project management.
- **⌨️ Intuitive Keymappings**: Sensible and easy-to-remember shortcuts powered by `which-key`.

---

## 📸 Screenshots

|                                                                                                                   |                                                                                                                   |
| :---------------------------------------------------------------------------------------------------------------: | :---------------------------------------------------------------------------------------------------------------: |
|                                                                                                                   |                                                                                                                   |
| ![img](https://res.cloudinary.com/dzgoq3ikq/image/upload/v1761509001/Screenshot_27-Oct_01-31-28_11602_ru0ebv.png) | ![img](https://res.cloudinary.com/dzgoq3ikq/image/upload/v1761659282/Screenshot_29-Oct_00-44-36_22035_r58cjo.png) |
|                               ![img](pictures/Screenshot_14-Jul_14-21-01_2361.png)                                |                               ![img](pictures/Screenshot_14-Jul_14-21-33_28692.png)                               |
|                               ![img](pictures/Screenshot_14-Jul_14-21-50_1862.png)                                |                               ![img](pictures/Screenshot_14-Jul_14-23-27_3904.png)                                |
|                                ![img](pictures/Screenshot_14-Jul_14-33-34_299.png)                                |                               ![img](pictures/Screenshot_14-Jul_15-06-27_23844.png)                               |

---

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- **Neovim v0.8.0+**
- **Git**
- **A Nerd Font** (for icons)

---

## 🚀 Installation

1.  **Clone the repository:**

    ```bash
    git clone https://github.com/RAJ8664/nvim-config.git
    ```

2.  **Run the installation script:**

    ```bash
    cd nvim-config
    chmod +x install.sh
    ./install.sh
    ```

3.  **Start Neovim:**

    Open Neovim and the plugins will be installed automatically.

    ```bash
    nvim
    ```

---

## 🧩 Core Plugins

This configuration is built around a set of powerful plugins:

<div align = "center">

### Core & UI

| Plugin                | Description                                        |
| :-------------------- | :------------------------------------------------- |
| **`lazy.nvim`**       | The plugin manager that powers this setup.         |
| **`Kanagawa.nvim`**   | The primary color scheme.                          |
| **`lualine.nvim`**    | A blazing fast and beautiful status line.          |
| **`NeoTree.lua`**     | A fast and feature-rich file explorer.             |
| **`bufferline.nvim`** | A sleek and functional buffer line.                |
| **`which-key.nvim`**  | A popup that displays keybindings.                 |
| **`telescope.nvim`**  | A highly extendable fuzzy finder.                  |
| **`nvim-treesitter`** | For advanced syntax highlighting and code parsing. |
| **`dashboard-nvim`**  | A fancy start screen for Neovim.                   |

</div>

<div align = "center">

### Development & Tooling

| Plugin               | Description                                          |
| :------------------- | :--------------------------------------------------- |
| **`nvim-lspconfig`** | The core LSP configuration plugin.                   |
| **`mason.nvim`**     | To manage and install LSPs, linters, and formatters. |
| **`blink-cmp`**      | The completion engine.                               |
| **`nvim-lint`**      | For asynchronous linting.                            |
| **`gitsigns.nvim`**  | Git decorations and hunks in the sign column.        |
| **`nvim-dap`**       | A Debug Adapter Protocol implementation.             |

</div>

<div align = "center">

### Quality of Life

| Plugin                      | Description                                          |
| :-------------------------- | :--------------------------------------------------- |
| **`auto-pairs`**            | Automatically closes pairs of brackets, quotes, etc. |
| **`comment.nvim`**          | For easy commenting and uncommenting of code.        |
| **`indent-blankline.nvim`** | Adds indentation guides.                             |
| **`flash.nvim`**            | For quick navigation within the viewport.            |

</div>

---

## 🌐 Language Support

This configuration has built-in support for a variety of languages through `nvim-lspconfig` and `mason.nvim`. The following LSPs are configured by default:

- **`lua_ls`** (Lua)
- **`clangd`** (C/C++)
- **`ts_ls`** (TypeScript/JavaScript)
- **`jdtls`** (Java)
- **`phpactor`** (PHP)
- **`tailwindcss`** (Tailwind CSS)
- **`html`**
- **`sqls`**

You can easily add more LSPs by modifying the `lsp_config.lua` file.

---

## 🎨 Customization

This configuration is designed to be easily customizable. Here are some of the key files you might want to edit:

- **`lua/core/options.lua`**: General Neovim settings.
- **`lua/core/keymaps.lua`**: Global keymappings.
- **`lua/plugins/`**: Plugin configurations. Add or remove files here to manage your plugins.
- **`lua/plugins/lsp_config.lua`**: LSP and language server settings.

---

## ⌨️ Keybindings

<div align = "center">

| Mode       | Keybinding         | Description                            |
| :--------- | :----------------- | :------------------------------------- |
| n          | `<C-s>`            | Save file                              |
| i          | `<C-z>`            | Undo                                   |
| n          | `gl`               | View diagnostics for the current line  |
| n          | `<C-a>`            | Select all                             |
| n          | `<leader>sn`       | Save file without auto formatting      |
| n          | `<Esc>`            | Clear highlights                       |
| n          | `<leader>q`        | Open diagnostic [Q]uickfix list        |
| t          | `<Esc><Esc>`       | Exit terminal mode                     |
| n          | `<C-h>`            | Move focus to the left window          |
| n          | `<C-l>`            | Move focus to the right window         |
| n          | `<C-j>`            | Move focus to the lower window         |
| n          | `<C-k>`            | Move focus to the upper window         |
| n          | `<leader>jc`       | Replace test case to input.txt         |
| n          | `<leader>jr`       | Run java code                          |
| n          | `<leader>jf`       | Run cpp code                           |
| n, v       | `<leader>f`        | Format file or range                   |
| n          | `<Tab>`            | Next buffer                            |
| n          | `<S-Tab>`          | Previous buffer                        |
| n          | `<leader>Dc`       | Debug: Start/Continue                  |
| n          | `<leader>Dsi`      | Debug: Step Into                       |
| n          | `<leader>DsO`      | Debug: Step Over                       |
| n          | `<leader>Dso`      | Debug: Step Out                        |
| n          | `<leader>Db`       | Debug: Toggle Breakpoint               |
| n          | `<leader>DB`       | Debug: Set Conditional Breakpoint      |
| n          | `<leader>Dt`       | Debug: Toggle UI                       |
| n          | `<leader>Dl`       | Debug: Run Last Configuration          |
| n          | `<F5>`             | Debug: Start/Continue                  |
| n          | `<F1>`             | Debug: Step Into                       |
| n          | `<F2>`             | Debug: Step Over                       |
| n          | `<F3>`             | Debug: Step Out                        |
| n          | `<leader>b`        | Debug: Toggle Breakpoint               |
| n          | `<leader>B`        | Debug: Set Breakpoint                  |
| n          | `<F7>`             | Debug: See last session result.        |
| n          | `<Leader>;`        | Pick symbols in winbar                 |
| n          | `[;`               | Go to start of current context         |
| n          | `];`               | Select next context                    |
| n, x, o    | `s`                | Flash                                  |
| n, x, o    | `S`                | Flash Treesitter                       |
| o          | `r`                | Remote Flash                           |
| o, x       | `R`                | Treesitter Search                      |
| c          | `<c-s>`            | Toggle Flash Search                    |
| v          | `<leader>hs`       | git [s]tage hunk                       |
| v          | `<leader>hr`       | git [r]eset hunk                       |
| n          | `<leader>hs`       | git [s]tage hunk                       |
| n          | `<leader>hr`       | git [r]eset hunk                       |
| n          | `<leader>hS`       | git [S]tage buffer                     |
| n          | `<leader>hu`       | git [u]ndo stage hunk                  |
| n          | `<leader>hR`       | git [R]eset buffer                     |
| n          | `<leader>hp`       | git [p]review hunk                     |
| n          | `<leader>hb`       | git [b]lame line                       |
| n          | `<leader>hd`       | git [d]iff against index               |
| n          | `<leader>hD`       | git [D]iff against last commit         |
| n          | `<leader>gt`       | [T]oggle git show [b]lame line         |
| n          | `<leader>tD`       | [T]oggle git show [D]eleted            |
| n          | `<C-b>`            | NeoTree reveal                         |
| n, v       | `<leader>aa`       | Sidekick Toggle CLI                    |
| n          | `<leader>as`       | Sidekick Select CLI                    |
| v          | `<leader>as`       | Sidekick Send Visual Selection         |
| n, v       | `<leader>ap`       | Sidekick Select Prompt                 |
| n, x, i, t | `<c-.>`            | Sidekick Switch Focus                  |
| n, v       | `<leader>ac`       | Sidekick Claude Toggle                 |
| n          | `<leader>sh`       | [S]earch [H]elp                        |
| n          | `<leader>sk`       | [S]earch [K]eymaps                     |
| n          | `<leader>sf`       | [S]earch [F]iles                       |
| n          | `<leader>ss`       | [S]earch [S]elect Telescope            |
| n          | `<leader>sw`       | [S]earch current [W]ord                |
| n          | `<leader>sg`       | [S]earch by [G]rep                     |
| n          | `<leader>sd`       | [S]earch [D]iagnostics                 |
| n          | `<leader>sr`       | [S]earch [R]esume                      |
| n          | `<leader>s.`       | [S]earch Recent Files ("." for repeat) |
| n          | `<leader><leader>` | [ ] Find existing buffers              |
| n          | `<leader>/`        | [/] Fuzzily search in current buffer   |
| n          | `<leader>s/`       | [S]earch [/] in Open Files             |
| n          | `<leader>sn`       | [S]earch [N]eovim files                |

</div>

---

## 🙏 Credits

This configuration was inspired by the many amazing Neovim users and plugin authors in the community. A special thanks to the creators of the plugins and tools that make this setup possible.

---

<div align="center">

_Made with ❤️ and Lua_

</div>

