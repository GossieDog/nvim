# Academic-Focused Neovim Configuration

A comprehensive Neovim configuration optimized for academic writing, LaTeX development, and research work. This setup provides a modern IDE experience with extensive LaTeX support, AI assistance, and productivity enhancements.

## 📸 Screenshot

![Neovim Dashboard](screenshots/Screenshot-1.png)
*The Snacks dashboard on startup — quick access to recent files, sessions, and commands.*

## 🎯 Primary Use Cases

- **Academic Writing**: LaTeX documents, research papers, citations
- **Development**: Full LSP support with modern tooling
- **Research**: Bibliography management, note-taking, document conversion
- **Productivity**: Session management, AI assistance, template system

## 📁 Directory Structure

```
nvim/
├── init.lua                    # Main configuration entry point
├── lua/
│   ├── config/
│   │   ├── lazy.lua           # Lazy.nvim plugin manager setup
│   │   └── options.lua        # Core Neovim options and settings
│   ├── plugins/               # Individual plugin configurations
│   └── snippets/              # Custom LuaSnip snippets
├── templates/                 # LaTeX document templates
├── after/ftplugin/           # Filetype-specific configurations
├── spell/                    # Custom spell dictionaries
└── coc-settings.json         # CoC configuration (legacy)
```

## ✨ Key Features

### 🎓 Academic & LaTeX
- **VimTeX Integration**: Complete LaTeX support with Zathura PDF viewer
- **Bibliography Management**: Zotero integration via Telescope-BibTeX
- **Template System**: Pre-configured APA, MLA, Chicago paper templates
- **Word Counting**: Section-by-section word count for academic papers
- **Spell Checking**: Enhanced spell checking for academic writing
- **Pandoc Integration**: Convert documents to DOCX, Markdown, TXT, and MP3

### 🤖 AI-Powered Assistance
- **Avante**: Advanced AI coding assistant with Claude Sonnet, DeepSeek, and Moonshot
- **GitHub Copilot**: Code completion and suggestions
- **Dictionary/Thesaurus**: Intelligent word suggestions for academic writing

### 🔧 Modern Development Tools
- **Blink.cmp**: Fast completion engine with fuzzy matching
- **LSP Support**: TeXLab for LaTeX, with extensible LSP configuration
- **Treesitter**: Advanced syntax highlighting and parsing
- **Formatting**: Automatic code formatting with Conform.nvim
- **Linting**: LaTeX linting with ChkTeX

### 🎨 UI & Experience
- **Gruvbox Theme**: Primary colorscheme with multiple alternatives
- **Which-Key**: Interactive keymap guide with organized command groups
- **Snacks Dashboard**: Custom start screen with quick access
- **Lualine**: Informative status line with real-time clock
- **Zen Mode**: Distraction-free writing environment

## 🔌 Plugin Ecosystem (25+ Plugins)

### Core Framework
- **lazy.nvim**: Modern plugin manager with lazy loading
- **snacks.nvim**: Dashboard, zen mode, notifications, LazyGit integration

### Completion & Snippets
- **blink.cmp**: Modern completion with dictionary/thesaurus support
- **LuaSnip**: Snippet engine with VSCode compatibility
- **friendly-snippets**: Pre-built snippet collection

### LaTeX & Academic
- **VimTeX**: Comprehensive LaTeX support
- **telescope-bibtex.nvim**: Citation management
- **chktex**: LaTeX linting and error checking

### Development
- **nvim-lspconfig**: Language server configuration
- **mason.nvim**: LSP server package manager
- **conform.nvim**: Code formatting
- **nvim-treesitter**: Syntax highlighting

### AI & Assistance
- **avante.nvim**: AI coding assistant
- **copilot.lua**: GitHub Copilot integration

### Navigation & UI
- **telescope.nvim**: Fuzzy finder with extensions
- **nvim-tree.lua**: File explorer
- **flash.nvim**: Enhanced navigation
- **which-key.nvim**: Keymap guide

### Git & Version Control
- **gitsigns.nvim**: Git decorations and hunk management
- **lazygit**: Git TUI integration

### Utilities
- **mini.nvim**: Surround, pairs, icons with LaTeX-specific features
- **yanky.nvim**: Enhanced yank/paste with history
- **undotree**: Visual undo history
- **session-manager**: Session persistence

## ⌨️ Key Mappings

**Leader Key**: `<Space>` | **Local Leader**: `\`

### Essential Commands
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>e` | Toggle NvimTree | File explorer |
| `<leader>w` | Write all | Save all buffers |
| `<leader>q` | Quit all | Exit Neovim |
| `<leader>,` | Dashboard | Return to start screen |
| `<leader>z` | Zen Mode | Distraction-free writing |

