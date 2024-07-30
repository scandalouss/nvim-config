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
dap.adapters.gdb={
  type="executable",
  command="gdb",
  args={"-i", "dap"}
}
dap.configurations.c={
  {
    name="Attach to Neovim and debug C",
    type="gdb",
    request="launch",
    program=function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd="${workspaceFolder}",
    stopAtBeginningOfMainSubprogram=false,
  },
}
dap.configurations.lua={
  {
    type="nlua",
    request="attach",
    name="Attach to Neovim and debug Lua",
  }
}
dap.adapters.nlua=function(callback, config)
  callback({type='server', host=config.host or "127.0.0.1",port=config.port or 8086 })
end

--FINALLY attach dapui to dap
dapui.setup({})
dap.listeners.before.attach.dapui_config=function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config=function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config=function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config=function()
  dapui.close()
end
