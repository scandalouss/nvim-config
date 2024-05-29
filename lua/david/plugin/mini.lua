local pairs=require("mini.pairs")
local anim=require("mini.animate")
local notify=require("mini.notify")
local map=require("mini.map")
local hipatterns=require("mini.hipatterns")

pairs.setup()
notify.setup()
anim.setup{
    resize={
        enable=false
    },
    open={
        enable=false,
    },
    close={
        enable=false,
    },
    scroll={
        enable=true,
    },
    cursor={
        enable=true,
    },
}
map.setup{
    window={
        focusable=false,
    }
}
hipatterns.setup{
    highlighters={
        hex_color = hipatterns.gen_highlighter.hex_color(),
    }
}
