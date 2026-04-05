vim.pack.add({
    "https://github.com/echasnovski/mini.completion",
    "https://github.com/echasnovski/mini.snippets",
    "https://github.com/echasnovski/mini.icons",
    "https://github.com/echasnovski/mini.pick",
    "https://github.com/echasnovski/mini.extra",
    "https://github.com/echasnovski/mini.statusline",
    "https://github.com/echasnovski/mini.comment",
    "https://github.com/echasnovski/mini.pairs",
    "https://github.com/echasnovski/mini.surround",
    "https://github.com/echasnovski/mini.animate",
    "https://github.com/echasnovski/mini.sessions",
    "https://github.com/rafamadriz/friendly-snippets",
    "https://github.com/nvim-mini/mini.hipatterns",
})
--completion
require("mini.icons").setup()
require("mini.completion").setup()
--disable completion for markdown filetype
local noMiniComplete = function(args)
    vim.b[args.buf].minicompletion_disable = true
end
vim.api.nvim_create_autocmd("FileType", {pattern = "markdown", callback = noMiniComplete})
--now load snippets
local gen_loader = require("mini.snippets").gen_loader
require("mini.snippets").setup{
    snippets = {
        gen_loader.from_lang(), -- should load friendly-snippets
    },
}

--fuzzy finder
-- preserve local vim picker for overseer
local ui_select_orig = vim.ui.select
require("mini.pick").setup()
require("mini.extra").setup()
vim.ui.select = ui_select_orig -- dont let mini.pick override all default vim pickers


--random utils
require("mini.statusline").setup() -- statusline
require("mini.comment").setup() --comments plugin
require("mini.surround").setup() -- surround actions plugin
require("mini.sessions").setup() -- automate Session.vim saving
require("mini.animate").setup{  -- funny animations
    resize = {enable = false},
    open = {enable = false},
    close = {enable = false},
    scroll = {enable = false}
}
require("mini.hipatterns").setup{
    highlighters = {
        hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
    }
}
require("mini.pairs").setup{ -- autopairs plugin    -- In which modes mappings from this `config` should be created
    modes = { insert = true, command = false, terminal = false },

    -- Global mappings. Each right hand side should be a pair information, a
    -- table with at least these fields (see more in |MiniPairs.map|):
    -- - <action> - one of 'open', 'close', 'closeopen'.
    -- - <pair> - two character string for pair to be used.
    -- By default pair is not inserted after `\`, quotes are not recognized by
    -- `<CR>`, `'` does not insert pair after a letter.
    -- Only parts of tables can be tweaked (others will use these defaults).
    mappings = {
        [")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
        ["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
        ["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },
        ["["] = {
            action = "open",
            pair = "[]",
            neigh_pattern = ".[%s%z%)}%]]",
            register = { cr = false },
            -- foo|bar -> press "[" -> foo[bar
            -- foobar| -> press "[" -> foobar[]
            -- |foobar -> press "[" -> [foobar
            -- | foobar -> press "[" -> [] foobar
            -- foobar | -> press "[" -> foobar []
            -- {|} -> press "[" -> {[]}
            -- (|) -> press "[" -> ([])
            -- [|] -> press "[" -> [[]]
        },
        ["{"] = {
            action = "open",
            pair = "{}",
            -- neigh_pattern = ".[%s%z%)}]",
            neigh_pattern = ".[%s%z%)}%]]",
            register = { cr = false },
            -- foo|bar -> press "{" -> foo{bar
            -- foobar| -> press "{" -> foobar{}
            -- |foobar -> press "{" -> {foobar
            -- | foobar -> press "{" -> {} foobar
            -- foobar | -> press "{" -> foobar {}
            -- (|) -> press "{" -> ({})
            -- {|} -> press "{" -> {{}}
        },
        ["("] = {
            action = "open",
            pair = "()",
            -- neigh_pattern = ".[%s%z]",
            neigh_pattern = ".[%s%z%)]",
            register = { cr = false },
            -- foo|bar -> press "(" -> foo(bar
            -- foobar| -> press "(" -> foobar()
            -- |foobar -> press "(" -> (foobar
            -- | foobar -> press "(" -> () foobar
            -- foobar | -> press "(" -> foobar ()
        },
        -- Single quote: Prevent pairing if either side is a letter
        ['"'] = {
            action = "closeopen",
            pair = '""',
            neigh_pattern = "[^%w\\][^%w]",
            register = { cr = false },
        },
        -- Single quote: Prevent pairing if either side is a letter
        ["'"] = {
            action = "closeopen",
            pair = "''",
            neigh_pattern = "[^%w\\][^%w]",
            register = { cr = false },
        },
        -- Backtick: Prevent pairing if either side is a letter
        ["`"] = {
            action = "closeopen",
            pair = "``",
            neigh_pattern = "[^%w\\][^%w]",
            register = { cr = false },
        },
    },
}

--project picker for mini.pick
--put projects or link them to ~/code/projects

MiniPick.registry.projects = function()
    local cwd = vim.fn.expand("~/code/projects")
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
