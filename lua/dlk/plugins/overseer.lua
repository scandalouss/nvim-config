vim.pack.add({"https://github.com/stevearc/overseer.nvim"})

local overseer = require("overseer")

---------- UECLI/UNREAL ENGINE PROJECT CMDS --------
overseer.register_template{
    name="generate project files",
    builder=function()
        return{
            cmd=string.format("ue gen"),
            components={
                "on_output_summarize",
                "on_complete_notify",
                "on_result_diagnostics_trouble",
                "default",
            },
        }
    end,
    condition={
        dir="~/code/projects/unrealengine/",
    }
}
overseer.register_template{
    name="build unreal project",
    builder=function()
        return{
            cmd=string.format("ue build"),
            components={
                "on_output_summarize",
                "on_complete_notify",
                "on_result_diagnostics_trouble",
                "default",
            },
        }
    end,
    condition={
        dir="~/code/projects/unrealengine/",
    }
}
overseer.register_template{
    name="open .uproject in editor",
    builder=function()
        return{
            cmd=string.format("ue run"),
            components={
                "on_output_summarize",
                "on_complete_notify",
                "on_result_diagnostics_trouble",
                "default",
            },
        }
    end,
    condition={
        dir="~/code/projects/unrealengine/",
    }
}
overseer.register_template{
    name="clean unreal project",
    builder=function()
        return{
            cmd=string.format("ue clean"),
            components={
                "on_output_summarize",
                "on_complete_notify",
                "on_result_diagnostics_trouble",
                "default",
            },
        }
    end,
    condition={
        dir="~/code/projects/unrealengine/",
    }
}
overseer.register_template{
    name="package unreal project",
    builder=function()
        return{
            cmd=string.format("ue package"),
            components={
                "on_output_summarize",
                "on_complete_notify",
                "on_result_diagnostics_trouble",
                "default",
            },
        }
    end,
    condition={
        dir="~/code/projects/unrealengine/",
    }
}

-------- PYTHON COMMANDS --------

overseer.register_template{
    name="run this current python file",
    builder=function()
        local file=vim.fn.expand("%:p:t")
        local filepath=vim.fn.expand("%:p:h")
        return{
            cmd=string.format("cd "..filepath.." && python "..file),
            components={
                {"open_output", direction = float, focus = true},
                {"on_complete_dispose", statuses = "FAILURE", timeout = 20},
                "on_complete_notify",
                "on_result_diagnostics_trouble",
            },
        }
    end,
    condition={
        filetype={"py","python"}
    }
}
overseer.register_template{
    name="run python script (main.py)", --assumes there's a main.py in the filepath
    builder=function()
        local filepath=vim.fn.expand("%:p:h")
        return{
            cmd=string.format("cd "..filepath.." && python "..filepath.."/main.py"),
            components={
                {"open_output", direction = float, focus = true},
                {"on_complete_dispose", statuses = "FAILURE", timeout = 20},
                "on_complete_notify",
                "on_result_diagnostics_trouble",
            }
        }
    end,
    condition={
        filetype={"py","python"}
    }
}
overseer.register_template{
    name="build and run python program with nuitka (machinecode)", -- uses nuitka
    builder=function()
        local filepath=vim.fn.expand("%:p:h")
        return{
            cmd=string.format("cd "..filepath.." && "..bindir_check.." && nuitka "..
                "--no-pyi-file --follow-imports --output-filename=bin/bin"..
                " main.py && ./bin/bin"),
            components={
                {"open_output", direction = float, focus = true},
                {"on_complete_dispose", statuses = "FAILURE", timeout = 20},
                "on_complete_notify",
                "on_result_diagnostics_trouble",
            }
        }
    end,
    condition={
        filetype={"py","python"}
    }
}
overseer.register_template{
    name="build python program with nuitka (machinecode)",
    builder=function()
        local filepath=vim.fn.expand("%:p:h")
        return{
            cmd=string.format("cd "..filepath.." && "..bindir_check.." && nuitka "..
                "--no-pyi-file --follow-imports --output-filename=bin/bin"..
                " main.py"),
            components={
                {"open_output", direction = float, focus = true},
                {"on_complete_dispose", statuses = "FAILURE", timeout = 20},
                "on_complete_notify",
                "on_result_diagnostics_trouble",
            }
        }
    end,
    condition={
        filetype={"py","python"}
    }
}
overseer.register_template{
    name="run python program (machinecode)",
    builder=function()
        local filepath=vim.fn.expand("%:p:h")
        local bincheck="if [ ! -f bin/bin ]; then echo 'You need to run nuitka first dummy'; else ./bin/bin; fi"
        return{
            cmd="cd "..filepath.." && "..bincheck,
            components={
                {"open_output", direction = float, focus = true},
                {"on_complete_dispose", statuses = "FAILURE", timeout = 20},
                "on_complete_notify",
                "on_result_diagnostics_trouble",
            }
        }
    end,
    condition={
        filetype={"py","python"}
    }
}
overseer.register_template{
    name="build and run python program with pyinstaller (bytecode)", -- uses pyinstaller 
    builder=function()
        local filepath=vim.fn.expand("%:p:h")
        return{
            cmd=string.format("cd "..filepath.." && pyinstaller "..
                "--onefile main.py -n bin && ./dist/bin"),
            components={
                {"open_output", direction = float, focus = true},
                {"on_complete_dispose", statuses = "FAILURE", timeout = 20},
                "on_complete_notify",
                "on_result_diagnostics_trouble",
            }
        }
    end,
    condition={
        filetype={"py","python"}
    }
}
overseer.register_template{
    name="build python program with pyinstaller (bytecode)", -- uses pyinstaller 
    builder=function()
        local filepath=vim.fn.expand("%:p:h")
        return{
            cmd=string.format("cd "..filepath.." && pyinstaller "..
                "--onefile main.py -n bin"),
            components={
                {"open_output", direction = float, focus = true},
                {"on_complete_dispose", statuses = "FAILURE", timeout = 20},
                "on_complete_notify",
                "on_result_diagnostics_trouble",
            }
        }
    end,
    condition={
        filetype={"py","python"}
    }
}
overseer.register_template{
    name="run python program (bytecode)", -- uses pyinstaller
    builder=function()
        local filepath=vim.fn.expand("%:p:h")
        local bincheck="if [ ! -f 'dist/bin' ]; then echo 'You need to run pyinstaller first dummy'; else ./dist/bin; fi"
        return{
            cmd=string.format("cd "..filepath.." && "..bincheck),
            components={
                {"open_output", direction = float, focus = true},
                {"on_complete_dispose", statuses = "FAILURE", timeout = 20},
                "on_complete_notify",
                "on_result_diagnostics_trouble",
            }
        }
    end,
    condition={
        filetype={"py","python"}
    }
}

