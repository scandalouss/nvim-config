
return{
    "stevearc/overseer.nvim",
    lazy=true,
    event={"BufReadPre","BufNewFile"},
    config=function()
        local overseer=require("overseer")

        ---------- UECLI/UNREAL ENGINE PROJECT CMDS --------

        overseer.register_template{
            name="build unreal project",
            builder=function()
                return{
                    cmd=string.format("uecli build"),
                    components={"on_output_summarize","on_complete_notify","on_result_diagnostics_trouble", "default",},
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
                    components={"on_output_summarize","on_complete_notify","on_result_diagnostics_trouble", "default",},
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
                    components={"on_output_summarize","on_complete_notify","on_result_diagnostics_trouble", "default",},
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
                    components={"on_output_summarize","on_complete_notify","on_result_diagnostics_trouble", "default",},
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
                local file=vim.fn.expand("%:p:t")
                local filepath=vim.fn.expand("%:p:h")
                return{
                    cmd=string.format("cd "..filepath.." && python "..file..""),
                    components={"on_output_summarize","on_complete_notify","on_result_diagnostics_trouble", "default",},
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
                        ..file.." -o bin/program -Wall -g"),
                    components={"on_output_summarize","on_complete_notify","on_result_diagnostics_trouble", "default",}
                }
            end,
            condition={
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
                        ..file.." -o bin/program -Wall -g && ./bin/program"),
                    components={"on_output_summarize","on_complete_notify","on_result_diagnostics_trouble", "default",}
                }
            end,
            condition={
                filetype={"c++","cpp"}
            }
        }

        overseer.register_template{
            name="run c++ file",
            builder=function()
                local filepath=vim.fn.expand("%:p:h")
                return{
                    cmd=string.format("cd "..filepath..
                        " && if test ./bin/program; then ./bin/program; else echo 'nothing to run'; fi"),
                    components={"on_output_summarize","on_complete_notify","on_result_diagnostics_trouble", "default",}
                }
            end,
            condition={
                filetype={"c++","cpp"}
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
                        ..file.." -o bin/program -Wall -g"),
                    components={"on_output_summarize","on_complete_notify","on_result_diagnostics_trouble", "default",}
                }
            end,
            condition={
                filetype={"c"}
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
                        ..file.." -o bin/program -Wall -g && ./bin/program"),
                    components={"on_output_summarize","on_complete_notify","on_result_diagnostics_trouble", "default",}
                }
            end,
            condition={
                filetype={"c"}
            }
        }

        overseer.register_template{
            name="run c file",
            builder=function()
                local filepath=vim.fn.expand("%:p:h")
                return{
                    cmd=string.format("cd "..filepath..
                        " && if test /bin/program; then ./bin/program; else echo 'nothing to run'; fi"),
                    components={"on_output_summarize","on_complete_notify","on_result_diagnostics_trouble", "default",}
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
                local file=vim.fn.expand("%:p:t")
                local filepath=vim.fn.expand("%:p:h")
                return{
                    cmd=string.format("cd "..filepath..
                        " && if test -d ./bin; then echo -n ''; else mkdir -p ./bin; fi && go build -o bin/program -a -v -gcflags='-N -l' "
                        ..file.."&& ./bin/program"),
                    components={"on_output_summarize","on_complete_notify","on_result_diagnostics_trouble", "default",}
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
                        " && if test -d ./bin; then echo -n ''; else mkdir -p ./bin; fi && go build -o bin/program -a -v -gcflags='-N -l' "
                        ..file..""),
                    components={"on_output_summarize","on_complete_notify","on_result_diagnostics_trouble", "default",}
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
                    components={"on_output_summarize","on_complete_notify","on_result_diagnostics_trouble", "default",}
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
    end
}
