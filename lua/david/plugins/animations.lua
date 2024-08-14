return{
    "echasnovski/mini.animate",lazy=false,
    config=function()
        local anim=require("mini.animate")
        anim.setup{
            resize={enable=false,},
            open={enable=false,},
            close={enable=false,},
            scroll={enable=true,},
            cursor={enable=true,},
        }
    end
}
