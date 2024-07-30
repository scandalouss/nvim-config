return {
    name="build and run c file",
    builder=function()
        local file=vim.fn.expand("%:p:t")
        local filepath=vim.fn.expand("%:p:h")
        return{
            name="build c from the c_build.lua file",
            strategy={
                "orchestrator",
                tasks={
                    {"shell", cmd="cd "..filepath..
                    " && if test -d ./bin; then echo -n ''; else mkdir -p ./bin; fi && gcc "
                    ..file.." -o bin/program -Wall -g && ./bin/program"},
                }
            },
            components={"on_output_summarize", "default"}
        }
    end,
    condition={
        filetype={"c"}
    }
}
