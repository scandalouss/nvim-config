vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/famiu/bufdelete.nvim",
    "https://github.com/mrjones2014/smart-splits.nvim",
    "https://github.com/fasterius/simple-zoom.nvim",
    -- "https://github.com/Punity122333/hexinspector.nvim",
    "https://github.com/RaafatTurki/hex.nvim",
    -- "https://github.com/DamianVCechov/hexview.nvim",
    "https://github.com/lukas-reineke/indent-blankline.nvim",
    "https://github.com/kevinhwang91/nvim-ufo",
    "https://github.com/kevinhwang91/promise-async",
    "https://github.com/chentoast/marks.nvim",
    "https://github.com/adriankarlen/plugin-view.nvim",
    "https://github.com/folke/trouble.nvim",
    "https://github.com/m4xshen/smartcolumn.nvim",
    "https://github.com/karb94/neoscroll.nvim",
    "https://github.com/MeanderingProgrammer/render-markdown.nvim",
    "https://github.com/gentoo/gentoo-syntax",
    "https://github.com/NeogitOrg/neogit",
    "https://github.com/j-hui/fidget.nvim",
})

--apparently this adds builtin undotree?
vim.cmd('packadd nvim.undotree')

--delete buffers
require("bufdelete")

--make splits better with wezterm
require("smart-splits").setup()

--zoom in
require("simple-zoom").setup()

--hex editing
require("hex").setup()
-- require("hexinspector").setup()
-- require("hexview").setup()

--notifications
require("fidget").setup{
    notification = {
        override_vim_notify = true,
        view = {
            stack_upwards = false,
        },
        window = {
            winblend = 0,
            align = "top",
            normal_hl = "Normal",
        },
    },
}

--neogit (like magit from emacs)
require("neogit").setup()

--indent lines
if os.getenv("DISPLAY") == nil then
    goto skip_ibl
else
    require("ibl").setup{
        indent = {
            highlight = "Folded",
            -- char = "|"
        },
        whitespace = {
            highlight = "Folded"
        },
        scope = {
            enabled = true,
            highlight = "Function"
        }
    }
    require("neoscroll").setup{
        hide_cursor = false,
    }
end

::skip_ibl:: -- skip ibl label

--better folds
require("ufo").setup{
    provider_selector = function(bufnr, filetype, buftpe)
        return {"treesitter", "indent"}
    end
}

--better support for marks
require("marks")

--plugin viewer for new native package manager
require("plugin-view").setup()

require("trouble").setup{
    focus = true
}

require("smartcolumn").setup{
    scope = "line",
    disabled_filetypes = {"markdown", "help", "text", "netrw"}
}

require("render-markdown").setup({
    code = {
        disable_background = true,
        border = "none",
        width = "block"
    },
    heading = {
        width = "block",
    }
})