-------- C/C++ COMMANDS --------

overseer.register_template{
    name="build c++ file",
    builder=function()
        local filepath=vim.fn.expand("%:p:h")
        local file=vim.fn.expand("%:p:t")
        return{
            cmd=string.format("cd "..filepath..
                " && if test -d ./bin; then echo -n ''; else mkdir -p ./bin; fi && g++ "
                ..file.." -o bin/bin -Wall -g"),
            components={
                "on_output_summarize",
                "on_complete_notify",
                "on_result_diagnostics_trouble",
                "default",
            }
        }
    end,
    condition={
        dir="~/code/c/learn-cpp/",
        filetype={"c++","cpp"}
    }
}
overseer.register_template{
    name="build and run c++ file",
    builder=function()
        local filepath=vim.fn.expand("%:p:h")
        local file=vim.fn.expand("%:p:t")
        return{
            cmd=string.format("cd "..filepath..
                " && if test -d ./bin; then echo -n ''; else mkdir -p ./bin; fi && g++ "
                ..file.." -o bin/bin -Wall -g && ./bin/program"),
            components={
                "on_output_summarize",
                "on_complete_notify",
                "on_result_diagnostics_trouble",
                "default",
            }
        }
    end,
    condition={
        dir="~/code/c/learn-cpp/",
        filetype={"c++","cpp"}
    }
}
overseer.register_template{
    name="run c++ file",
    builder=function()
        local filepath=vim.fn.expand("%:p:h")
        return{
            cmd=string.format("cd "..filepath..
                " && if test ./bin/bin; then ./bin/program; else echo 'nothing to run'; fi"),
            components={
                "on_output_summarize",
                "on_complete_notify",
                "on_result_diagnostics_trouble",
                "default",
            }
        }
    end,
    condition={
        filetype={"c++","cpp"},
        dir="~/code/c/learn-cpp/",
    }
}
overseer.register_template{
    name="build c file",
    builder=function()
        local filepath=vim.fn.expand("%:p:h")
        local file=vim.fn.expand("%:p:t")
        return{
            cmd=string.format("cd "..filepath..
                " && if test -d ./bin; then echo -n ''; else mkdir -p ./bin; fi && gcc "
                ..file.." -o bin/bin -Wall -g"),
            components={
                "on_output_summarize",
                "on_complete_notify",
                "on_result_diagnostics_trouble",
                "default",
            }
        }
    end,
    condition={
        filetype={"c"},
        dir="~/code/c/learn-c/",
    }
}
overseer.register_template{
    name="build and run c file",
    builder=function()
        local filepath=vim.fn.expand("%:p:h")
        local file=vim.fn.expand("%:p:t")
        return{
            cmd=string.format("cd "..filepath..
                " && if test -d ./bin; then echo -n ''; else mkdir -p ./bin; fi && gcc "
                ..file.." -o bin/bin -Wall -g && ./bin/program"),
            components={
                "on_output_summarize",
                "on_complete_notify",
                "on_result_diagnostics_trouble",
                "default",
            }
        }
    end,
    condition={
        filetype={"c"},
        dir="~/code/c/learn-c/",
    }
}
overseer.register_template{
    name="run c file",
    builder=function()
        local filepath=vim.fn.expand("%:p:h")
        return{
            cmd=string.format("cd "..filepath..
                " && if test /bin/bin; then ./bin/program; else echo 'nothing to run'; fi"),
            components={
                "on_output_summarize",
                "on_complete_notify",
                "on_result_diagnostics_trouble",
                "default",
            }
        }
    end,
    condition={
        filetype={"c"},
        dir="~/code/c/learn-c/",
    }
}
overseer.register_template{
    name="run cmake in root directory",
    builder=function()
        return{
            cmd=string.format("cmake ./"),
            components={
                "on_output_summarize",
                "on_complete_notify",
                "on_result_diagnostics_trouble",
                "default"
            }
        }
    end,
    condition={
        filetype={"cpp", "hpp", "h", "c++"},
    }
}

