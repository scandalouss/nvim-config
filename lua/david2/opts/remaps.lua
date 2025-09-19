--first set leader to space
vim.g.mapleader=" "
local map=vim.keymap.set

--first, disable the arrow keys
--cause old habits die hard or whatever the line is
map("n", "<up>", "<nop>")
map("n", "<down>", "<nop>")
map("n", "<left>", "<nop>")
map("n", "<right>", "<nop>")

--bindings to move up and down 6 lines.
--relative line numbers be damned
map("n","J","6j")
map("n","K","6k")

--bindings to open package managers
map("n", "<leader>L", "<CMD>Lazy<CR>")
map("n", "<leader>M", "<CMD>Mason<CR>")

--binding to toggle line wrapping
map("n", "<leader>lw", "<CMD>set wrap!<CR>")

--neo-tree bindings
map("n","<leader>e", "<CMD>Neotree toggle<CR>")

--simple-zoom bindings
map("n", "<Leader>z", "<CMD>SimpleZoomToggle<CR>")

--telescope bindings, t = telescope
map("n","<leader>tf","<CMD>Telescope find_files<CR>")
map("n","<leader>tg","<CMD>Telescope live_grep<CR>")
map("n","<leader>tb","<CMD>Telescope buffers<CR>")
map("n","<leader>th","<CMD>Telescope help_tags<CR>")
map("n","<leader>tp","<CMD>Telescope projects<CR>")
map("n","<leader>tm","<CMD>Telescope marks<CR>")
map("n","<leader>tk","<CMD>Telescope keymaps<CR>")

--mini bindings
--map("n","<leader>m",MiniMap.toggle)

--nvim-dap/dap-ui bindings, d = dap/dap
local dap=require("dap")
local function dapquit()
    dap.terminate()
    dap.disconnect()
    dap.close()
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

--compiler/overseer bindings
map("n","<f8>",vim.cmd.OverseerRun)
map("n","<f9>",vim.cmd.OverseerToggle)

--trouble bindings, w = warning
map("n","<leader>w","<CMD> Trouble diagnostics toggle<CR>")

--statuscol bindings
--map("n","<leader>fo",vim.cmd.foldopen)
--map("n","<leader>fc",vim.cmd.foldclose)

--fidget bindings
map("n","<leader>nc", "<CMD>Fidget clear<CR>")
map("n","<leader>nh", "<CMD>Fidget history<CR>")
map("n", "<leader>x", vim.cmd.split)
map("n", "<leader>v", vim.cmd.vsplit)

--smartsplits bindings
local splits=require("smart-splits")
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

--obsidian.nvim/render-markdown.nvim bindings
map("n", "<leader>om", "<CMD>RenderMarkdown toggle<CR>")
map("n", "<leader>oo", "<CMD>ObsidianOpen<CR>")
map("n", "<leader>on", "<CMD>ObsidianNew<CR>")
map("n", "<leader>os", "<CMD>ObsidianSearch<CR>")
map("n", "<leader>of", "<CMD>ObsidianFollowLink<CR>")
map("n", "<leader>ol", "<CMD>ObsidianLink<CR>")
map("n", "<leader>oc", "<CMD>ObsidianToggleCheckbox<CR>")
map("n", "<leader>ot", "<CMD>ObsidianTOC<CR>")

--hex.nvim bindings
map("n", "<leader>he", "<CMD>HexToggle<CR>")
map("n", "<leader>hd", "<CMD>HexDump<CR>")
map("n", "<leader>ha", "<CMD>HexAssemble<CR>")

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


