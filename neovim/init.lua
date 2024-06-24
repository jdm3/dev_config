-- ----------------------------------------------------------------------------
-- Options
-- ----------------------------------------------------------------------------

vim.g.mapleader = ","
vim.g.maplocalleader = ","

vim.opt.backspace = "indent,eol,start"  -- allow backspace over these elements

vim.opt.textwidth = 100                 -- width of line for break/wrap functions

vim.opt.expandtab = true                -- convert tabs to spaces when editing
vim.opt.tabstop = 4                     -- number of spaces used for tab character read from file
vim.opt.shiftwidth = 4                  -- how many columns reindent operations (e.g., >>) shift the text
vim.opt.softtabstop = 4                 -- number of spaces used for tab character written while editing

vim.autoread = true                     -- automatically read file changes made outside of vim
vim.hidden = true                       -- hide abandonded buffers instead of unloading them (required by toggleterm)

vim.opt.background = "dark"
vim.opt.cursorline = true               -- highlight line with cursor
vim.opt.incsearch = true                -- start searching as characters are entered
vim.opt.hlsearch = true                 -- highlight search results
vim.opt.inccommand = "split"            -- show off-screen substitute results in a preview window
vim.opt.mouse = "a"                     -- enable mouse support in all  modes
vim.opt.scrolloff = 5                   -- how many lines to keep above/below the cursor
vim.opt.showcmd = false                 -- don't show last command
vim.opt.showmode = false                -- don't show mode in last line since it's already in status line
vim.opt.signcolumn = "no"               -- don't show sign column
vim.opt.termguicolors = true            -- enable 24-bit color
vim.opt.wrap = false                    -- don't wrap lines
vim.opt.winminheight = 0                -- min height of non-current window
vim.opt.winheight = 999                 -- set large winheight to maximize current vertical pane

-- show line numbers, but use relative line numbers on non-current line in current buffer
vim.opt.number = true                   -- show line numbers
--vim.opt.relativenumber = true           -- show relative line numbers on non-current line
vim.api.nvim_create_autocmd(
    { "BufEnter", "FocusGained", "InsertLeave", "WinEnter" },
    { callback = function() vim.opt.relativenumber = true end, })
vim.api.nvim_create_autocmd(
    { "BufLeave", "FocusLost", "InsertEnter", "WinLeave" },
    { callback = function() vim.opt.relativenumber = false end, })

-- reduce updatetime for hover operations, and disable swapfile to prevent file flush every updatetime.
vim.opt.updatetime = 250
vim.opt.swapfile = false

-- Highlight tabs and trailing whitespace
vim.opt.list = true
vim.opt.listchars = {
    tab = "» ",
    trail = "␣",
}

vim.fn.matchadd("ErrorMsg", "\\s\\+$")

-- indentation.  c file types will set vim.opt.cindent=true
vim.opt.cinoptions = ":0,l1,g0,N-s,E-s,(0,j1"

-- forced formatoptions regardless of filetype
vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        vim.opt_local.formatoptions = {
            j = true, -- remove comment leader when joining lines
            q = true, -- allow formatting with gq
            c = true, -- auto-wrap comments using textwidth
            --t = true, -- auto-wrap text using textwidth
            l = true, -- don't break long lines if edit started past textwidth
        }
    end,
})

-- configure diagnostics
vim.diagnostic.config({
    signs = false,
    underline = true,
    virtual_text = {
        prefix = function(diagnostic)
            if diagnostic.severity == vim.diagnostic.severity.ERROR then
                return ""
            elseif diagnostic.severity == vim.diagnostic.severity.WARN then
                return ""
            else
                return ""
            end
        end,
    },
    update_in_insert = true,
    severity_sort = true,
})

-- configure LSP
vim.lsp.config("clangd", {
    cmd = {
        "clangd",
        "--header-insertion=never",
    },
    filetypes = { "c", "cpp", "cuda", "proto" },
    root_markers = {
        ".clangd",
        ".clang-tidy",
        ".clang-format",
        ".git",
        "compile_commands.json",
        "build/compile_commands.json",
        "compile_flags.txt",
        "CMakeLists.txt"
    },
})

vim.lsp.enable("clangd")

-- disable middle mouse button paste
vim.keymap.set({ "i", "n"}, "<MiddleMouse>", "<nop>", { desc = "Middle mouse button does nothing" })

-- shortcuts for moving between windows
vim.keymap.set("n", "<C-J>", "<C-W>j", { desc = "Switch to below pane" })
vim.keymap.set("n", "<C-K>", "<C-W>k", { desc = "Switch to above pane" })
vim.keymap.set("n", "<C-H>", "<C-W>h", { desc = "Switch to right pane" })
vim.keymap.set("n", "<C-L>", "<C-W>l", { desc = "Switch to left pane" })

