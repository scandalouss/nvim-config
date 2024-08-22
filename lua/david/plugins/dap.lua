return{
    "rcarriga/nvim-dap-ui",
    dependencies={
        "mfussenegger/nvim-dap",
        "nvim-neotest/nvim-nio",
        "jay-babu/mason-nvim-dap.nvim",
    },
    event="VeryLazy",
    config=function()
        local dap=require("dap")
        local dapui=require("dapui")
        local mason_dap=require("mason-nvim-dap")
        mason_dap.setup{
            ensure_installed={
                "cppdbg",
                "python",
                "js",
                "bash",
                "go",
                "coreclr",
                "php",
                "node2",
                "javadbg",
                "go",
            },
            handlers={},
        }

        --adapters setup
        dap.adapters.cppdbg={ --c/cpp/rust debugger
            id = 'cppdbg',
            type = 'executable',
            command = "/home/david/.local/share/nvim/mason/bin/OpenDebugAD7",
        }
        dap.adapters.delve = { --go debugger
            type = 'server',
            port = '${port}',
            executable = {
                command = 'dlv',
                args = {'dap', '-l', '127.0.0.1:${port}'},
            }
        }
        dap.adapters["local-lua"] = {
            type = "executable",
            command = "node",
            args = {
                "/home/david/code/srcbuilds/local-lua-debugger-vscode/extension/debugAdapter.js"
            },
            enrich_config = function(config, on_config)
                if not config["extensionPath"] then
                    local conf= vim.deepcopy(config)
                    -- 💀 If this is missing or wrong you'll see 
                    -- "module 'lldebugger' not found" errors in the dap-repl when trying to launch a debug session
                    conf.extensionPath = "/home/david/code/srcbuilds/local-lua-debugger-vscode/"
                    on_config(conf)
                else
                    on_config(config)
                end
            end,
        }

        --language configurations
        dap.configurations.cpp={
            {
                name = "Launch file",
                type = "cppdbg",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopAtEntry = true,
            },
            {
                name = 'Attach to gdbserver :1234',
                type = 'cppdbg',
                request = 'launch',
                MIMode = 'gdb',
                miDebuggerServerAddress = 'localhost:1234',
                miDebuggerPath = '/usr/bin/gdb',
                cwd = '${workspaceFolder}',
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
            },
        }
        dap.configurations.c=dap.configurations.cpp
        dap.configurations.rust=dap.configurations.cpp
        dap.configurations.go={
            {
                type = "delve",
                name = "Debug",
                request = "launch",
                program = "${file}"
            },
            {
                type = "delve",
                name = "Debug test", -- configuration for debugging test files
                request = "launch",
                mode = "test",
                program = "${file}"
            },
            -- works with go.mod packages and sub packages 
            {
                type = "delve",
                name = "Debug test (go.mod)",
                request = "launch",
                mode = "test",
                program = "./${relativeFileDirname}"
            }
        }
        dap.configurations.lua = {
            {
                name = 'Current file (local-lua-dbg, lua)',
                type = 'local-lua',
                request = 'launch',
                cwd = '${workspaceFolder}',
                program = {
                    lua = 'lua5.1',
                    file = '${file}',
                },
                args = {},
            },
        }

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
    end
}
