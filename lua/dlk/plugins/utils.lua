-----------
--UTILITY-- 
-----------
vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/mrjones2014/smart-splits.nvim", -- gets required in the remaps.lua file
    "https://github.com/folke/trouble.nvim",
    "https://github.com/neogitorg/neogit",
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/j-hui/fidget.nvim",
    "https://github.com/chentoast/marks.nvim",
    "https://github.com/Olical/conjure" --temp
})

--- apparently this adds builtin undotree?
vim.cmd("packadd nvim.undotree")

--- diagnostics
require("trouble").setup()

--- magit but for neovim
require("neogit").setup()

--- better marks support
require("marks").setup()

--- file explorer
require("oil").setup({
    columns = {
        "icon",
        "permission",
        "size",
        "mtime",
    },
    delete_to_trash = true -- i don't trust myself
})

--- notifications
require("fidget").setup{
    progress = {
        suppress = true
    },
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
require("fidget").progress.suppress(true)

------------------
--MINI.NVIM SHIT--
------------------
vim.pack.add({
    "https://github.com/echasnovski/mini.pick",
    "https://github.com/echasnovski/mini.extra",
    "https://github.com/echasnovski/mini.pairs",
    "https://github.com/echasnovski/mini.comment",
    "https://github.com/echasnovski/mini.surround",
    "https://github.com/echasnovski/mini.sessions",
    "https://github.com/echasnovski/mini.misc",
})

--fuzzy finder
local ui_select_orig = vim.ui.select
require("mini.pick").setup()
require("mini.extra").setup()
vim.ui.select = ui_select_orig -- dont let mini.pick override all default vim pickers

require("mini.pairs").setup() --autopairs plugin
require("mini.comment").setup() --comments plugin
require("mini.surround").setup() -- surround actions plugin
require("mini.sessions").setup() -- automate Session.vim saving
require("mini.misc").setup() -- automate Session.vim saving

--project picker for mini.pick
--put projects or link them to ~/code

MiniPick.registry.projects = function()
    local cwd = vim.fn.expand("~/code")
    local choose = function(item)
        vim.schedule(function() vim.fn.chdir(item.path) end)
        vim.schedule(function ()vim.cmd("edit " .. item.path) end)
        -- vim.schedule(function() MiniPick.builtin.files(nil, { source = { cwd = item.path } }) end)
    end
    return MiniExtra.pickers.explorer({ cwd = cwd }, { source = { choose = choose } })
end

--add deleting to buffer picker
MiniPick.registry.buffers = function(local_opts)
    local wipeout_func = function()
        local selection = MiniPick.get_picker_matches().current
        if selection then
            vim.api.nvim_buf_delete(selection.bufnr, {})
        end
    end

    MiniPick.builtin.buffers(local_opts, {
        mappings = {
            wipeout = { char = '<C-d>', func = wipeout_func }
        }
    })
end
