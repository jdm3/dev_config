-- ----------------------------------------------------------------------------
-- Options
-- ----------------------------------------------------------------------------

vim.cmd("let g:netrw_liststyle = 3")    -- Use tree style for explorer

vim.g.mapleader = ","
vim.g.maplocalleader = ","

vim.opt.autoindent = true               -- auto-indent new line
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
vim.opt.signcolumn = "yes"              -- show sign column
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

-- show whitespace
vim.opt.list = true
vim.opt.listchars = {
    tab = "» ",
    trail = "␣",
    nbsp = "␣",
}

-- forced formatoptions regardless of filetype
vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        vim.opt_local.formatoptions = {
            j = true, -- remove comment leader when joining lines
            q = true, -- allow formatting with gq
            c = true, -- auto-wrap comments using  textwidth
            --t = true, -- auto-wrap text using  textwidth
            l = true, -- don't break long lines if edit started past textwidth
        }
    end,
})

-- keymap to clear serach-highlighted text on esc
vim.keymap.set("n", "<esc>", "<cmd>nohl<cr>", { desc = "Clear search highlights" })

-- disable middle mouse button paste
vim.keymap.set({ "i", "n"}, "<MiddleMouse>", "<nop>", { desc = "Middle mouse button does nothing" })


-- " These keywords start an extra indent in the next line
-- set cinwords=

