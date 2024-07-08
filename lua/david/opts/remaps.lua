--first set leader to space
vim.g.mapleader=" "
local map=vim.keymap.set
local nvimtree=require("nvim-tree.api")
local telescope_builtin=require("telescope.builtin")

--nvimtree bindings
map("n","<leader>e",nvimtree.tree.toggle)

--telescope bindings
map("n","<leader>tf",telescope_builtin.find_files)
map("n","<leader>tg",telescope_builtin.live_grep)
map("n","<leader>tb",telescope_builtin.buffers)
map("n","<leader>th",telescope_builtin.help_tags)
map("n","<leader>tp","<CMD>Telescope projects<CR>")

--mini.map bindings
map("n","<leader>m",MiniMap.toggle)

--nvim-dap/dap-ui bindings
local dap,dapui=require("dap"),require("dapui")
local function dapquit()
    dap.terminate()
    dap.close()
    dapui.close()
end
map("n","<leader>dq",dapquit)
map("n","<leader>db",dap.toggle_breakpoint)
map("n","<leader>de",dap.set_exception_breakpoints)
map("n","<leader>dl",dap.list_breakpoints)
map("n","<leader>do",dap.step_over)
map("n","<leader>du",dapui.toggle)
map("n","<leader>dp",dap.step_back)
map("n","<leader>d>",dap.step_into)
map("n","<leader>d<",dap.step_out)
map("n","<leader>dr",vim.cmd.DapContinue)

--compiler/overseer bindings
map("n","<f8>",vim.cmd.OverseerRun)
map("n","<f9>",vim.cmd.OverseerToggle)


--trouble bindings
map("n","<leader>w","<CMD> Trouble diagnostics toggle<CR>") --w = warnings
