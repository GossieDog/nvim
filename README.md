# Neovim

![Dashboard](screenshots/Neovim.png)
![Editor](screenshots/Neovim-Editor.png)
![Which-Key](screenshots/Neovim-Which-Key.png)

_My Neovim setup for academic writing_

<div align="center">

[![Neovim](https://img.shields.io/badge/Neovim-57A143?style=for-the-badge&logo=neovim&logoColor=white&label=Editor)](https://neovim.io/)
[![LaTeX](https://img.shields.io/badge/LaTeX-008080?style=for-the-badge&logo=latex&logoColor=white&label=Typesetting)](https://www.latex-project.org/)
[![Zotero](https://img.shields.io/badge/Zotero-CC2936?style=for-the-badge&logo=zotero&logoColor=white&label=Citations)](https://www.zotero.org/)
[![Repo Size](https://img.shields.io/github/repo-size/GossieDog/nvim?style=for-the-badge&label=Repo%20Size&color=a277ff)](https://github.com/GossieDog/nvim)

</div>

**[Writing Workflow](https://www.youtube.com/watch?v=avbT4fAC3R4) · [Note-Taking](https://www.youtube.com/watch?v=zayVF1j9gBg)**

## Features

### Academic & LaTeX

- **VimTeX** — Full LaTeX build system integration with Zathura PDF viewer and forward/inverse search. Ability to toggle context menu PDF viewer to Okular for highlight and annotation support.
- **Bibliography management** — Zotero integration via Telescope-BibTeX for inline citation search and insertion
- **Template system** — Pre-configured APA, MLA, and Chicago paper templates with proper document structure
- **Word counting** — Section-by-section word count via VimTeX
- **Spell checking** — Enhanced academic spell checking with custom dictionary support
- **Pandoc integration** — One-command export to DOCX, Markdown, plain text, and MP3 audio

### AI Assistance

- **Avante** — Conversational AI assistant supporting Claude, GPT, and DeepSeek; context-aware with buffer and repository awareness
- **GitHub Copilot** — Inline code completion in manual trigger mode

### Development

- **LSP** — Comprehensive language server support via Mason: TeXLab (LaTeX), LTeX+ (grammar), Lua LS (Lua), Marksman (Markdown), SQLS (SQL), JSON LS, HTML LS, CSS LS, VTSLS (TypeScript/JavaScript)
- **Blink.cmp** — Fast completion engine with fuzzy matching and dictionary/thesaurus, lsp, and snippet sources
- **Treesitter** — Accurate syntax highlighting and structural navigation
- **Conform.nvim** — Format-on-save with multiple formatters: Stylua (Lua), Prettier/Prettierd (HTML/CSS/JS), LaTeXIndent (LaTeX), MarkdownLint-CLI2 + Markdown-TOC (Markdown)
- **Trouble** — Pretty list for showing diagnostics, references, telescope results, quickfix and location lists
- **Linting** — Real-time linting with ChkTeX (LaTeX), ESLint (JavaScript), HTMLHint (HTML), Stylelint (CSS), Luacheck (Lua), MarkdownLint (Markdown)

### Interface & Productivity

- **Gruvbox** — Primary colorscheme
- **Which-Key** — Discoverable keymap guide with organized command groups
- **Snacks dashboard** — Custom start screen with session shortcuts
- **Lualine** — Status line
- **Bufferline** — Shows open buffers
- **Zen Mode** — Distraction-free writing environment

## Plugin Ecosystem

| Category           | Plugins                                                                                 |
| ------------------ | --------------------------------------------------------------------------------------- |
| **Plugin manager** | lazy.nvim                                                                               |
| AI                 | avante, copilot                                                                         |
| Colorscheme        | gruvbox, catppuccin, rose-pine, vague, tokyonight                                       |
| Editor             | flash, conform, vimtex, trouble, mini-nvim, nvim-ts-autotag, gitsigns, yanky            |
| Keymaps            | which-key                                                                               |
| LSP                | mason, mason-lsp-config, mason-tool-installer, nvim-lspconfig                           |
| UI                 | lualine, bufferline, noice, snacks                                                      |
| Util               | telescope, blink-cmp, luasnip, nvim-tree, nvim-treesitter, nvim-treesitter-textobjects, vim-tmux-navigator, undotree |
| Misc               | neovim-session-manager, nvim-lint, cloak, vim-dadbod                                    |

## General Information

### Directory Structure

```
nvim/
├── init.lua                    # Entry point
├── after/
│   └── ftplugin/
│       └── tex.lua             # LaTeX filetype keymaps and PDF annotations
├── lua/
│   ├── config/
│   │   ├── lazy.lua            # Plugin manager bootstrap
│   │   ├── options.lua         # Core Neovim settings
│   │   └── icons.lua           # Icons
│   ├── plugins/                # Plugin configuration files
│   │   ├── ai.lua
│   │   ├── colorscheme.lua
│   │   ├── editor.lua
│   │   ├── keymaps.lua
│   │   ├── lsp.lua
│   │   ├── misc.lua
│   │   ├── ui.lua
│   │   └── util.lua
│   └── snippets/               # Custom LuaSnip snippets
│       ├── tex.lua
│       └── lua.lua
├── screenshots/                # Documentation screenshots
├── spell/                      # Custom spell dictionaries
│   ├── en.utf-8.add
│   └── en.utf-8.add.spl
└── templates/                  # LaTeX document templates
    ├── APA-*.tex
    ├── MLA-*.tex
    ├── Chicago-*.tex
    ├── Notes*.tex
    ├── Resume.tex
    ├── Cover-Letter.tex
    ├── Letter.tex
    ├── Recipe.tex
    ├── References.tex
    ├── Studying.tex
    └── Thank-You.tex
```

### Prerequisites

| Dependency                                    | Purpose                             |
| --------------------------------------------- | ----------------------------------- |
| Neovim 0.12+                                  | Required                            |
| Git                                           | Plugin management and version control                   |
| Hack Nerd Font                                | Icons                               |
| Kitty, Wezterm, Alacritty, Ghostty, or iTerm2 | For image support                   |
| Node.js 18+                                   | LSP server support                  |
| Python 3.8+                                   | Code formatting tools               |
| Java 17+                                      | LTeX grammar checking server        |
| Texlive                                       | LaTeX compilation                   |
| Zathura                                       | PDF preview                         |
| Okular                                        | PDF viewer with support for highlights and annotations             |
| Pandoc                                        | Document conversion                 |
| ripgrep, fd                                   | Fast file searching                 |
| aspell                                        | Word suggestions                    |
| pdfannots                                     | PDF annotation extraction           |
| Zotero + Better BibTeX plugin                 | Citations                           |
| espeak-ng and ffmpeg (optional)               | Mp3 conversion                      |
| Rust (optional)                               | Better performance for some plugins |

## Installation

### Dependencies

- Install [Zotero](https://www.zotero.org/) and [Better BibTeX for Zotero](https://retorque.re/zotero-better-bibtex/).
- Ensure that your terminal has support for kitty graphics protocol. Some common choices include [kitty](https://sw.kovidgoyal.net/kitty/), [WezTerm](https://wezterm.org/index.html), and [Ghostty](https://ghostty.org/).
- Follow the install instructions for your system below.

#### Ubuntu / Debian

<details>
<summary>Click to expand</summary>

##### Core packages

```bash
  sudo apt install -y \
    neovim git nodejs npm python3 python3-pip \
    default-jdk texlive-full zathura okular pandoc \
    ripgrep fd-find aspell espeak-ng ffmpeg curl
```

##### Hack Nerd Font

```bash
  mkdir -p ~/.local/share/fonts
  cd ~/.local/share/fonts
  curl -fLo "Hack Regular Nerd Font Complete.ttf" \
    https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/Hack/Regular/HackNerdFont-Regular.ttf
  fc-cache -fv
```

##### pdfannots

```bash
  pip3 install pdfannots
```

##### Rust

```bash
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

</details>

#### Fedora

<details>
<summary>Click to expand</summary>

##### Core packages

```bash
  sudo dnf install -y \
    neovim git nodejs python3 python3-pip \
    java-17-openjdk texlive-scheme-full zathura \
    okular pandoc ripgrep fd-find aspell \
    espeak-ng ffmpeg curl
```

##### Hack Nerd Font

```bash
  mkdir -p ~/.local/share/fonts
  cd ~/.local/share/fonts
  curl -fLo "Hack Regular Nerd Font Complete.ttf" \
    https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/Hack/Regular/HackNerdFont-Regular.ttf
  fc-cache -fv
```

##### pdfannots

```bash
  pip3 install pdfannots
```

##### Rust

```bash
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

</details>

#### Arch / Manjaro

<details>
<summary>Click to expand</summary>

##### Core packages

```bash
  sudo pacman -S --noconfirm \
    neovim git nodejs npm python python-pip \
    jdk17-openjdk texlive-most zathura zathura-pdf-mupdf \
    okular pandoc ripgrep fd aspell \
    espeak-ng ffmpeg curl
```

##### Hack Nerd Font

```bash
  sudo pacman -S --noconfirm ttf-hack-nerd
```

##### pdfannots

```bash
  pip install pdfannots
```

##### Rust

```bash
  sudo pacman -S --noconfirm rust
```

</details>

#### macOS

<details>
<summary>Click to expand</summary>

> **Important!** Homebrew is required for these install instructions. If you do not have homebrew, it can be downloaded at [brew.sh](https://brew.sh/).

##### Core packages

```bash
  brew install \
    neovim git node python java \
    pandoc ripgrep fd aspell \
    espeak-ng ffmpeg
```

##### TeX Live

```bash
  brew install texlive
```

> If you prefer, MacTeX can be installed instead of TeX Live with `brew install --cask mactex`.

##### PDF viewer

```bash
  brew install --cask okular
```

##### Hack Nerd Font

```bash
  brew tap homebrew/cask-fonts
  brew install --cask font-hack-nerd-font
```

##### Set JAVA_HOME

```bash
  sudo ln -sfn $(brew --prefix)/opt/openjdk/libexec/openjdk.jdk \
    /Library/Java/JavaVirtualMachines/openjdk.jdk
```

##### pdfannots

```bash
  pip3 install pdfannots
```

##### Rust

```bash
  brew install rust
```

</details>

### Neovim Config

Neovim looks for configuration files within `~/.config/nvim`. To start, back up any existing configuration.

```bash
mv ~/.config/nvim ~/.config/nvim.bak
```

Clone the repository

```bash
git clone https://github.com/GossieDog/nvim.git ~/.config/nvim
```

Launch Neovim

```bash
nvim
```

Upon start, Lazy will automatically install plugins, Mason will automatically install lisps, formatters, and linter's, and Treesitter will automatically install parsers.
Open Lazy with `:Lazy` or `L` and then update plugins with `U`.
Run `:checkhealth`.

## Getting Started

### Setup Zotero

Open Zotero right click on "My Library" on the left side. Select export library. In the popup, select BetterBibLaTeX and check keep updated and background export. Select the folder and name the file that you want to export to.

> **Important!** Remember to note down the path of your exported library. E.g. `/home/user/Documents/Zotero.bib`.

Then navigate to the BetterBibTeX section in settings. In the miscellaneous section, switch "sort TeX/CSL output" to off.

Next, open `~/.config/nvim/lua/plugins/utill.lua` in Neovim.

```bash
nvim ~/.config/nvim/lua/plugins/util.lua
```

Replace the paths in `global_files` and `bibtex_file` with the one from your Zotero export.

```lua
    extensions = {
     bibtex = {
      -- Depth for the *.bib file
      depth = 1,
      -- Custom format for citation label
      custom_formats = {},
      -- Format to use for citation label.
      -- Try to match the filetype by default, or use 'plain'
      format = "",
      -- Path to global bibliographies (placed outside of the project)
      global_files = {
       "/the/path/to/your/bib/file",
      },
      bibtex_file = "/the/path/to/your/bib/file",
      -- Define the search keys to use in the picker
      search_keys = { "author", "year", "title" },
      -- Template for the formatted citation
      citation_format = "{{author}} ({{year}}), {{title}}.",
      -- Only use initials for the authors first name
      citation_trim_firstname = true,
      -- Max number of authors to write in the formatted citation
      -- following authors will be replaced by "et al."
      citation_max_auth = 2,
      -- Context awareness disabled by default
      context = true,
      -- Fallback to global/directory .bib files if context not found
      -- This setting has no effect if context = false
      context_fallback = true,
      -- Wrapping in the preview window is disabled by default
      wrap = false,
      -- user defined mappings
      mappings = {
       i = {
        ["<CR>"] = bibtex_actions.key_append("%s"), -- format is determined by filetype if the user has not set it explictly
        ["<C-e>"] = bibtex_actions.entry_append,
        ["<C-c>"] = bibtex_actions.citation_append("{{author}} ({{year}}), {{title}}."),
       },
      },
     },
    },
```

Finally, follow [these](https://www.zotero.org/download/) instructions to add the Zotero Connector extension to your browser.

### Creating a Session

Sessions let you instantly reopen a project — all your files, splits, and state restored exactly as you left them.

**To create a session for a course folder:**

1. Navigate to the course directory in your terminal — for example, `cd ~/Documents/Course-1`
2. Open any file from that folder in Neovim
3. Exit Neovim normally

The session is saved automatically. From now on, you can return to that workspace at any time---regardless of which directory you're currently in---by opening Neovim and pressing `l`.

### Keymaps

<details>
<summary>Click to expand</summary>
Along with the default Vim motions, the config includes keymaps listed in Which-Key. Below, you can find a list of all additional keymaps. These will show up in a popup when you hit either the leader or the localleader key.

> **Important!** Keymaps specific to the `.tex` filetype will only appear when you are in a `.tex` file.

**Leader**: `<Space>` | **Local leader**: `\`

#### Core

| Key         | Action               |
| ----------- | -------------------- |
| `<leader>r` | Restart              |
| `<leader>e` | Toggle file explorer |
| `<leader>q` | Quit                 |
| `<leader>z` | Toggle Zen Mode      |
| `<leader>C` | Browse colorschemes  |

#### Find & Navigate

| Key          | Action                    |
| ------------ | ------------------------- |
| `<leader>ff` | Find files                |
| `<leader>ft` | Live grep                 |
| `<leader>fb` | Search buffers            |
| `<leader>fr` | Recent files              |
| `<leader>fz` | Search citations (BibTeX) |
| `<leader>fu` | Visual undo tree          |
| `<leader>fl` | Resume last search        |
| `<leader>fg` | Git history               |
| `<leader>fh` | Help tags                 |
| `<leader>fk` | Keymaps                   |
| `<leader>fy` | Yank history              |
| `<leader>fd` | Diagnostics               |
| `<leader>fm` | Man pages                 |
| `<leader>fc` | Config files              |
| `<leader>fs` | Symbols                   |

#### LaTeX

> These will only show when in a file with the `.tex` filetype.

| Key               | Action                       |
| ----------------- | ----------------------------- |
| `<localleader>ll` | Build document               |
| `<localleader>lL` | Build selected               |
| `<localleader>lv` | View PDF                     |
| `<localleader>lw` | Word count                   |
| `<localleader>le` | Show errors                  |
| `<localleader>lc` | Clean auxiliary files        |
| `<localleader>lC` | Clean full                   |
| `<localleader>lg` | VimTeX status                |
| `<localleader>lG` | VimTeX status all            |
| `<localleader>li` | VimTeX info                  |
| `<localleader>lI` | VimTeX info full             |
| `<localleader>lk` | Stop compilation             |
| `<localleader>lK` | Stop all                     |
| `<localleader>lt` | Open TOC                     |
| `<localleader>lT` | Toggle TOC                   |
| `<localleader>ld` | Package documentation        |
| `<localleader>lm` | Maps list                    |
| `<localleader>lo` | Build output                 |
| `<localleader>lq` | Log                          |
| `<localleader>ls` | Toggle main                  |
| `<localleader>lS` | Build SS                     |
| `<localleader>lx` | Reload                       |
| `<localleader>lX` | Reload state                 |
| `<localleader>la` | Context menu                 |
| `<localleader>lp` | Toggle Okular context viewer |
| `<localleader>ln` | View PDF annotations         |

#### Export (Pandoc)

| Key          | Format                 |
| ------------ | ----------------------- |
| `<leader>pd` | Word (.docx)           |
| `<leader>pm` | Markdown               |
| `<leader>pt` | LaTeX                  |
| `<leader>pT` | Plain text + MP3 audio |

#### AI (Avante)

| Key          | Action                    |
| ------------ | ------------------------- |
| `<leader>aa` | Ask AI                    |
| `<leader>aC` | Start chat                |
| `<leader>at` | Toggle sidebar            |
| `<leader>a?` | Select model              |
| `<leader>aB` | Add all open buffers      |
| `<leader>aR` | Display repo map          |
| `<leader>ac` | Clear chat history        |
| `<leader>ad` | Toggle debug              |
| `<leader>af` | Focus                     |
| `<leader>ah` | Select history            |
| `<leader>am` | Select ACP Mode           |
| `<leader>aM` | Select ACP Model          |
| `<leader>an` | Create new chat           |
| `<leader>ar` | Refresh                   |
| `<leader>as` | Toggle suggestion         |
| `<leader>aS` | Stop                      |
| `<leader>az` | Toggle Zen Mode           |
| `<leader>a+` | Select file in NvimTree   |
| `<leader>a-` | Deselect file in NvimTree |

#### Git

| Key                         | Action               |
| --------------------------- | --------------------- |
| `<leader>gg`                | Open LazyGit         |
| `<leader>gs`                | Git status           |
| `<leader>gb`                | Git branches         |
| `<leader>gc`                | Git commits          |
| `<leader>gj` / `<leader>gk` | Next / previous hunk |
| `<leader>gp`                | Preview hunk         |
| `<leader>gl`                | Blame current line   |

#### Buffers & Sessions

| Key                         | Action                          |
| --------------------------- | -------------------------------- |
| `<Tab>` / `<S-Tab>`         | Next / previous buffer          |
| `<leader>bd`                | Close buffer                    |
| `<leader>bn` / `<leader>bp` | Move buffer right / left        |
| `<leader>bP`                | Pin buffer                      |
| `<leader>bf`                | Pick buffer                     |
| `<leader>br` / `<leader>bl` | Close right / left buffers      |
| `<leader>b\` / `<leader>b-` | Split vertically / horizontally |
| `<leader>bq`                | Close window                    |
| `<leader>Ss`                | Save session                    |
| `<leader>Sl`                | Load session                    |
| `<leader>Sd`                | Delete session                  |

#### LSP & Tools

| Key          | Action                  |
| ------------ | ------------------------ |
| `<leader>lm` | Open Mason              |
| `<leader>lu` | Mason update            |
| `<leader>ll` | Mason log               |
| `<leader>ts` | Toggle spell check      |
| `<leader>tc` | Toggle Copilot          |
| `<leader>tC` | Toggle Cloak            |
| `<leader>tf` | Format                  |
| `<leader>tl` | Lint                    |
| `<leader>tt` | Inspect Treesitter Tree |

#### Diagnostics

| Key          | Action                       |
| ------------ | ------------------------------ |
| `<leader>dp` | Project Diagnostics          |
| `<leader>db` | Buffer Diagnostics           |
| `<leader>ds` | Symbols (Trouble)            |
| `<leader>dq` | Quickfix List (Trouble)      |
| `<leader>dd` | Open diagnostic under cursor |
| `<leader>dt` | Toggle virtual text          |

</details>

> **Important!** Suggestions from Telescope, Blinkcmp, and Copliot and be cycled through using `<C-j>` and `<C-k>`. To accept, use `<C-y>`.

### LaTeX

> **Important!** The keymaps for LaTeX will only show up in a `.tex` file.

#### Compiling a Document

To compile a LaTeX document from Neovim, use the keymap `<localleader>ll` this will start a VimTeX continuous compilation and open the corresponding PDF in Zathura. Each time you save, the file, the document will be recompiled.

Diagnostics are taken care of by the Trouble plugin. By default, the diagnostics will not automatically appear after compilation. The quickfix window can be opened with `<leader>dq` To open a quickfix list, use and need to be opened manually with `<leader>db` for buffer diagnostics and `<leader>dp` for project diagnostics

#### Adding a citation

Citations can be added using the standard BibLaTeX commands (or whatever package you use). The lsp will provide autocompletion suggestions. To use Telescope to search through your citations, hit `<leader>fz`.

To add a citation to the `.bib` file. Use the Zotero extension in your browser (ensure that Zotero is running in the background) and the `.bib` file will be automatically updated by the BetterBibTeX for Zotero plugin.

### Optional

#### AI

##### GitHub Copilot

Run `:Copilot auth` in Neovim and follow the prompts to connect your GitHub account.

Copilot provides inline suggestions and is disabled by default. To enable, hit `<leader>tc`.

##### Avante

API keys can be gotten below

- [Anthropic](https://platform.claude.com/docs/en/api/admin/api_keys/retrieve)
- [OpenAI](https://openai.com/index/openai-api/)
- [DeepSeek](https://api-docs.deepseek.com/)

Set your API key(s) as environment variables in your shell config (`~/.bashrc` or `~/.zshrc`):

```bash
export ANTHROPIC_API_KEY="your-key-here"
export OPENAI_API_KEY="your-key-here"
export DEEPSEEK_API_KEY="your-key-here"
```

Reload your shell.

Use `<leader>a` to access the Avante keymaps.

```bash
source ~/.bashrc  # or source ~/.zshrc
```

#### Tmux

To enable seamless navigation between Neovim and tmux panes, install the
[vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) plugin for tmux.

**With TPM (recommended)**

Add the following to your `~/.tmux.conf`:

```bash
set -g @plugin 'christoomey/vim-tmux-navigator'
```

Then inside a tmux session, press `prefix + I` (capital i) to install.

**Manually**

Clone the plugin and source the navigation script in your `~/.tmux.conf`:

```bash
git clone https://github.com/christoomey/vim-tmux-navigator ~/path/to/plugins/vim-tmux-navigator
```

```bash
run-shell ~/path/to/plugins/vim-tmux-navigator/vim_tmux_navigator.tmux
```