### Finding & Navigation
| Prefix | Group | Key Examples |
|--------|-------|--------------|
| `<leader>f` | **Find** | `ff` (files), `fb` (buffers), `fz` (citations), `ft` (text) |
| `<leader>g` | **Git** | `gg` (LazyGit), `gb` (branches), `gc` (commits) |
| `<leader>b` | **Buffers** | `bd` (delete), `bn`/`bp` (move), `bv`/`bh` (split) |

### LaTeX & Academic
| Prefix | Group | Key Examples |
|--------|-------|--------------|
| `<localleader>l` | **LaTeX** | `ll` (build), `lv` (view), `lc` (clean), `lw` (word count) |
| `<leader>T` | **Templates** | `Ta` (APA), `Tm` (MLA), `Tc` (Chicago), `Tn` (Notes) |
| `<leader>p` | **Pandoc** | `pd` (DOCX), `pm` (Markdown), `pt` (LaTeX) |

### AI & Tools
| Prefix | Group | Key Examples |
|--------|-------|--------------|
| `<leader>a` | **Avante AI** | `aa` (ask), `aC` (chat), `at` (toggle) |
| `<leader>l` | **LSP** | `ln`/`lp` (diagnostics), `lf` (telescope diagnostics) |
| `<leader>t` | **Tools** | `ts` (spell check), `tc` (toggle Copilot) |

## 📝 LaTeX Templates

Pre-configured templates for academic writing:

- **APA Format**: Standard and standalone versions
- **MLA Format**: Standard and standalone versions
- **Chicago Style**: Standard and standalone versions
- **Study Notes**: Optimized for note-taking
- **Figures & Tables**: APA-compliant scientific documents

Access via `<leader>T` + template key (e.g., `<leader>Ta` for APA)

## 🚀 Installation

### Prerequisites
- **Neovim** 0.9+ (required for modern features)
- **Git** (for plugin management)
- **Node.js** (for some LSP servers)
- **LaTeX Distribution** (TeX Live recommended)
- **Zathura** (PDF viewer for LaTeX)
- **Pandoc** (document conversion)

### Setup Steps

1. **Backup existing configuration**:
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Clone this configuration**:
   ```bash
   git clone <repository-url> ~/.config/nvim
   ```

3. **Launch Neovim**:
   ```bash
   nvim
   ```
   Lazy.nvim will automatically install all plugins on first launch.

4. **Install LSP servers** (optional):
   ```vim
   :Mason
   ```

### External Dependencies

For full functionality, install these system packages:

```bash
# LaTeX (Ubuntu/Debian)
sudo apt install texlive-full latexmk zathura

# Development tools
sudo apt install ripgrep fd-find pandoc

# Optional: Spell checking
sudo apt install aspell aspell-en

# Optional: For text-to-speech conversion
sudo apt install espeak-ng ffmpeg
```

### First-Time Setup Checklist

After installation, complete these steps:

1. **Launch Neovim**: Run `nvim` - plugins will auto-install
2. **Wait for completion**: Let Lazy.nvim finish installing all plugins
3. **Check LSP status**: Run `:Mason` to verify TeXLab is installed
4. **Test LaTeX**: Create a test file and run `<localleader>ll` to compile
5. **Configure Zotero path**: Update bibliography path in telescope config if needed
6. **Test AI**: Try `<leader>aa` to verify Avante is working
7. **Customize**: Adjust colorscheme with `<leader>C`

## ⚙️ Configuration

