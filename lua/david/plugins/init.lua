--putting plugins that dont need that much config in here
return{
    {
        -- highlights for gentoo specific config files
        "gentoo/gentoo-syntax",
        lazy=true,
        ft={
            "gentoo-package-use",
            "gentoo-package-keywords",
            "gentoo-package-mask",
            "gentoo-make-conf"
        },
    },
    {
        -- adds a colored bar after a specified number of characters
        "m4xshen/smartcolumn.nvim", 
        event={"BufReadPre","BufNewFile"},
        config=function()
            local smartcolumn=require("smartcolumn")
            smartcolumn.setup{
                colorcolumn="80",
                scope="line",
                disabled_filetypes={
                    "help",
                    "text",
                    "markdown",
                    "alpha",
                    "NvimTree",
                    "trouble",
                    "Lazy",
                    "Mason",
                }
            }
        end
    },
    {
        -- git integration for buffers
        "lewis6991/gitsigns.nvim",
        event="VeryLazy",
        config=function()
            local gitsigns=require('gitsigns')
            gitsigns.setup()
        end
    },
    {
        -- powerful formatting using the buffer
        "stevearc/conform.nvim",
        event={"BufReadPre","BufNewFile"},
        config=function()
            local conform=require("conform")
            conform.setup{
                formatters_by_ft={
                    lua={"stylua"},
                    python={"black"},
                    rust={"rustfmt"},
                    javascript={"prettierd","prettier"},
                    c={"clang-format"},
                    cpp={"clang-format"},
                    sh={"shfmt"},
                    go={"gofupmt"},
                    cmake={"cmake"}
                }
            }
        end
    },
    {
        -- code linter, linter = tool to find bugs/style issues with code
        "mfussenegger/nvim-lint",
        event={"BufReadPre","BufNewFile"},
        config=function()
            local lint=require("lint")

            lint.linters_by_ft={
                markdown={},
            }

            local lint_augroup=vim.api.nvim_create_augroup("lint", {clear=true})
            vim.api.nvim_create_autocmd(
                {"BufEnter", "BufWritePost", "InsertLeave"},
                {
                    group=lint_augroup,
                    callback=function()
                        lint.try_lint()
                    end
                }
            )
        end
    },
    {
        -- better pane management/wezterm integration
        "mrjones2014/smart-splits.nvim",
        lazy=false,
        config=function()
            local split=require("smart-splits")
            split.setup{}
        end
    },
    {
        -- helpful ui for locating warnings/errors
        "folke/trouble.nvim",
        event="VeryLazy",
        dependencies={"folke/todo-comments.nvim"},
        config=function()
            local trouble=require("trouble")
            trouble.setup()
        end
    },
    {
        -- makes folds better on nvim
        "kevinhwang91/nvim-ufo",
        dependencies="kevinhwang91/promise-async",
        event="VeryLazy",
        config=function()
            local ufo=require("ufo")
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true
            }
            local language_servers = vim.lsp.get_clients() -- or list servers manually like {'gopls', 'clangd'}
            for _, ls in ipairs(language_servers) do
                require('lspconfig')[ls].setup({
                    capabilities = capabilities
                    -- you can add other fields for setting up lsp server in this table
                })
            end
            ufo.setup()
            --autocmd to stop folds from opening in certain buffer types
            vim.api.nvim_create_autocmd('FileType', {
                pattern = { 'neo-tree' },
                callback = function()
                    require('ufo').detach()
                    vim.opt_local.foldenable = false
                    vim.opt_local.foldcolumn = '0'
                end,
            })
        end
    },
    {
        -- tool to flag directories as 'projects' to locate them easier
        "ahmedkhalf/project.nvim",
        config=function()
            local project=require("project_nvim")
            project.setup{
                detection_methods={"lsp", "pattern"},
                patterns={
                    ".git",
                    "_darcs",
                    ".hg",
                    ".bzr",
                    ".svn",
                    "Makefile",
                    "package.json",
                },
                exclude_dirs={"~/", "~/code/srcbuilds/"},
                silent_chdir=false,
                scope_chdir="global",
                datapath=vim.fn.stdpath("data"),
            }
        end
    },
    --    {
    --        -- discord integration, let everyone see wtf is up
    --        'vyfor/cord.nvim',
    --        build = './build || .\\build',
    --        event = 'VeryLazy',
    --        opts = {}, -- calls require('cord').setup()
    --    },
    {
        -- simple hex editing utilities within neovim
        'RaafatTurki/hex.nvim',
        event={"BufReadPre", "BufNewFile"},
        config=function()
            local hexedit=require('hex')
            hexedit.setup({})
        end
    }
}

