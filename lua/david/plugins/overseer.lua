local filepath=vim.fn.expand("%:p:h")
local file=vim.fn.expand("%:p:t")

return{
    "stevearc/overseer.nvim",
    lazy=false,
    config=function()
        local overseer=require("overseer")

        ---------- UECLI/UNREAL ENGINE PROJECT CMDS --------

        overseer.register_template{
            name="build unreal project",
            builder=function()
                return{
                    cmd=string.format("uecli build"),
                    components={"on_output_summarize","default"},
                }
            end,
            condition={
                filetype={"c++","cpp","hpp","h"},
                directory="~/code/ue5projects",
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
                filetype={"c++","cpp","hpp","h"},
                directory="~/code/ue5projects",
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
                filetype={"c++","cpp","hpp","h",},
                directory="~/code/ue5projects",
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
                filetype={"c++","cpp","hpp","h"},
                directory="~/code/ue5projects",
            }
        }

        -------- PYTHON COMMANDS --------

        overseer.register_template{
            name="run python file",
            builder=function()
                return{
                    cmd=string.format("cd "..filepath.." && python "..file..""),
                    components={"on_output_summarize","default"},
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
                return{
                    cmd=string.format("cd "..filepath..
                        " && if test -d ./bin; then echo -n ''; else mkdir -p ./bin; fi && g++ "
                        ..file.." -o bin/program -Wall -g"),
                    components={"on_output_summarize","default"}
                }
            end,
            condition={
                filetype={"c++","cpp"}
            }
        }

        overseer.register_template{
            name="build and run c++ file",
            builder=function()
                return{
                    cmd=string.format("cd "..filepath..
                        " && if test -d ./bin; then echo -n ''; else mkdir -p ./bin; fi && g++ "
                        ..file.." -o bin/program -Wall -g && ./bin/program"),
                    components={"on_output_summarize","default"}
                }
            end,
            condition={
                filetype={"c++","cpp"}
            }
        }

        overseer.register_template{
            name="run c++ file",
            builder=function()
                return{
                    cmd=string.format("cd "..filepath..
                        " && if test ./bin/program; then ./bin/program; else echo 'nothing to run'; fi"),
                    components={"on_output_summarize","default"}
                }
            end,
            condition={
                filetype={"c++","cpp"}
            }
        }

        overseer.register_template{
            name="build c file",
            builder=function()
                return{
                    cmd=string.format("cd "..filepath..
                        " && if test -d ./bin; then echo -n ''; else mkdir -p ./bin; fi && gcc "
                        ..file.." -o bin/program -Wall -g"),
                    components={"on_output_summarize","default"}
                }
            end,
            condition={
                filetype={"c"}
            }
        }

        overseer.register_template{
            name="build and run c file",
            builder=function()
                return{
                    cmd=string.format("cd "..filepath..
                        " && if test -d ./bin; then echo -n ''; else mkdir -p ./bin; fi && gcc "
                        ..file.." -o bin/program -Wall -g && ./bin/program"),
                    components={"on_output_summarize","default"}
                }
            end,
            condition={
                filetype={"c"}
            }
        }

        overseer.register_template{
            name="run c file",
            builder=function()
                return{
                    cmd=string.format("cd "..filepath..
                        " && if test /bin/program; then ./bin/program; else echo 'nothing to run'; fi"),
                    components={"on_output_summarize","default"}
                }
            end,
            condition={
                filetype={"c"}
            }
        }

        -------- GO COMMANDS --------

        overseer.register_template{
            name="build and run go file",
            builder=function()
                return{
                    cmd=string.format("cd "..filepath..
                        " && if test -d ./bin; then echo -n ''; else mkdir -p ./bin; fi && go build -o bin/program -a -gcflags='-N -l' "
                        ..file.."&& ./bin/program"),
                    components={"on_output_summarize","default"}
                }
            end,
            condition={
                filetype={"go","golang"}
            }
        }

        overseer.register_template{
            name="build go file",
            builder=function()
                return{
                    cmd=string.format("cd "..filepath..
                        " && if test -d ./bin; then echo -n ''; else mkdir -p ./bin; fi && go build -o bin/program -a -gcflags='-N -l' "
                        ..file..""),
                    components={"on_output_summarize","default"}
                }
            end,
            condition={
                filetype={"go","golang"}
            }
        }

        overseer.register_template{
            name="run go file",
            builder=function()
                return{
                    cmd=string.format("cd "..filepath.." && go run "..file..""),
                    components={"on_output_summarize","default"}
                }
            end,
            condition={
                filetype={"go","golang"}
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
    end
}
