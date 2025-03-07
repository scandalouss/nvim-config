-- some mini.nvim utlities/goodies
return{
    {
        "echasnovski/mini.pairs",
        event="VeryLazy",
        config=function()
            local pairs=require("mini.pairs")
            pairs.setup()
        end
    },
    {
        "echasnovski/mini.hipatterns",
        event="VeryLazy",
        config=function()
            local hipatterns=require("mini.hipatterns")
            hipatterns.setup{
                highlighters={
                    hex_color=hipatterns.gen_highlighter.hex_color(),
                }
            }
        end
    },
    {
        "echasnovski/mini.animate",
        event="VeryLazy",
        config=function()
            local anim=require("mini.animate")
            anim.setup{
                resize={enable=false},
                open={enable=false},
                close={enable=false},
                scroll={
                    enable = true,
                    -- temp fix for scrolling with "set wrap" enabled
                    -- https://github.com/echasnovski/mini.nvim/issues/242#issuecomment-1446046151
                    timing = function(_, n) return math.min(250 / n, 5) end
                },
                cursor={enable=true},
            }
        end
    },
    {
        "echasnovski/mini.map",
        lazy=false,
        config=function()
            local map=require("mini.map")
            map.setup()
        end
    },
    {
        "echasnovski/mini.surround",
        lazy=false,
        config=function()
            local surround = require("mini.surround")
            surround.setup{
                custom_surroundings = {
                    ['('] = { output = { left = '( ', right = ' )' } },
                    ['['] = { output = { left = '[ ', right = ' ]' } },
                    ['{'] = { output = { left = '{ ', right = ' }' } },
                    ['<'] = { output = { left = '< ', right = ' >' } },
                },
            }
        end
    },
    {
        "echasnovski/mini.comment",
        lazy=false,
        config=function()
            local comment = require("mini.comment")
            comment.setup{}
        end
    },
}
