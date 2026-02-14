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
-- preserve local vim picker for overseer
local ui_select_orig = vim.ui.select
--completion
require("mini.completion").setup()
require("mini.snippets").setup()
require("mini.icons").setup()

--fuzzy finder
require("mini.pick").setup()
require("mini.extra").setup()
vim.ui.select = ui_select_orig

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

--project picker for mini.pick
--put projects or link them to ~/code/projects

MiniPick.registry.projects = function()
  local cwd = vim.fn.expand('~/code/projects')
  local choose = function(item)
    vim.schedule(function() vim.fn.chdir(item.path) end)
    vim.schedule(function ()vim.cmd("edit " .. item.path) end)
    -- vim.schedule(function() MiniPick.builtin.files(nil, { source = { cwd = item.path } }) end)
  end
  return MiniExtra.pickers.explorer({ cwd = cwd }, { source = { choose = choose } })
end
