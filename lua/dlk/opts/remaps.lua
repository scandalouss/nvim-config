--leader = space
vim.g.mapleader = " "
local map = vim.keymap.set

--disable arrow keys
map("n", "<up>", "<nop>")
map("n", "<down>", "<nop>")
map("n", "<left>", "<nop>")
map("n", "<right>", "<nop>")

--move up and down by 6
map({"n", "v"}, "J", "6j")
map({"n", "v"}, "K", "6k")

-- toggle netrw
map("n", "<leader>e", "<CMD>Lex<CR>")

--open and close folds
map("n","<leader>fo",vim.cmd.foldopen)
map("n","<leader>fc",vim.cmd.foldclose)

--making splits
map("n", "<leader>x", "<CMD>split<CR>")
map("n", "<leader>v", "<CMD>vsplit<CR>")

--plugin-view bindings
map("n", "<leader>P", "<CMD>lua require('plugin-view').open()<CR>")

-- mini bindings
map("n","<leader>pf","<CMD>Pick files<CR>")
map("n","<leader>pg","<CMD>Pick grep_live<CR>")
map("n","<leader>pb","<CMD>Pick buffers<CR>")
map("n","<leader>ph","<CMD>Pick help<CR>")
map("n","<leader>pp","<CMD>Pick projects<CR>")
map("n","<leader>pm","<CMD>Pick marks<CR>")
map("n","<leader>pk","<CMD>Pick keymaps<CR>")


--bufdelete bindings
map("n","<leader>bd", "<CMD>Bdelete<CR>")
map("n","<leader>bw", "<CMD>Bwipeout<CR>")
map("n","<leader>Bd", "<CMD>bdelete<CR>")
map("n","<leader>Bw", "<CMD>bwipeout<CR>")

--smart-splits bindings
local splits = require("smart-splits")
map('n', '<C-M-s>', splits.resize_left)
map('n', '<C-M-d>', splits.resize_down)
map('n', '<C-M-e>', splits.resize_up)
map('n', '<C-M-f>', splits.resize_right)

-- moving between splits
map('n', '<C-Left>', splits.move_cursor_left)
map('n', '<C-Down>', splits.move_cursor_down)
map('n', '<C-Up>', splits.move_cursor_up)
map('n', '<C-Right>', splits.move_cursor_right)
map('n', '<C-\\>', splits.move_cursor_previous)

-- swapping buffers between windows
map('n', '<leader>F', splits.swap_buf_left)
map('n', '<leader>J', splits.swap_buf_down)
map('n', '<leader>K', splits.swap_buf_up)
map('n', '<leader>B', splits.swap_buf_right)

--fidget bindings
map("n","<leader>nc", "<CMD>Fidget clear<CR>")
map("n","<leader>nh", "<CMD>Fidget history<CR>")

--simple-zoom bindings
map("n", "<Leader>z", "<CMD>SimpleZoomToggle<CR>")

--hex.nvim bindings
map("n", "<leader>he", "<CMD>HexToggle<CR>")
map("n", "<leader>hd", "<CMD>HexDump<CR>")
map("n", "<leader>ha", "<CMD>HexAssemble<CR>")

--obsidian.nvim/render-markdown.nvim bindings
map("n", "<leader>om", "<CMD>RenderMarkdown toggle<CR>")
map("n", "<leader>oo", "<CMD>ObsidianOpen<CR>")
map("n", "<leader>on", "<CMD>ObsidianNew<CR>")
map("n", "<leader>os", "<CMD>ObsidianSearch<CR>")
map("n", "<leader>of", "<CMD>ObsidianFollowLink<CR>")
map("n", "<leader>ol", "<CMD>ObsidianLink<CR>")
map("n", "<leader>oc", "<CMD>ObsidianToggleCheckbox<CR>")
map("n", "<leader>ot", "<CMD>ObsidianTOC<CR>")

--neogit bindings
map("n", "<leader>go", "<CMD>Neogit kind=floating<CR>")
map("n", "<leader>gc", "<CMD>Neogit commit<CR>")
map("n", "<leader>gm", "<CMD>Neogit merge<CR>")
map("n", "<leader>gb", "<CMD>Neogit branch<CR>")
map("n", "<leader>gp", "<CMD>Neogit push<CR>")
map("n", "<leader>gP", "<CMD>Neogit pull<CR>")
map("n", "<leader>gf", "<CMD>Neogit fetch<CR>")
map("n", "<leader>gr", "<CMD>Neogit rebase<CR>")
map("n", "<leader>gR", "<CMD>Neogit reset<CR>")
map("n", "<leader>gB", "<CMD>Neogit revert<CR>")
map("n", "<leader>gl", "<CMD>Neogit log<CR>")

--nvim-dap and dap-ui bindings
local dap = require("dap")
local function dapquit()
    dap.close()
    dap.terminate()
    dap.disconnect()
end
map("n","<leader>dq",dapquit)
map("n","<leader>db",dap.toggle_breakpoint)
map("n","<leader>de",dap.set_exception_breakpoints)
map("n","<leader>dk",dap.step_over)
map("n","<leader>dj",dap.step_back)
map("n","<leader>di",dap.step_into)
map("n","<leader>do",dap.step_out)
map("n","<leader>dc",dap.continue)
map("n","<leader>dl","<CMD>DapShowLog<CR>")
