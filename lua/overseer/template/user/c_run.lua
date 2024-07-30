return {
  name = "run c file",
  builder = function()
    local filepath=vim.fn.expand("%:p:h")
    return{
       name="build c from the c_build.lua file",
       strategy={
           "orchestrator",
           tasks={
               {"shell", cmd="cd "..filepath.." && ./bin/program"},
           }
       },
       filetype={"c"},
       components={"on_output_summarize", "default"}
   }
   end
}
