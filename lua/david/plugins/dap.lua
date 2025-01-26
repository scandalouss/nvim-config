return{
    "rcarriga/nvim-dap-ui",
    dependencies={
        "mfussenegger/nvim-dap",
        "nvim-neotest/nvim-nio",
        "jay-babu/mason-nvim-dap.nvim",
    },
    event={"BufReadPre","BufNewFile"},
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
            command = vim.fn.stdpath("data") .. "/mason/bin/OpenDebugAD7",
        }
        dap.adapters.delve = { --go debugger
            type = 'server',
            port = '${port}',
            executable = {
                command = vim.fn.stdpath("data") .. "/mason/bin/dlv",
                args = {'dap', '-l', '127.0.0.1:${port}'},
            }
        }
        dap.adapters.python = function(cb, config) -- python debuger 
            if config.request == 'attach' then
                ---@diagnostic disable-next-line: undefined-field
                local port = (config.connect or config).port
                ---@diagnostic disable-next-line: undefined-field
                local host = (config.connect or config).host or '127.0.0.1'
                cb({
                    type = 'server',
                    port = assert(port, '`connect.port` is required for a python `attach` configuration'),
                    host = host,
                    options = {
                        source_filetype = 'python',
                    },
                })
            else
                cb({
                    type = 'executable',
                    command={vim.fn.stdpath("data") .. "/mason/bin/debugpy"},
                    args = { '-m', 'debugpy.adapter' },
                    options = {
                        source_filetype = 'python',
                    },
                })
            end
        end
        dap.adapters["local-lua"] = { -- lua debugger
            type = "executable",
            command = "node",
            args = {
                os.getenv("HOME") .. "/code/srcbuilds/local-lua-debugger-vscode/extension/debugAdapter.js"
            },
            enrich_config = function(config, on_config)
                if not config["extensionPath"] then
                    local conf= vim.deepcopy(config)
                    -- 💀 If this is missing or wrong you'll see 
                    -- "module 'lldebugger' not found" errors in the dap-repl when trying to launch a debug session
                    conf.extensionPath = os.getenv("HOME") .. "/code/srcbuilds/local-lua-debugger-vscode/"
                    on_config(conf)
                else
                    on_config(config)
                end
            end,
        }
        dap.adapters.node2 = { -- javascript debugger
            type = 'executable',
            command = 'node',
            args = {vim.fn.stdpath("data") .. '/mason/packages/node-debug2-adapter/src/nodeDebug.ts'},
        }
        dap.adapters.bash = { -- bash debuggoer
            type = 'executable';
            command = vim.fn.stdpath("data") .. '/mason/bin/bash-debug-adapter';
            name = 'bash';
        }
        dap.adapters.coreclr = { -- mono/dotnet/c# debugger
            type = 'executable',
            command = vim.fn.stdpath("data") .. "/mason/bin/netcoredbg",
            args = {'--interpreter=vscode'}
        }
        dap.adapters.php = { -- php debugger
            type = 'executable',
            command = 'node',
            args = {vim.fn.stdpath("data") .. "/mason/packages/php-debug-adapter/extension/out/phpDebug.js" }
        }

        --language configurations
        dap.configurations.cpp={ -- c and rust can use this as well
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
        dap.configurations.python = {
            {
                -- The first three options are required by nvim-dap
                type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
                request = 'launch';
                name = "Launch file";

                -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

                program = "${file}"; -- This configuration will launch the current file if used.
                pythonPath = function()
                    -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
                    -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
                    -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
                    local cwd = vim.fn.getcwd()
                    if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
                        return cwd .. '/venv/bin/python'
                    elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
                        return cwd .. '/.venv/bin/python'
                    else
                        return '/usr/bin/python'
                    end
                end;
            },
        }
        dap.configurations.javascript = {
            {
                name = 'Launch',
                type = 'node2',
                request = 'launch',
                program = '${file}',
                cwd = vim.fn.getcwd(),
                sourceMaps = true,
                protocol = 'inspector',
                console = 'integratedTerminal',
            },
            {
                -- For this to work you need to make sure the node process is started with the `--inspect` flag.
                name = 'Attach to process',
                type = 'node2',
                request = 'attach',
                processId = require'dap.utils'.pick_process,
            },
        }
        dap.configurations.sh = {
            {
                type = 'bash';
                request = 'launch';
                name = "Launch file";
                showDebugOutput = true;
                pathBashdb = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb';
                pathBashdbLib = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir';
                trace = true;
                file = "${file}";
                program = "${file}";
                cwd = '${workspaceFolder}';
                pathCat = "cat";
                pathBash = "/bin/bash";
                pathMkfifo = "mkfifo";
                pathPkill = "pkill";
                args = {};
                env = {};
                terminalKind = "integrated";
            }
        }
        dap.configurations.cs = {
            {
                type = "coreclr",
                name = "launch - netcoredbg",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
                end,
            },
        }
        dap.configurations.php = {
            {
                type = 'php',
                request = 'launch',
                name = 'Listen for Xdebug',
                port = 9003
            }
        }

        --finally setup nvim-dap
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
