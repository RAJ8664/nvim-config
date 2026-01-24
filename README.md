<div align="center">

# 👨‍💻 Code Engine

**A fully customized and high-performance Neovim setup designed to boost productivity and provide an IDE-like experience inside the terminal.**

[![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?style=for-the-badge&logo=neovim&logoColor=white)](https://neovim.io/)
[![Lua](https://img.shields.io/badge/lua-%232C2D72.svg?style=for-the-badge&logo=lua&logoColor=white)](https://lua.org)

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

<table>
  <tr>
    <th>File Tree</th>
    <th>Editor</th>
  </tr>
  <tr>
    <td><img src="https://res.cloudinary.com/dzgoq3ikq/image/upload/v1769244334/Screenshot_24-Jan_14-15-12_31224_a1kvox.png" width="500" height="250"/></td>
    <td><img src="https://res.cloudinary.com/dzgoq3ikq/image/upload/v1769244071/Screenshot_24-Jan_14-10-26_29206_py1h7n.png" width="500" height="250"/></td>
  </tr>

  <tr>
    <th>Terminal</th>
    <th>Terminal</th>
  </tr>
  <tr>
    <td><img src="pictures/Screenshot_14-Jul_14-21-01_2361.png" width="500" height="250"/></td>
    <td><img src="https://res.cloudinary.com/dzgoq3ikq/image/upload/v1769243670/Screenshot_24-Jan_13-57-02_28640_qv76js.png" width="500" height="250"/></td>
  </tr>

  <tr>
    <th>Lazy Git</th>
    <th>Editor</th>
  </tr>
  <tr>
    <td><img src="pictures/Screenshot_14-Jul_14-21-50_1862.png" width="500" height="250"/></td>
    <td><img src="pictures/Screenshot_14-Jul_14-23-27_3904.png" width="500" height="250"/></td>
  </tr>

  <tr>
    <th>Typr Stats</th>
    <th>Telescope</th>
  </tr>
  <tr>
    <td><img src="pictures/Screenshot_14-Jul_14-33-34_299.png" width="500" height="250"/></td>
    <td><img src="https://res.cloudinary.com/dzgoq3ikq/image/upload/v1769244237/Screenshot_24-Jan_14-13-18_10553_ndublr.png" width="500" height="250"/></td>
  </tr>
</table>

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

- _Leader key is set to_ `space`.

<details open>
<summary><b>🚀 Core & Navigation</b></summary>

| Mode | Key          | Action                             |
| :--- | :----------- | :--------------------------------- |
| `n`  | `<C-s>`      | **Save file**                      |
| `i`  | `<C-z>`      | Undo                               |
| `n`  | `<C-a>`      | Select all                         |
| `n`  | `<leader>sn` | Save file without auto formatting  |
| `n`  | `<Esc>`      | Clear search highlights            |
| `t`  | `<Esc><Esc>` | Exit terminal mode                 |
| `n`  | `<C-h>`      | Move focus to the **left** window  |
| `n`  | `<C-l>`      | Move focus to the **right** window |
| `n`  | `<C-j>`      | Move focus to the **lower** window |
| `n`  | `<C-k>`      | Move focus to the **upper** window |
| `n`  | `<Tab>`      | Next buffer                        |
| `n`  | `<S-Tab>`    | Previous buffer                    |
| `n`  | `<C-b>`      | NeoTree reveal                     |

</details>

<details>
<summary><b>🔍 Search & Discovery (Telescope / Flash)</b></summary>

| Mode      | Key                | Action                           |
| :-------- | :----------------- | :------------------------------- |
| `n`       | `<leader>sf`       | [S]earch [F]iles                 |
| `n`       | `<leader>sg`       | [S]earch by [G]rep               |
| `n`       | `<leader>sw`       | [S]earch current [W]ord          |
| `n`       | `<leader>sk`       | [S]earch [K]eymaps               |
| `n`       | `<leader>sh`       | [S]earch [H]elp                  |
| `n`       | `<leader>ss`       | [S]earch [S]elect Telescope      |
| `n`       | `<leader>sd`       | [S]earch [D]iagnostics           |
| `n`       | `<leader>sr`       | [S]earch [R]esume                |
| `n`       | `<leader>s.`       | [S]earch Recent Files            |
| `n`       | `<leader><leader>` | Find existing buffers            |
| `n`       | `<leader>/`        | Fuzzily search in current buffer |
| `n`       | `<leader>s/`       | [S]earch [/] in Open Files       |
| `n`       | `<leader>sn`       | [S]earch [N]eovim files          |
| `n, x, o` | `s`                | **Flash**                        |
| `n, x, o` | `S`                | **Flash Treesitter**             |
| `o`       | `r`                | Remote Flash                     |
| `o, x`    | `R`                | Treesitter Search                |
| `c`       | `<c-s>`            | Toggle Flash Search              |

</details>

<details>
<summary><b>🛠️ LSP, Logic & Development</b></summary>

| Mode   | Key          | Action                            |
| :----- | :----------- | :-------------------------------- |
| `n, v` | `<leader>f`  | **Format file or range**          |
| `n`    | `gl`         | View diagnostics for current line |
| `n`    | `<leader>q`  | Open diagnostic [Q]uickfix list   |
| `n`    | `<Leader>;`  | Pick symbols in winbar            |
| `n`    | `[;`         | Go to start of current context    |
| `n`    | `];`         | Select next context               |
| `n`    | `<leader>jc` | Replace test case to `input.txt`  |
| `n`    | `<leader>jr` | **Run Java code**                 |
| `n`    | `<leader>jf` | **Run CPP code**                  |

</details>

<details>
<summary><b>🐞 Debugging (DAP)</b></summary>

| Key           | Action                     | Alt Key     |
| :------------ | :------------------------- | :---------- |
| `<leader>Dc`  | Debug: Start/Continue      | `<F5>`      |
| `<leader>Db`  | Debug: Toggle Breakpoint   | `<leader>b` |
| `<leader>Dsi` | Debug: Step Into           | `<F1>`      |
| `<leader>DsO` | Debug: Step Over           | `<F2>`      |
| `<leader>Dso` | Debug: Step Out            | `<F3>`      |
| `<leader>DB`  | Set Conditional Breakpoint | `<leader>B` |
| `<leader>Dt`  | Toggle Debug UI            | —           |
| `<leader>Dl`  | Run Last Configuration     | —           |
| `<F7>`        | See last session result    | —           |

</details>

<details>
<summary><b>🎋 Git Integration (Gitsigns)</b></summary>

| Mode   | Key          | Action                         |
| :----- | :----------- | :----------------------------- |
| `n, v` | `<leader>hs` | git [s]tage hunk               |
| `n, v` | `<leader>hr` | git [r]eset hunk               |
| `n`    | `<leader>hS` | git [S]tage buffer             |
| `n`    | `<leader>hu` | git [u]ndo stage hunk          |
| `n`    | `<leader>hR` | git [R]eset buffer             |
| `n`    | `<leader>hp` | git [p]review hunk             |
| `n`    | `<leader>hb` | git [b]lame line               |
| `n`    | `<leader>hd` | git [d]iff against index       |
| `n`    | `<leader>hD` | git [D]iff against last commit |
| `n`    | `<leader>gt` | [T]oggle git show [b]lame line |
| `n`    | `<leader>tD` | [T]oggle git show [D]eleted    |

</details>

<details>
<summary><b>🤖 Sidekick AI Integration</b></summary>

| Mode   | Key          | Action                         |
| :----- | :----------- | :----------------------------- |
| `n, v` | `<leader>aa` | Sidekick Toggle CLI            |
| `n`    | `<leader>as` | Sidekick Select CLI            |
| `v`    | `<leader>as` | Sidekick Send Visual Selection |
| `n, v` | `<leader>ap` | Sidekick Select Prompt         |
| `all`  | `<c-.>`      | Sidekick Switch Focus          |
| `n, v` | `<leader>ac` | Sidekick Claude Toggle         |

</details>

<details> 
<summary><b>💻 Terminal </b></summary>

| Mode | Key       | Action                                   |
| :--- | :-------- | :--------------------------------------- |
| `n`  | `Alt + 1` | Toggle 1st ToggleTerm Terminal instance. |
| `n`  | `Alt + 2` | Toggle 2nd ToggleTerm Terminal instance. |
| `n`  | `Alt + i` | Toggle ith ToggleTerm Terminal instance. |

</details>

---

## 🙏 Credits

This configuration was inspired by the many amazing Neovim users and plugin authors in the community. A special thanks to the creators of the plugins and tools that make this setup possible.
