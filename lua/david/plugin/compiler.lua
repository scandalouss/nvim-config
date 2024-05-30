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

overseer.setup{
    templates={"builtin",},
    dap=true,
    task_list={
        direction="bottom"
    }
}
require("compiler").setup()
