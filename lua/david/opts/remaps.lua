--first set leader to space
vim.g.mapleader=" "
local map=vim.keymap.set

--nvimtree bindings
map("n","<leader>e",vim.cmd.NvimTreeToggle)

--telescope bindings, t = telescope
map("n","<leader>tf","<CMD>Telescope find_files<CR>")
map("n","<leader>tg","<CMD>Telescope live_grep<CR>")
map("n","<leader>tb","<CMD>Telescope buffers<CR>")
map("n","<leader>th","<CMD>Telescope help_tags<CR>")
map("n","<leader>tp","<CMD>Telescope projects<CR>")

--mini bindings
map("n","<leader>m",MiniMap.toggle)
--map("n","<leader>nh",function() vim.cmd([[rightbelow vnew]]) MiniNotify.show_history() end)

--nvim-dap/dap-ui bindings, d = dap/dap
local dap,dapui=require("dap"),require("dapui")
local function dapquit()
    dap.terminate()
    dap.close()
    dapui.close()
end
map("n","<leader>dt",dapui.toggle)
map("n","<leader>dq",dapquit)
map("n","<leader>db",dap.toggle_breakpoint)
map("n","<leader>de",dap.set_exception_breakpoints)
map("n","<leader>do",dap.step_over)
map("n","<leader>dp",dap.step_back)
map("n","<leader>d.",dap.step_into)
map("n","<leader>d,",dap.step_out)
map("n","<leader>dc",dap.continue)
map("n","<leader>dl","<CMD>DapShowLog<CR>")

--compiler/overseer bindings
map("n","<f8>",vim.cmd.OverseerRun)
map("n","<f9>",vim.cmd.OverseerToggle)

--trouble bindings, w = warning
map("n","<leader>w","<CMD> Trouble diagnostics toggle<CR>")

--statuscol bindings
map("n","<leader>so",vim.cmd.foldopen)
map("n","<leader>sc",vim.cmd.foldclose)

--buffer bindings, b = buffer
map("n","<leader>br",vim.cmd.bnext)
map("n","<leader>bl",vim.cmd.bprevious)
map("n","<leader>bd",vim.cmd.bdelete)

--fidget bindings
map("n","<leader>nc", "<CMD>Fidget clear<CR>")
map("n","<leader>nh", "<CMD>Fidget history<CR>")

map("n", "<leader>h", vim.cmd.split)
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
