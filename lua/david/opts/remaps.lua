--first set leader to space
vim.g.mapleader=" "
local map=vim.keymap.set
local nvimtree=require("nvim-tree.api")
local telescope=require("telescope")
local telescope_builtin=require("telescope.builtin")
local telescope_actions=require("telescope.actions")

--nvimtree bindings
map("n","<leader>e",vim.cmd.NvimTreeToggle)

--telescope bindings
telescope.load_extension("projects")

map("n","<leader>ff",telescope_builtin.find_files)
map("n","<leader>fg",telescope_builtin.live_grep)
map("n","<leader>fb",telescope_builtin.buffers)
map("n","<leader>fh",telescope_builtin.help_tags)
map("n","<leader>fp",telescope.extensions.projects.projects)

--mini.map bindings
map("n","<leader>mm",MiniMap.toggle)

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

--compiler bindings
map("n","<F7>",vim.cmd.CompilerRedo)
map("n","<F6>",vim.cmd.CompilerStop)
map("n","<F8>",vim.cmd.CompilerOpen)
map("n","<F9>",vim.cmd.CompilerToggleResults)
map("n","<leader>ct",vim.cmd.OverseerToggle)

--trouble bindings
map("n","<leader>t",vim.cmd.TroubleToggle)
