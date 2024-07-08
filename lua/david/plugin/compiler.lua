local overseer=require("overseer")
local file=vim.fn.expand("%:p:t")
local filepath=vim.fn.expand("%:p:h")

overseer.register_template{
    name="build c";
    builder=function()
        return{
            cmd=string.format("cd %s && gcc %s -o program -Wall -g",filepath,file),
            components = {"on_output_summarize","default"},
        }
    end,
    condition={
        filetype="c",
    }
}
overseer.register_template{
    name="build & run c";
    builder=function()
        return{
            cmd=string.format("cd %s && gcc %s -o program -Wall -g && ./program",filepath,file),
            components = {"on_output_summarize", "default"},
        }
    end,
    condition={
        filetype="c",
    }
}
overseer.register_template{
    name="run c";
    builder=function()
        return{
            cmd=string.format("cd %s && ./program",filepath),
            components = {"on_output_summarize","default"},
        }
    end,
    condition={
        filetype="c",
    }
}
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
overseer.setup{
    templates={"builtin",},
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
