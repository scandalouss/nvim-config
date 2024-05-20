local dap=require("dap")
local dapui=require("dapui")
local mason_dap=require("mason-nvim-dap")

mason_dap.setup{
    ensure_installed={
        "codelldb",
        "python",
        "js",
        "bash",
        "go",
        "coreclr",
        "php",
        "node2",
        "cppdbg",
    },
    handlers={},
}
dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "-i", "dap" }
}
dap.configurations.c = {
  {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false,
  },
}
--attach dapui to dap
dapui.setup({})
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end
