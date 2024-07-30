local overseer=require("overseer")
Filepath=vim.fn.expand("%:p:h")
File=vim.fn.expand("%:p:t")

--unreal project stuff
overseer.register_template{
    name="build unreal project",
    builder=function()
        return{
            cmd=string.format("uecli build"),
            components={"on_output_summarize","default"},
        }
    end,
    condition={
        filetype={"c++","cpp","hpp","h","NvimTree",},
        directory="/home/david/code/ue5projects",
    }
}
overseer.register_template{
    name="open .uproject in editor",
    builder=function()
        return{
            cmd=string.format("uecli run"),
            components={"on_output_summarize","default"},
        }
    end,
    condition={
        filetype={"c++","cpp","hpp","h","NvimTree",},
        directory="/home/david/code/ue5projects",
    }
}
overseer.register_template{
    name="clean unreal project",
    builder=function()
        return{
            cmd=string.format("uecli clean"),
            components={"on_output_summarize","default"},
        }
    end,
    condition={
        filetype={"c++","cpp","hpp","h","NvimTree",},
        directory="/home/david/code/ue5projects",
    }
}
overseer.register_template{
    name="package unreal project",
    builder=function()
        return{
            cmd=string.format("uecli package"),
            components={"on_output_summarize","default"},
        }
    end,
    condition={
        filetype={"c++","cpp","hpp","h","NvimTree",},
        directory="/home/david/code/ue5projects",
    }
}
overseer.register_template{
    name="run automation tests for unreal project",
    builder=function()
        return{
            cmd=string.format("uecli test"),
            components={"on_output_summarize","default"},
        }
    end,
    condition={
        filetype={"c++","cpp","hpp","h","NvimTree",},
        directory="/home/david/code/ue5projects",
    }
}

--finally setup
overseer.setup{
    templates={
        "builtin",
        "user.c_build",
        "user.c_build_and_run",
        "user.c_run",
    },
    dap=true,
    task_list={
        direction="bottom"
    },
    component_aliases={
        default={
            {"display_duration",detail_level=2},
            "on_output_summarize",
            "on_exit_set_status",
            "on_complete_notify",
            {"on_complete_dispose",require_view={"SUCCESS","FAILURE"}},
            "open_output",
        },
        -- Tasks from tasks.json use these components
        default_vscode = {
            "default",
            "on_result_diagnostics",
        },
    },
}