-------- GO COMMANDS --------

overseer.register_template{
    name="build and run go file",
    builder=function()
        local file=vim.fn.expand("%:p:t")
        local filepath=vim.fn.expand("%:p:h")
        return{
            cmd=string.format("cd "..filepath..
                " && if test -d ./bin; then echo -n ''; else mkdir -p ./bin; fi && go build -o bin/bin -a -v -gcflags='-N -l' "
                ..file.."&& ./bin/bin"),
            components={
                "on_output_summarize",
                "on_complete_notify",
                "on_result_diagnostics_trouble",
                "default",
            }
        }
    end,
    condition={
        filetype={"go","golang"}
    }
}
overseer.register_template{
    name="build go file",
    builder=function()
        local file=vim.fn.expand("%:p:t")
        local filepath=vim.fn.expand("%:p:h")
        return{
            cmd=string.format("cd "..filepath..
                " && if test -d ./bin; then echo -n ''; else mkdir -p ./bin; fi && go build -o bin/bin -a -v -gcflags='-N -l' "
                ..file..""),
            components={
                "on_output_summarize",
                "on_complete_notify",
                "on_result_diagnostics_trouble",
                "default",
            }
        }
    end,
    condition={
        filetype={"go","golang"}
    }
}
overseer.register_template{
    name="run go file",
    builder=function()
        local file=vim.fn.expand("%:p:t")
        local filepath=vim.fn.expand("%:p:h")
        return{
            cmd=string.format("cd "..filepath.." && go run "..file..""),
            components={
                "on_output_summarize",
                "on_complete_notify",
                "on_result_diagnostics_trouble",
                "default",
            }
        }
    end,
    condition={
        filetype={"go","golang"}
    }
}

--quick html template to open site
overseer.register_template{
    name = "open current page",
    builder = function()
        local file = vim.fn.expand("%:p:t")
        return{
            cmd = string.format("firefox "..file),
            components={
                "on_complete_notify",
                "on_result_diagnostics_trouble",
                "default"
            }
        }
    end,
    condition = {
        filetype = {"html"}
    }
}
overseer.register_template{
    name = "open index.html",
    builder = function()
        return{
            cmd = string.format("firefox index.html"),
            components={
                "on_complete_notify",
                "on_result_diagnostics_trouble",
                "default"
            }
        }
    end,
    condition = {
        filetype = {"html"}
    }
}


--finally setup
overseer.setup{
    templates={"builtin"},
    dap=true,
    task_list={
        direction="bottom"
    },
    component_aliases={
        default={
            {"display_duration",detail_level=2},
            "on_result_notify",
            "on_exit_set_status",
            {"on_complete_notify",statuses={"SUCCESS","FAILURE"}},
            {"on_complete_dispose",require_view={"SUCCESS","FAILURE"}},
            {"open_output", direction="float", focus=true}
        },
        -- Tasks from tasks.json use these components
        default_vscode = {
            "default",
            "on_result_diagnostics",
        },
    },
}
