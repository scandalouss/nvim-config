-- greeter page
math.randomseed(os.time())

local function footer()
    local version=vim.version()
    local datetime=os.date("󰃮 %d-%m-%Y  󰥔 %H:%M:%S")
    local nvimversion=version.major .. "." .. version.minor .. "." ..version.patch
    return datetime .. "  |  N E O V I M  " .. nvimversion
end

local function pickacolor()
    local colors={"String", "Identifier", "Keyword", "Number", "Type"}
    return colors[math.random(#colors)]
end

local logo={
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⡄⠀⠀⠀⠀⠀⠀⡟⣇⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⢳⠀⠀⠀⠀⠀⢠⡇⣿⠀⠀⢀⣠⣤⣤⣄⡀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⠀⢀⣿⣈⣧⣤⣤⣤⣤⣾⣴⣇⣴⣾⡭⠶⠶⣲⣿⡟",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⣿⣭⣭⣽⣿⡟⠉⠉⠀⠀⠀⠀⠀⠈⠙⢿⣿⠷⠶⠶⠛⠋⠁⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠿⣯⣥⣤⣶⠾⠻⣷⠀⠀⠀⠀⠀⠀⠀⣀⠀⠘⣿⡆⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣇⠀⠀⡀⠀⠀⠀⠉⠀⠀⢿⣧⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣿⡀⣾⣿⠇⠀⠀⠀⠀⠀⢸⣿⡀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⣦⣄⣀⡀⠀⠀⠀⠀⢀⣀⣀⣠⣤⣴⡶⠿⠛⠛⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀",
    "⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡁⠀⠀⠀⠀⢹⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⠀⠀⠀⠀⠀",
    "⣾⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⣿⡆⠀⠀⠀⠀⠀⠀⠀⣀⣘⣿⡄⠀⠀⠀⠀",
    "⠹⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⡿⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⣀⠀⠀⠀⠀⠘⣿⡄⠀⢀⣤⣶⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀",
    "⠀⢹⡄⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⡇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⣿⡆⠀⠀⢀⣄⣼⣿⣶⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀",
    "⠀⠀⠙⠶⣄⣀⠀⠀⢀⣴⡿⠙⣿⣿⡀⠙⠿⠿⠿⠿⢻⣿⣿⣿⣿⠏⠀⠀⠀⣿⣇⠀⠀⢻⣿⣿⣿⣯⠙⠿⠿⠛⠋⠁⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠉⠛⠛⠛⠉⠀⠀⠈⢿⣿⣄⠀⠀⠀⠀⣾⣿⣁⡀⠀⠀⠀⣀⣠⣿⣿⠀⠀⢸⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣻⡟⠀⠀⠀⣰⣿⣿⣿⣿⠟⠛⠛⠛⠉⠉⣿⡆⠀⢸⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣦⠀⢸⡿⢿⣿⣿⠃⠀⠀⠀⠀⠀⠀⢹⣧⠀⢸⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣧⢸⡇⠀⠹⣿⣧⠀⠀⠀⠀⠀⠀⠈⢿⡄⠸⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⡇⢿⡀⠀⣿⣿⣧⠀⠀⠀⠀⠀⠀⠘⣿⡀⢿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣾⡧⠀⠿⠿⠟⠀⠀⠀⠀⠀⠀⠀⠻⠿⠿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
}


return{
    "goolord/alpha-nvim",
    lazy=false,
    config=function()
        local alpha=require("alpha")
        local dashboard=require("alpha.themes.dashboard")
        dashboard.section.header.val=logo
        dashboard.section.header.opts.hl=pickacolor()
        dashboard.section.buttons.val={
            dashboard.button("n", "󱇧  New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("p", "  Open Projects", ":cd $HOME | :Telescope projects<CR>"),
            dashboard.button("r", "󰈙  Open Recent File", ":cd $HOME | Telescope oldfiles<CR>"),
            dashboard.button("f", "󰈞  Find file", ":cd $HOME | Telescope find_files<CR>"),
            dashboard.button("e", "󰝰  Open file explorer", "<CMD>Neotree position=current<CR>"),
            dashboard.button("s", "  Settings", ":e $MYVIMRC | :cd %:p:h | Neotree position=current<CR>"),
            dashboard.button("l", "󰒲  Open Lazy", ":Lazy<CR>"),
            dashboard.button("m", "󰣪  Open Mason", ":Mason<CR>"),
            dashboard.button("q", "󰩈  Quit  N E O V I M", ":qa<CR>"),
        }
        dashboard.section.footer.val=footer()
        dashboard.section.footer.opts.hl = pickacolor()
        alpha.setup(dashboard.opts)
    end,
}