---- shortcuts for opening CodeCompanionChat
--vim.keymap.set("n", "<leader>cc", ":CodeCompanionChat<cr>", { noremap = true, silent = true, desc = "Open CodeCompanion Chat" })
--vim.cmd([[cab cc CodeCompanion]]) -- Expand 'cc' into 'CodeCompanion' in the command line

-- jump to prev/next TODO comment
vim.keymap.set("n", "]t", function() require("todo-comments").jump_next() end, { desc = "Next todo comment" })
vim.keymap.set("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Previous todo comment" })
vim.keymap.set("n", "<leader>ft", "<cmd>:TodoTelescope<cr>",                   { desc = "Find todo comment" })

-- Default diagnistic key mappings:
--     ]d      Jump to the next diagnostic in the current buffer (Normal mode).
--     [d      Jump to the previous diagnostic in the current buffer (Normal mode).
--     [D      Jump to the first diagnostic in the current buffer (Normal mode).
--     ]D      Jump to the last diagnostic in the current buffer (Normal mode).
--     <C-w>d  Open a floating window with the diagnostic message at the cursor's location (Normal mode). 

-- Default LSP key mappings:
--     grn   vim.lsp.buf.rename(),          (Normal mode).
--     gra   vim.lsp.buf.code_action(),     (Normal or visual mode).
--     grr   vim.lsp.buf.references(),      (Normal mode).
--     gri   vim.lsp.buf.implementation(),  (Normal mode).
--     grt   vim.lsp.buf.type_definition(), (Normal mode).
--     <C-S> vim.lsp.buf.signature_help(),  (Insert mode).

vim.keymap.set("n", "gd",         vim.lsp.buf.definition,  { desc = "Goto Definition" })
vim.keymap.set("n", "gD",         vim.lsp.buf.declaration, { desc = "Goto Declaration" })
vim.keymap.set("n", "K",          vim.lsp.buf.hover,       { desc = "Hover Documentation" })
vim.keymap.set("v", "<leader>g",  vim.lsp.buf.format,      { desc = "Format Selection" })

-- ----------------------------------------------------------------------------
-- Lazy manager and plugins
-- ----------------------------------------------------------------------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

    -- -------------------------------------------------------------------------
    -- Color schemes
    "AlexvZyl/nordic.nvim",
    "cocopon/iceberg.vim",
    "mcchrish/zenbones.nvim",
    "rktjmp/lush.nvim", -- required by zenbones
    "sonph/onehalf",

    -- -------------------------------------------------------------------------
    -- File types
    "beyondmarc/hlsl.vim",
    "heaths/vim-msbuild",
    "kbenzie/vim-spirv",
    "petRUShka/vim-opencl",
    "rhysd/vim-llvm",

    -- -------------------------------------------------------------------------
    -- Startup greeter
    {
        "goolord/alpha-nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", },
        config = function()
            local alpha = require("alpha")
            local startify = require("alpha.themes.startify")

            startify.section.header.val = { "neovim" }
            startify.section.top_buttons.val = {
                startify.button( "e", " New file", "<cmd>ene<cr>"),
            }

            alpha.setup(startify.config)
        end,
    },

    -- -------------------------------------------------------------------------
    -- Status line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            sections = {
                lualine_z = { "%c" }, -- just column number instead of line:col
            },
        },
    },

    -- -------------------------------------------------------------------------
    -- terminal windows
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        opts = {
        },
    },

    -- -------------------------------------------------------------------------
    -- TODO etc comments
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim", },
        opts = {
            signs = false,
        },
    },

    -- -------------------------------------------------------------------------
    -- Binary hex editor
    --[[
    {
        "RaafatTurki/hex.nvim",
        opts = {
            dump_cmd = "xxd -g 4 -c 32",
        },
    },
    --]]

    -- -------------------------------------------------------------------------
    -- Search tool for files, words, etc.
    --[[
    <C-n>/<Down>  Next item
    <C-p>/<Up>    Previous item
    j/k           Next/previous (in normal mode)
    H/M/L         Select High/Middle/Low (in normal mode)
    gg/G          Select the first/last item (in normal mode)
    <CR>          Confirm selection
    <C-o>         Go to file selection as a split
    <C-v>         Go to file selection as a vsplit
    <C-t>         Go to a file in a new tab
    <C-u>         Scroll up in preview window
    <C-d>         Scroll down in preview window
    <C-f>         Scroll left in preview window
    <C-k>         Scroll right in preview window
    <M-f>         Scroll left in results window
    <M-k>         Scroll right in results window
    <C-/>         Show mappings for picker actions (insert mode)
    ?             Show mappings for picker actions (normal mode)
    <C-c>         Close telescope (insert mode)
    <Esc>         Close telescope (in normal mode)
    <Tab>         Toggle selection and move to next selection
    <S-Tab>       Toggle selection and move to prev selection
    <C-q>         Send all items not filtered to quickfixlist (qflist)
    <M-q>         Send all selected items to qflist
    <C-r><C-w>    Insert cword in original window into prompt (insert mode)
    --]]
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-fzf-native.nvim", build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build" },
            { "nvim-telescope/telescope-ui-select.nvim" },
            { "nvim-tree/nvim-web-devicons" },
        },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            local builtin = require("telescope.builtin")

            telescope.setup({
                defaults = {
                    layout_strategy = "horizontal",
                    layout_config = { height = 0.9, width = 0.9, },
                    path_display = { "truncate" },
                    mappings = {
                        i = {
                            ["<esc>"] = actions.close,
                            -- <C-q> open in quickfix
                            ["<C-o>"] = actions.select_horizontal, -- use <C-o> instead of <C-x> for open horizontal
                            ["<C-x>"] = false,
                        },
                    },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown(),
                    },
                },
            })

            pcall(telescope.load_extension, "fzf")
            pcall(telescope.load_extension, "ui-select")

            vim.keymap.set("n", "<leader>ff", builtin.find_files,  { desc = "Find files in cwd" })
            vim.keymap.set("n", "<leader>fg", builtin.live_grep,   { desc = "Find string in cwd" })
            vim.keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Find string under cursor in cwd" })
            vim.keymap.set("n", "<leader>fh", builtin.help_tags,   { desc = "Find help tags" })
            vim.keymap.set("n", "<leader>fu", "<cmd>lua require('telescope.builtin').colorscheme({ enable_preview = true })<cr>", { desc = "Find color scheme" })
            vim.keymap.set("n", "<leader>fd", "<cmd>lua require('telescope.builtin').diagnostics({ bufnr=0 })<cr>",               { desc = "Find buffer diagnostics" })
        end,
    },

    -- -------------------------------------------------------------------------
    -- AST-based code syntax, indenting, etc.
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPre", "BufNewFile" }, -- events to trigger lazy load
        config = function()
            require("nvim-treesitter.configs").setup({
                highlight = { enable = true },
                indent = { enable = false },
                auto_install = true,
                ensure_installed = {
                    "c",
                    "c_sharp",
                    "cmake",
                    "cpp",
                    "csv",
                    "diff",
                    "dot",
                    "git_config",
                    "git_rebase",
                    "gitattributes",
                    "gitcommit",
                    "gitignore",
                    "glsl",
                    "hlsl",
                    "html",
                    "llvm",
                    "lua",
                    "markdown",
                    "markdown_inline",
                    "python",
                    "vim",
                    "vimdoc",
                    "xml",
                    "yaml",
                },
            })
        end,
    },

    -- -------------------------------------------------------------------------
    -- Text completion
    {
        "saghen/blink.cmp",
        version = "1.4.1",
        dependencies = {
            "fang2hou/blink-copilot",
        },
        opts = {
            keymap = { preset = "super-tab" },
            appearance = { nerd_font_variant = "mono" },
            signature = { enabled = true },
            completion = {
                keyword = { range = "full" },
                documentation = { auto_show = true },
                ghost_text = { enabled = false }
            },
            cmdline = {
                keymap = { preset = "inherit" },
                completion = { menu = { auto_show = true } },
            },
            sources = {
                default = { "lsp", "path", "buffer", "copilot" },
                providers = {
                    lsp = { fallbacks = {} },
                    path = { fallbacks = {} },
                    copilot = {
                        name = "copilot",
                        module = "blink-copilot",
                        score_offset = 10,
                        async = true,
                    },
                },
            },
            fuzzy = { implementation = "prefer_rust_with_warning" }
        },
        opts_extend = { "sources.default" }
    },

    -- -------------------------------------------------------------------------
    -- AI
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        opts = {
            suggestion = { enabled = false }, -- handled by fang2hou/blink-copilot
            panel = { enabled = false }, -- handled by fang2hou/blink-copilot
            filetypes = {
                c = true,
                cs = true,
                cpp = true,
                lua = true,
                markdown = true,
                python = true,
            },
        },
    },

    --[[
    {
        "olimorris/codecompanion.nvim",
        version = "17.7.0",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {
        },
    },
    --]]

    },

    -- -------------------------------------------------------------------------
    -- Lazy options:
    {
    })

-- -------------------------------------------------------------------------
-- Set default color scheme, must be after lazy setup
vim.cmd([[colorscheme iceberg]])

