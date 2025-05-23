-- bottom ui bar full of good info
return{
    "nvim-lualine/lualine.nvim",
    event="VeryLazy",
    config=function()
        local statusbar=require("lualine")
        local utils = require('lualine.utils.utils')

        --colors
        --using highlight groups to define the theme,
        --sorta like auto already does but with my own colors
        --it's so i can copy the config around to multiple pc's
        --and not have the color theme be completely booty

        local colors={
            black='#000000',
            white='#ffffff',
            lightgray=utils.extract_color_from_hllist('bg',{'PmenuSel'}),
            darkgray=utils.extract_color_from_hllist('bg',{'Pmenu'}),
            normal=utils.extract_color_from_hllist('fg',{'Conditional'}),
            insert=utils.extract_color_from_hllist('fg',{'String'}),
            replace=utils.extract_color_from_hllist('fg',{'Label'}),
            visual=utils.extract_color_from_hllist('fg',{'Constant'}),
            command=utils.extract_color_from_hllist('fg',{'Identifier'}),
        }
        local godtheme={
            normal={
                a={bg=colors.normal,fg=colors.black,gui='bold'},
                b={bg=colors.black,fg=colors.normal},
                c={bg=colors.darkgray,fg=colors.white},
            },
            insert={
                a={bg=colors.insert,fg=colors.black,gui='bold'},
                b={bg=colors.black,fg=colors.insert},
                c={bg=colors.darkgray,fg=colors.white},
            },
            command={
                a={bg=colors.command,fg=colors.black,gui='bold'},
                b={bg=colors.black,fg=colors.command},
                c={bg=colors.darkgray,fg=colors.white},
            },
            visual={
                a={bg=colors.visual,fg=colors.black,gui='bold'},
                b={bg=colors.black,fg=colors.visual},
                c={bg=colors.darkgray,fg=colors.white},
            },
            replace={
                a={bg=colors.replace,fg=colors.black,gui='bold'},
                b={bg=colors.black,fg=colors.replace},
                c={bg=colors.darkgray,fg=colors.white},
            },
        }
        statusbar.setup{
            options={
                theme=godtheme,
                section_separators={ left='',right= ''},
                component_separators={left='|',right='|'},
                icons_enabled=true,
                sections={
                    lualine_c={
                        "selectioncount",
                        "searchcount",
                        "filename",
                        "overseer"
                    },
                },
                inactive_sections = {
                    lualine_a = {"mode"},
                    lualine_b = {},
                    lualine_c = {"filename"},
                    lualine_x = {'location'},
                    lualine_y = {},
                    lualine_z = {}
                },
                inactive_winbar = {
                    lualine_a = {"mode"},
                    lualine_c = {"filename"},
                    lualine_x = {"location"}
                }
            },
            extensions={
                "mason",
                "lazy",
                "fzf",
                "man",
                "neo-tree",
                "nvim-dap-ui",
                "trouble",
                "overseer",
            },
        }
    end
}
