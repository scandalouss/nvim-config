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
})

--completion
require("mini.completion").setup()
require("mini.snippets").setup()
require("mini.icons").setup()

--fuzzy finder
require("mini.pick").setup()
require("mini.extra").setup()

--status line
require("mini.statusline").setup()

--random utils
require("mini.comment").setup() --comments plugin
require("mini.pairs").setup() -- autopairs plugin
require("mini.surround").setup() -- surround actions plugin
require("mini.animate").setup{  -- funny animations
    resize = {enable = false},
    open = {enable = false},
    close = {enable = false},
}
require("mini.sessions").setup()

