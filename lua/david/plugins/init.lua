--putting plugins that dont need that much config in here
return{
    {
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
                }
            }
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        event={"BufReadPre","BufNewFile"},
        opts={
            on_attach=function(bufnr)
                local gs=package.loaded.gitsigns
                local git=require("gitsigns")
                git.setup()
            end
        }
    },
    {
        "stevearc/conform.nvim",
        event={"BufReadPre","BufNewFile"},
        config=function()
            local conform=require("conform")
            conform.setup({})
        end
    },
    {
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
        "mrjones2014/smart-splits.nvim",
        lazy=false,
        config=function()
            local split=require("smart-splits")
            split.setup{}
        end
    },
    {
        "folke/trouble.nvim",
        event="VeryLazy",
        dependencies={"folke/todo-comments.nvim"},
        config=function()
            local trouble=require("trouble")
            trouble.setup()
        end
    },
    {
        "kevinhwang91/nvim-ufo",
        dependencies="kevinhwang91/promise-async",
        event="VeryLazy",
        config=function()
            local ufo=require("ufo")
            ufo.setup{
                provider_selector = function(_,_,_)
                    return {'treesitter', 'indent'}
                end
            }
        end
    },
    {
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
    {
        'vyfor/cord.nvim',
        build = './build || .\\build',
        event = 'VeryLazy',
        opts = {}, -- calls require('cord').setup()
    },
}

