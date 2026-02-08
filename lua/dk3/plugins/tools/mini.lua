-- some mini.nvim utlities/goodies
return{
    {
        "echasnovski/mini.pairs",
        lazy=true,
        event="VeryLazy",
        config=function()
            local pairs=require("mini.pairs")
            pairs.setup{}
        end
    },
    {
        "echasnovski/mini.hipatterns",
        lazy=true,
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
        lazy=true,
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
                    -- play with the timing numbers
                    timing = function(_, n) return math.min(160/ n, 4) end
                },
                cursor={enable=true},
            }
        end
    },
    {
        "echasnovski/mini.surround",
        lazy = true,
        -- event = "VeryLazy",
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
        lazy=true,
        event="VeryLazy",
        config=function()
            local comment = require("mini.comment")
            comment.setup{}
        end
    },
    {
        "echasnovski/mini.statusline",
        lazy = false,
        config = function()
            local statusline = require("mini.statusline")
            statusline.setup{}
        end
    },
    {
        "echasnovski/mini.sessions",
        lazy = false,
        config = function ()
            local session = require("mini.sessions")
            session.setup{
                file = "Session.vim",
            }
        end
    },
    {
        "echasnovski/mini.extra",
        lazy = true,
        event = "VeryLazy",
        config = function ()
            local extras = require("mini.extra")
            extras.setup()
        end
    },
    {
        "echasnovski/mini.pick",
        lazy = true,
        event = "VeryLazy",
        config = function()
            local picker = require("mini.pick")
            picker.setup{}

            -- --sessions picker
            -- MiniPick.registry.sessions = function()
            --     local cwd = vim.fn.expand("~/.local/share/nvim/sessions")
            --     local filter = function(data)
            --         return data.fs_type == "file"
            --     end
            --     local choose = function(item)
            --         vim.fn.chdir(cwd)
            --         vim.schedule(function() vim.cmd("source "..item.path) end)
            --     end
            --     return MiniExtra.pickers.explorer({ cwd = cwd, filter = filter }, { source = { choose = choose } })
            -- end

            -- project kinda picker
            MiniPick.registry.projects = function()
                local cwd = vim.fn.expand('~/code/projects')
                local filter = function(data)
                    return data.fs_type == "directory"
                end
                local choose = function(item)
                    vim.schedule(function() vim.api.nvim_set_current_dir(item.path) vim.cmd("Explore") end)
                end
                return MiniExtra.pickers.explorer({ cwd = cwd, filter = filter }, { source = { choose = choose } })
            end
        end
    },
}
