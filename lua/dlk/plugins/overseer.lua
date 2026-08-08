vim.pack.add({"https://github.com/stevearc/overseer.nvim"})

local overseer = require("overseer")
local bindir_check="if test -d ./bin; then echo -n ''; else mkdir -p ./bin; fi"
---------- UECLI/UNREAL ENGINE PROJECT CMDS --------

overseer.register_template{
    name="generate project files",
    builder=function()
        return{
            cmd=string.format("ue gen"),
            components={
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
                "default"
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
                "default"
            }
        }
    end,
    condition={
        filetype={"py","python"}
    }
}
overseer.register_template{
    name="build and run python program with nuitka", -- uses nuitka
    builder=function()
        local filepath=vim.fn.expand("%:p:h")
        return{
            cmd=string.format("cd "..filepath.." && "..bindir_check.." && nuitka "..
                "--no-pyi-file --follow-imports --output-filename=bin/bin"..
                " main.py && ./bin/bin"),
            components={
                "default"
            }
        }
    end,
    condition={
        filetype={"py","python"}
    }
}
overseer.register_template{
    name="build python program with nuitka",
    builder=function()
        local filepath=vim.fn.expand("%:p:h")
        return{
            cmd=string.format("cd "..filepath.." && "..bindir_check.." && nuitka "..
                "--no-pyi-file --follow-imports --output-filename=bin/bin"..
                " main.py"),
            components={
                "default"
            }
        }
    end,
    condition={
        filetype={"py","python"}
    }
}
overseer.register_template{
    name="build python project (pyproject.toml)",
    builder=function()
        local filepath=vim.fn.expand("%:p:h")
        return{
            cmd=string.format("cd "..filepath.." && python -m build"),
            components={
                "default"
            }
        }
    end,
    condition={
        filetype={"py","python", "toml"}
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
                "default"
            }
        }
    end,
    condition={
        filetype={"py","python"}
    }
}

-------- C/C++ COMMANDS --------

overseer.register_template{
    name="cmake generate",
    builder=function()
        return{
            cmd=string.format("cmake -B bin -DCMAKE_EXPORT_COMPILE_COMMANDS=1"),
            components={
                "default"
            }
        }
    end,
    condition={
        filetype = {"c", "cpp", "h",}
    }
}

overseer.register_template{
    name="cmake build",
    builder=function()
        return{
            cmd=string.format("cmake --build bin"),
            components={
                "default"
            }
        }
    end,
    condition={
        filetype = {"c", "cpp", "h",}
    }
}

-------- HTML COMMANDS --------

overseer.register_template{
    name = "open current page",
    builder = function()
        local file = vim.fn.expand("%:p:t")
        return{
            cmd = string.format("firefox "..file),
            components={
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
                "default"
            }
        }
    end,
    condition = {
        filetype = {"html", "css"}
    }
}

-------- SETUP --------

overseer.setup{
    dap=false,
    output = {
        use_terminal = true,
    },
    task_list={
        direction="bottom"
    },
    component_aliases={
        default={
            -- "on_result_notify",
            {"open_output", direction = "dock", focus = false},
            "on_result_diagnostics_trouble",
            "on_exit_set_status",
            {"on_complete_notify", statuses = {"SUCCESS", "FAILURE"}},
            -- {"on_complete_dispose",require_view={"SUCCESS", "FAILURE"}, timeout = 20},
        },
    },
}

-- recipe from overseer.nvim github to restart the last command that was run
vim.api.nvim_create_user_command("OverseerRestartLast", function()
    local task_list = require("overseer.task_list")
    local tasks = overseer.list_tasks({ status = {
        overseer.STATUS.SUCCESS,
        overseer.STATUS.FAILURE,
        overseer.STATUS.CANCELED,
    }, sort = task_list.sort_finished_recently })
    if vim.tbl_isempty(tasks) then
        vim.notify("No tasks found", vim.log.levels.WARN)
    else
        local most_recent = tasks[1]
        overseer.run_action(most_recent, "restart")
    end
end, {})