-- " :N   place case labels N characters from indent of the switch
-- " lN   if non-zero, align with case label instead of statement after it
-- " gN   place C++ scope declarations N characters from indent of block they are in
-- " (N   when in unclosed parentheses, indent N characters from the line (add shiftwidth)
-- "...
-- set cinoptions=:0,l1,g0,(0,u0,U1,w1,Ws,M1,c0,C1


-- "set smartindent
-- "set smarttab
-- set history=50                  " Keep 50 lines of command line history
-- set nofixendofline              " don't add end-of-line at the end of the file

-- " Treat .cshtml files as html syntax
-- autocmd BufReadPost *.cshtml set syntax=html

-- " Remove CTRL-X mapping (set to cut-to-clipboard on windows) so we can use it
-- " for number decrement
-- silent! unmap <C-x>

-- " Enable syntax highlighting keeping current color settings (use syntax on to
-- " overrule settings with defaults)
-- syntax enable
-- set background=dark
-- nmap <leader>l :set background=light<cr>
-- nmap <leader>d :set background=dark<cr>

-- " Diff/merge
-- nmap <leader>n ]c
-- nmap <leader>p [c

-- if &diff
--     nmap <leader>u :update<cr>
--     nmap <leader>q :update<cr>:qa<cr>
--     nmap <leader>1 :diffget 1<cr>]c
--     nmap <leader>2 :diffget 2<cr>]c
--     nmap <leader>3 :diffget 3<cr>]c
--     autocmd VimResized * wincmd =
-- else
--     " When editing a file, jump to last known cursor position unless the
--     " position is invalid or inside an event handler (which happens when
--     " dropping a file onto gvim icon in windows).
--     autocmd BufReadPost *
--     \ if line("'\"") > 0 && line("'\"") <= line("$") |
--     \   exe "normal g`\"" |
--     \ endif
-- endif


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
    {
        "AlexvZyl/nordic.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("nordic").load()
        end,
    },
    { "mcchrish/zenbones.nvim" },
    { "rktjmp/lush.nvim" }, -- required by zenbones

    -- -------------------------------------------------------------------------
    -- File types
    "beyondmarc/hlsl.vim",
    "rhysd/vim-llvm",
    "heaths/vim-msbuild",
    "petRUShka/vim-opencl",
    "kbenzie/vim-spirv",

    -- -------------------------------------------------------------------------
    -- Keymaps to minimize/maximize panes
    {
        "szw/vim-maximizer",
        keys = {
            { "<leader>_", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize pane" },
            { "<C-J>",     "<C-W>j",                   desc = "Switch to next pane below" },
            { "<C-K>",     "<C-W>k",                   desc = "Switch to next pane above" },
            { "<C-H>",     "<C-W>h",                   desc = "Switch to next pane right" },
            { "<C-L>",     "<C-W>l",                   desc = "Switch to next pane left" },
            { "<leader>=", "<C-W>=",                   desc = "Balance pane size" },
        },
    },

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
    -- Diagnostics helper
    {
        "folke/trouble.nvim",
        branch = "dev",
        config = function()
            local trouble = require("trouble")
            trouble.setup({
            })

            -- Change the Diagnostic symbols in the sign column ┊┋┃║󰠠
            vim.fn.sign_define("DiagnosticSignError", { texthl = "DiagnosticSignError", numnl = "", text = "┃" })
            vim.fn.sign_define("DiagnosticSignWarn",  { texthl = "DiagnosticSignWarn",  numnl = "", text = "┃" })
            vim.fn.sign_define("DiagnosticSignHint",  { texthl = "DiagnosticSignHint",  numnl = "", text = "┃" })
            vim.fn.sign_define("DiagnosticSignInfo",  { texthl = "DiagnosticSignInfo",  numnl = "", text = "┃" })
        end
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
        branch = "0.1.x",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-fzf-native.nvim", build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build" },
            { "nvim-telescope/telescope-ui-select.nvim" },
            { "nvim-tree/nvim-web-devicons" },
        },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")

            telescope.setup({
                defaults = {
                    border = false,
                    path_display = { "truncate" },
                    layout_config = {
                        horizontal = {
                            width = { padding = 0 },
                            height = { padding = 0 },
                        },
                    },
                    mappings = {
                        i = {
                            ["<C-o>"] = actions.select_horizontal, -- use <C-o> instead of <C-x> for open horizintal
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

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", builtin.find_files,  { desc = "Find files in cwd" })
            vim.keymap.set("n", "<leader>fg", builtin.live_grep,   { desc = "Find string in cwd" })
            vim.keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Find string under cursor in cwd" })
            vim.keymap.set("n", "<leader>fh", builtin.help_tags,   { desc = "Find help tags" })
            vim.keymap.set("n", "<leader>fu", "<cmd>lua require('telescope.builtin').colorscheme({ enable_preview = true })<cr>", { desc = "Find color scheme" })
        end,
    },

    -- -------------------------------------------------------------------------
    -- AST-based code syntax, indenting, etc.
    {
        "nvim-treesitter/nvim-treesitter",
        --event = { "BufReadPre", "BufNewFile" },
        build = ":TSUpdate",
        --dependencies = {
        --    "windwp/nvim-ts-autotag",
        --},
        config = function()
            local treesitter = require("nvim-treesitter.configs")
            treesitter.setup({
                highlight = { enable = true },
                indent = { enable = true },
                autotag = { enable = true },
                auto_install = true,
                ensure_installed = {
                    "c",
                    "c_sharp",
                    "cmake",
                    "cpp",
                    "csv",
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
                --incremental_selection = {
                --    enable = true,
                --    keymaps = {
                --        init_selection = "<C-space>",
                --        node_incremental = "<C-space>",
                --        scope_incremental = false,
                --        node_decremental = "<bs>",
                --    },
                --},
            })
        end,
    },

    -- -------------------------------------------------------------------------
    -- Text completion
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            { "L3MON4D3/LuaSnip", build = "" }, -- snippet engine
            "saadparwaiz1/cmp_luasnip",         -- source luasnip
            "hrsh7th/cmp-nvim-lsp",             -- source text from LSP
            "hrsh7th/cmp-buffer",               -- source text from currently open buffers
            "hrsh7th/cmp-path",                 -- source file system paths
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            luasnip.config.setup({})

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                completion = {
                    completeopt = "menu,menuone,noinsert",
                },
                sources = { -- autocompletion sources
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "path" },
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-l>"] = cmp.mapping(function()
                        if luasnip.expand_or_locally_jumpable() then
                            luasnip.expand_or_jump()
                        end
                    end, { "i", "s" }),
                    ["<C-h>"] = cmp.mapping(function()
                        if luasnip.locally_jumpable(-1) then
                          luasnip.jump(-1)
                        end
                    end, { "i", "s" }),
                }),
            })
        end,
    },

    -- -------------------------------------------------------------------------
    {
      "neovim/nvim-lspconfig",
      dependencies = {
          { "hrsh7th/cmp-nvim-lsp", },
      },
      config = function()

        -- LspAttach runs every time a buffer is attached to a lsp
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local telescope = require("telescope.builtin")

                -- Disable formatting through LSP
                vim.bo[ev.buf].formatexpr = nil

                -- Note: use <C-t> to go back
                vim.keymap.set("n", "gd",         telescope.lsp_definitions,                { buffer = ev.buf, desc = "[G]oto [D]efinition" })
                vim.keymap.set("n", "gD",         vim.lsp.buf.declaration,                  { buffer = ev.buf, desc = "[G]oto [D]eclaration" })
                vim.keymap.set("n", "gr",         telescope.lsp_references,                 { buffer = ev.buf, desc = "[G]oto [R]eferences" })
                vim.keymap.set("n", "gI",         telescope.lsp_implementations,            { buffer = ev.buf, desc = "[G]oto [I]mplementation" })
                vim.keymap.set("n", "gt",         telescope.lsp_type_definitions,           { buffer = ev.buf, desc = "[G]oto [T]ype definition" })
                vim.keymap.set("n", "<leader>ds", telescope.lsp_document_symbols,           { buffer = ev.buf, desc = "Find all [D]ocument [S]ymbols" })
                vim.keymap.set("n", "<leader>ws", telescope.lsp_dynamic_workspace_symbols,  { buffer = ev.buf, desc = "Find all [W]orkspace [S]ymbols" })
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename,                       { buffer = ev.buf, desc = "[R]e[n]ame" })
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action,                  { buffer = ev.buf, desc = "[C]ode [A]ction" })
                vim.keymap.set("n", "K",          vim.lsp.buf.hover,                        { buffer = ev.buf, desc = "Hover Documentation" })

                vim.keymap.set("n", "<leader>D",  "<cmd>Telescope diagnostics bufnr=0<CR>", { buffer = ev.buf, desc = "Show buffer diagnostics" })
                --vim.keymap.set("n", "<leader>d",  vim.diagnostic.open_float,                { buffer = ev.buf, desc = "Show line diagnostics" })
                vim.keymap.set("n", "[d",         vim.diagnostic.goto_prev,                 { buffer = ev.buf, desc = "Go to previous diagnostic" })
                vim.keymap.set("n", "]d",         vim.diagnostic.goto_next,                 { buffer = ev.buf, desc = "Go to next diagnostic" })

                --[[
                vim.keymap.set("n", "[d",        vim.diagnostic.goto_prev,  { desc = "Go to previous [D]iagnostic message" })
                vim.keymap.set("n", "]d",        vim.diagnostic.goto_next,  { desc = "Go to next [D]iagnostic message" })
                vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
                vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
                --]]

                -- Highlight references of the word under your cursor after updatetime
                local client = vim.lsp.get_client_by_id(ev.data.client_id)
                if client and client.server_capabilities.documentHighlightProvider then
                    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                        buffer = ev.buf,
                        callback = vim.lsp.buf.document_highlight,
                    })

                    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                        buffer = ev.buf,
                        callback = vim.lsp.buf.clear_references,
                    })
                end
            end,
        })

        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        -- Merge Neovim and nvim-cmp LSP capabilities
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend("force", capabilities, cmp_nvim_lsp.default_capabilities())

        -- Setup clangd
        lspconfig.clangd.setup({
            capabilities = capabilities,
        })

      end,
    }
    },

    -- -------------------------------------------------------------------------
    -- Lazy options:
    {
    })