### Leader Keys
- **Leader**: `<Space>` (Space bar)
- **Local Leader**: `\` (Backslash)

### LaTeX Setup
- PDF viewer: Zathura (configured in VimTeX)
- Bibliography: `/home/ericfan/Documents/SFU-Coursework/Zotero.bib`
- Templates: `~/.config/nvim/templates/`

### AI Configuration
- Primary AI: Claude Sonnet (via Avante)
- Copilot: Manual trigger mode
- Dictionary/Thesaurus: Enabled for text files

## 🎨 Colorschemes

- **Primary**: Gruvbox (dark mode optimized)
- **Alternatives**: Catppuccin, Rose Pine, Vague
- **Switch**: `<leader>C` to browse colorschemes

## 📚 Detailed Usage Instructions

### 🎓 Complete Academic Writing Workflow

#### Step-by-Step: Writing Your First Paper

**1. Setup Your Working Directory**
```bash
mkdir ~/my-paper
cd ~/my-paper
nvim paper.tex
```

**2. Choose and Load a Template**
- Press `<leader>T` (Space + T) to open template menu
- Choose your citation style:
  - `a` → APA Paper (includes title page, abstract, references)
  - `A` → APA Standalone (minimal APA format)
  - `m` → MLA Paper (header, works cited)
  - `c` → Chicago Paper (title page, bibliography)
  - `n` → Notes template (simple note-taking format)
- Template loads automatically with proper structure

**3. Configure Your Document**
After loading template, customize the header information:
```latex
\title{Your Paper Title}
\author{Your Name}
\date{\today}
```

**4. Start Writing**
- Use `<leader>z` to enter Zen Mode for distraction-free writing
- Enable spell check with `<leader>ts`
- Fix spelling errors with `<leader>c` or `<Ctrl>l` in insert mode

#### Working with Citations - Step by Step

**1. Search for Citations**
- Press `<leader>fz` to open BibTeX search
- Type keywords (author name, title, year)
- Use arrow keys to navigate results

**2. Insert Citations**
- `<Enter>` → Inserts citation key: `\cite{author2023key}`
- `<C-e>` → Inserts full bibliography entry
- `<C-c>` → Inserts formatted citation: "Author (2023), Title."

**3. Build with Bibliography**
- Save your file: `<leader>w`
- Build PDF: `<localleader>ll` (backslash + ll)
- View result: `<localleader>lv`

#### LaTeX Document Management - Complete Process

**1. Writing Phase**
```
<localleader>ll    # Compile document
<localleader>lv    # View PDF in Zathura
<localleader>lw    # Quick word count
```

**2. Editing Phase**
```
<localleader>le    # Check for errors
<localleader>lc    # Clean auxiliary files
<localleader>lW    # Detailed section word count
```

**3. Final Review**
- Use `<localleader>lW` for section-by-section word counts
- Check `<localleader>le` for any remaining errors
- Clean up with `<localleader>lc` before submission


### 🤖 AI Assistant Usage

#### Avante AI (Primary Assistant)
**Quick Commands:**
- `<leader>aa` - Ask questions about code or writing
- `<leader>aC` - Start persistent chat session
- `<leader>at` - Toggle Avante sidebar
- `<leader>af` - Focus on chat input
- `<leader>a?` - Select AI model (Claude, DeepSeek, Moonshot)
- `<leader>ac` - Clear chat history
- `<leader>az` - Zen mode for AI interaction

**Usage Tips:**
- Select text in visual mode, then `<leader>aa` to ask about selection
- Use `<leader>aB` to add all open buffers to context
- `<leader>aR` shows repository structure to AI

#### GitHub Copilot
- `<leader>tc` - Toggle auto-suggestions
- `<Alt>l` - Accept suggestion
- Set to manual mode by default - use descriptive comments to guide suggestions

### 📝 Document Conversion with Pandoc

Convert documents to various formats with citations included:
- `<leader>pd` - To Word (.docx)
- `<leader>pm` - To Markdown (.md)
- `<leader>pt` - To LaTeX (.tex)
- `<leader>pT` - To Text + Audio (.txt + .mp3)

### 🔍 Finding and Navigation

**File Management:**
- `<leader>ff` - Find files in project
- `<leader>fb` - Search open buffers
- `<leader>fr` - Recent files
- `<leader>fc` - Quick access to Neovim config
- `<leader>ft` - Live grep in files

**Navigation:**
- `<leader>e` - Toggle NvimTree file explorer
- `<Tab>` / `<Shift-Tab>` - Navigate between buffers
- `s` + characters - Jump anywhere (Flash.nvim)
- `<leader>fu` - Visual undo tree

### 💾 Session and Buffer Management

**Sessions:**
- `<leader>Ss` - Save current session
- `<leader>Sl` - Load saved session
- `<leader>Sd` - Delete session

**Buffers:**
- `<leader>bd` - Close buffer
- `<leader>bn` / `<leader>bp` - Move buffer left/right
- `<leader>bv` / `<leader>bh` - Split buffer vertically/horizontally
- `<leader>bP` - Pin buffer

### 🎨 Themes and Spell Checking

**Colorschemes:**
- `<leader>C` - Browse and select themes
- Available: Gruvbox (default), Catppuccin, Rose Pine, Vague

**Spell Checking:**
- `<leader>ts` - Toggle spell check
- `<leader>c` - Fix word under cursor
- `<Ctrl>l` in insert mode - Fix last misspelled word

### 🔧 Advanced Features

#### Surround Operations (Mini.surround)
LaTeX-specific surroundings using `gsa` + character:
- `e` - `\begin{equation}...\end{equation}`
- `A` - `\begin{align}...\end{align}`
- `I` - `\begin{itemize}...\end{itemize}`
- `E` - `\begin{enumerate}...\end{enumerate}`
- `b` - `\textbf{...}` (bold)
- `i` - `\textit{...}` (italic)
- `$` - `$...$` (math mode)

#### Git Integration
- **LazyGit**: `<leader>gg` - Full Git interface
- **Git status**: `<leader>gs` - View changes
- **Hunk navigation**: `<leader>gj` (next), `<leader>gk` (previous)
- **Preview hunk**: `<leader>gp`
- **Blame line**: `<leader>gl`

### 🚨 Troubleshooting Common Issues

#### LaTeX Problems
- **PDF not updating**: Check `<localleader>le` for compilation errors
- **Bibliography not working**: Ensure Zotero.bib path is correct in telescope config
- **Slow compilation**: Use `<localleader>lc` to clean auxiliary files

#### Completion Issues
- **No completions**: Check if LSP is running with `:LspInfo`
- **Missing dictionary**: Install `aspell` and `aspell-en` packages
- **Slow completions**: Restart Neovim or run `:Mason` to update servers

#### AI Assistant Problems
- **Avante not responding**: Check internet connection and API keys
- **Copilot not working**: Run `:Copilot status` and authenticate if needed

### ⚡ Quick Reference

#### Essential Daily Commands
```
<Space>e     - File explorer
<Space>ff    - Find files
<Space>fz    - Find citations
<Space>,     - Dashboard
<Space>w     - Save all
<Space>q     - Quit
\ll          - Build LaTeX
\lv          - View PDF
<Space>aa    - Ask AI
<Space>gg    - Git interface
<Space>z     - Zen mode
```

#### LaTeX Template Quick Access
```
<Space>Ta    - APA Paper
<Space>Tm    - MLA Paper
<Space>Tc    - Chicago Paper
<Space>Tn    - Notes template
<Space>Ts    - Study notes
```

#### Document Conversion
```
<Space>pd    - To Word (.docx)
<Space>pm    - To Markdown (.md)
<Space>pt    - To LaTeX (.tex)
<Space>pT    - To Text + Audio (.txt + .mp3)
```

### 📋 Common Daily Workflows

#### Morning Routine (Starting Work)
1. **Open Neovim**: `nvim`
2. **Access dashboard**: `<leader>,` (if not already shown)
3. **Load previous session**: `<leader>Sl` or start new project
4. **Check git status**: `<leader>gs` to see what changed
5. **Open file explorer**: `<leader>e` to navigate files

#### Academic Paper Writing Session
1. **Create new paper**: `mkdir ~/new-paper && cd ~/new-paper && nvim paper.tex`
2. **Load template**: `<leader>T` + format key (`a` for APA, `m` for MLA, etc.)
3. **Enter zen mode**: `<leader>z` for distraction-free writing
4. **Enable spell check**: `<leader>ts`
5. **Find citations**: `<leader>fz` when you need to cite sources
6. **Build and view**: `<localleader>ll` to compile, `<localleader>lv` to view PDF
7. **Get AI help**: `<leader>aa` for writing assistance
8. **Save session**: `<leader>Ss` before closing

#### Research and Note-Taking
1. **Open notes template**: `<leader>Tn` for notes format
2. **Use AI for research**: `<leader>aC` to start chat for explanations
3. **Search existing notes**: `<leader>ft` to search across files
4. **Create citations**: `<leader>fz` to find and insert references
5. **Convert to different formats**: `<leader>p` + format for sharing

#### Code Development Session
1. **Open file explorer**: `<leader>e`
2. **Find files quickly**: `<leader>ff`
3. **Check LSP status**: Run `:LspInfo` if completions aren't working
4. **Git workflow**: `<leader>gg` for LazyGit interface
5. **Use Copilot**: `<leader>tc` to toggle suggestions
6. **Format code**: Automatic with Conform.nvim on save

#### End of Day Routine
1. **Save all work**: `<leader>w`
2. **Clean LaTeX files**: `<localleader>lc` in any tex files
3. **Commit changes**: `<leader>gg` to open LazyGit
4. **Save session**: `<leader>Ss` to preserve current state
5. **Exit cleanly**: `<leader>q`

## 🤝 Customization

This configuration is designed to be modular. Key customization points:

- **Plugins**: Add new configurations in `lua/plugins/`
- **Keymaps**: Extend `lua/plugins/which-key.lua`
- **Templates**: Add LaTeX templates in `templates/`
- **Snippets**: Custom snippets in `lua/snippets/`
- **Options**: Core settings in `lua/config/options.lua`

## 📄 License

