# Neovim Academic Configuration

> A modern Neovim setup built for academic writing, LaTeX development, and research — combining a full IDE experience with AI assistance and scholarly productivity tools.

## 📸 Screenshots

![Dashboard](screenshots/Screenshot-1.png)
*Snacks dashboard — quick access to recent files, sessions, and commands on startup.*

![Screenshot-2](screenshots/Screenshot-2.png) ![Screenshot-3](screenshots/Screenshot-3.png)

---

## Demonstrations

- [Writing](https://www.youtube.com/watch?v=avbT4fAC3R4)
- [Notes](https://www.youtube.com/watch?v=zayVF1j9gBg)

---

## Contents

- [Overview](#overview)
- [Features](#features)
- [Plugin Ecosystem](#plugin-ecosystem)
- [Key Mappings](#key-mappings)
- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
- [Customization](#customization)

---

## Overview

This configuration is optimized for users who split their time between academic writing and software development. It provides first-class LaTeX support via VimTeX, citation management through Zotero/BibTeX, AI-powered assistance via Avante and GitHub Copilot, and a full LSP-backed development environment — all within a carefully organized, modular structure.

**Primary use cases:**
- Writing and compiling LaTeX documents (research papers, theses, reports)
- Managing citations and bibliographies
- Converting documents across formats (DOCX, Markdown, audio)
- General software development with LSP, linting, and formatting

---

## Features

### Academic & LaTeX
- **VimTeX** — Full LaTeX build system integration with Zathura PDF viewer and forward/inverse search
- **Bibliography management** — Zotero integration via Telescope-BibTeX for inline citation search and insertion
- **Template system** — Pre-configured APA, MLA, and Chicago paper templates with proper document structure
- **Word counting** — Section-by-section word count via VimTeX
- **Spell checking** — Enhanced academic spell checking with custom dictionary support
- **Pandoc integration** — One-command export to DOCX, Markdown, plain text, and MP3 audio

### AI Assistance
- **Avante** — Conversational AI assistant supporting Claude Sonnet, DeepSeek, and Moonshot; context-aware with buffer and repository awareness
- **GitHub Copilot** — Inline code completion in manual trigger mode

### Development
- **LSP** — TeXLab for LaTeX; extensible to any language via Mason
- **Blink.cmp** — Fast completion engine with fuzzy matching and dictionary/thesaurus sources
- **Treesitter** — Accurate syntax highlighting and structural navigation
- **Conform.nvim** — Format-on-save for all supported filetypes
- **ChkTeX** — Real-time LaTeX linting

### Interface & Productivity
- **Gruvbox** — Dark-optimized primary colorscheme (alternatives: Catppuccin, Rose Pine, Vague)
- **Which-Key** — Discoverable keymap guide with organized command groups
- **Snacks dashboard** — Custom start screen with project and session shortcuts
- **Lualine** — Status line with VimTeX word count and real-time clock
- **Zen Mode** — Distraction-free writing environment

---

## Plugin Ecosystem

| Category | Plugins |
|----------|---------|
| **Plugin manager** | lazy.nvim |
| **UI & dashboard** | snacks.nvim, lualine.nvim, which-key.nvim |
| **Completion** | blink.cmp, LuaSnip, friendly-snippets |
| **LaTeX** | VimTeX, telescope-bibtex.nvim, ChkTeX |
| **LSP & tooling** | nvim-lspconfig, mason.nvim, conform.nvim, nvim-treesitter |
| **AI** | avante.nvim, copilot.lua |
| **Navigation** | telescope.nvim, nvim-tree.lua, flash.nvim |
| **Git** | gitsigns.nvim, lazygit |
| **Utilities** | mini.nvim, yanky.nvim, undotree, session-manager |

---

## Key Mappings

**Leader**: `<Space>` | **Local leader**: `\`

### Core

| Key | Action |
|-----|--------|
| `<leader>e` | Toggle file explorer |
| `<leader>w` | Save all buffers |
| `<leader>q` | Quit |
| `<leader>,` | Return to dashboard |
| `<leader>z` | Toggle Zen Mode |
| `<leader>C` | Browse colorschemes |

### Find & Navigate

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>ft` | Live grep |
| `<leader>fb` | Search buffers |
| `<leader>fr` | Recent files |
| `<leader>fz` | Search citations (BibTeX) |
| `<leader>fu` | Visual undo tree |

### LaTeX

| Key | Action |
|-----|--------|
| `\ll` | Compile document |
| `\lv` | View PDF |
| `\lw` | Word count (quick) |
| `\lW` | Word count (by section) |
| `\le` | Show errors |
| `\lc` | Clean auxiliary files |

### Templates

| Key | Template |
|-----|----------|
| `<leader>Ta` | APA paper |
| `<leader>Tm` | MLA paper |
| `<leader>Tc` | Chicago paper |
| `<leader>Tn` | Notes |
| `<leader>Ts` | Study notes |

### Export (Pandoc)

| Key | Format |
|-----|--------|
| `<leader>pd` | Word (.docx) |
| `<leader>pm` | Markdown |
| `<leader>pt` | LaTeX |
| `<leader>pT` | Plain text + MP3 audio |

### AI (Avante)

| Key | Action |
|-----|--------|
| `<leader>aa` | Ask AI |
| `<leader>aC` | Open chat |
| `<leader>at` | Toggle sidebar |
| `<leader>a?` | Switch model |
| `<leader>aB` | Add buffers to context |
| `<leader>aR` | Show repo structure |

### Git

| Key | Action |
|-----|--------|
| `<leader>gg` | Open LazyGit |
| `<leader>gs` | Git status |
| `<leader>gj` / `<leader>gk` | Next / previous hunk |
| `<leader>gp` | Preview hunk |
| `<leader>gl` | Blame current line |

### Buffers & Sessions

| Key | Action |
|-----|--------|
| `<Tab>` / `<S-Tab>` | Next / previous buffer |
| `<leader>bd` | Close buffer |
| `<leader>bv` / `<leader>bh` | Split vertically / horizontally |
| `<leader>Ss` | Save session |
| `<leader>Sl` | Load session |
| `<leader>Sd` | Delete session |

---

## Installation

### Prerequisites

| Dependency | Purpose |
|------------|---------|
| Neovim 0.9+ | Required |
| Git | Plugin management |
| Node.js | LSP server support |
| TeX Live (recommended) | LaTeX compilation |
| Zathura | PDF preview |
| Pandoc | Document conversion |
| ripgrep, fd | Telescope search backends |

### Steps

**1. Back up your existing configuration:**
```bash
mv ~/.config/nvim ~/.config/nvim.backup
```

**2. Clone this repository:**
```bash
git clone <repository-url> ~/.config/nvim
```

**3. Launch Neovim:**
```bash
nvim
```
Lazy.nvim will automatically bootstrap and install all plugins on first launch.

**4. Install LSP servers via Mason (optional):**
```vim
:Mason
```

### System Dependencies

```bash
# LaTeX
sudo apt install texlive-full latexmk zathura

# Search tools
sudo apt install ripgrep fd-find pandoc

# Spell checking
sudo apt install aspell aspell-en

# Text-to-speech export
sudo apt install espeak-ng ffmpeg
```

### Post-Install Checklist

- [ ] Open Neovim and wait for Lazy.nvim to finish installing plugins
- [ ] Run `:Mason` and confirm TeXLab is installed
- [ ] Create a `.tex` file and compile with `\ll`
- [ ] Update the bibliography path in the Telescope-BibTeX configuration
- [ ] Run `:Copilot auth` if using GitHub Copilot
- [ ] Verify Avante is working with `<leader>aa`

---

## Configuration

### Directory Structure

```
nvim/
├── init.lua                    # Entry point
├── lua/
│   ├── config/
│   │   ├── lazy.lua            # Plugin manager bootstrap
│   │   └── options.lua         # Core Neovim settings
│   ├── plugins/                # Per-plugin configuration files
│   └── snippets/               # Custom LuaSnip snippets
├── templates/                  # LaTeX document templates
├── after/ftplugin/             # Filetype-specific overrides
└── spell/                      # Custom spell dictionaries
```

### Key Settings

| Setting | Value |
|---------|-------|
| Leader key | `<Space>` |
| Local leader | `\` |
| PDF viewer | Zathura |
| Primary colorscheme | Gruvbox (dark) |
| Primary AI model | Claude Sonnet (via Avante) |
| Copilot mode | Manual trigger |

### LaTeX-Specific Surround Shortcuts

Using `gsa` + key in Mini.surround:

| Key | Output |
|-----|--------|
| `e` | `\begin{equation}...\end{equation}` |
| `A` | `\begin{align}...\end{align}` |
| `I` | `\begin{itemize}...\end{itemize}` |
| `E` | `\begin{enumerate}...\end{enumerate}` |
| `b` | `\textbf{...}` |
| `i` | `\textit{...}` |
| `$` | `$...$` |

---

## Usage

### Writing an Academic Paper

```bash
mkdir ~/papers/my-paper && cd ~/papers/my-paper
nvim paper.tex
```

1. Load a template with `<leader>T` (`a` for APA, `m` for MLA, `c` for Chicago)
4. Search and insert citations with the completion menus or `<leader>fz`
5. Compile with `\ll` and preview with `\lv`

### Working with Citations

Open the BibTeX picker with `<leader>fz`, then:

| Key | Action |
|-----|--------|
| `<Enter>` | Insert citation key — `\cite{author2023}` |
| `<C-e>` | Insert full bibliography entry |
| `<C-c>` | Insert formatted inline citation |

### Using AI Assistance

- **Ask about selected text**: Visual-select, then `<leader>aa`
- **Open persistent chat**: `<leader>aC`
- **Add open buffers as context**: `<leader>aB`
- **Switch models**: `<leader>a?` (Claude, DeepSeek, Moonshot)

---

## Customization

| What to change | Where |
|----------------|-------|
| Add or configure plugins | `lua/plugins/` |
| Modify keymaps | `lua/plugins/which-key.lua` |
| Add LaTeX templates | `templates/` |
| Add snippets | `lua/snippets/` |
| Change core settings | `lua/config/options.lua` |

---

## Troubleshooting

**PDF not updating after compile** — Run `\le` to check for compilation errors. Clean auxiliary files with `\lc` and recompile.

**Completions not appearing** — Run `:LspInfo` to confirm the language server is active. For dictionary completions, ensure `aspell` and `aspell-en` are installed.

**Avante not responding** — Verify your API key is set correctly in your environment. Check your internet connection.

**Copilot not working** — Run `:Copilot status`. Re-authenticate with `:Copilot auth` if needed.

<!-- --- -->

<!-- ## License -->
<!---->
<!-- MIT License — see [LICENSE](LICENSE) for details. -->
