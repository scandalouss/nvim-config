local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

--set seed
math.randomseed(os.time())

local function footer()
    local version=vim.version()
    local datetime=os.date(" %d-%m-%Y   %H:%M:%S")
    local nvimversion=version.major .. "." .. version.minor .. "." ..version.patch
    return datetime .. "  |  N E O V I M  " .. nvimversion
end

local function pickacolor()
    local colors={"String", "Identifier", "Keyword", "Number"}
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

dashboard.section.header.val=logo
dashboard.section.header.opts.hl=pickacolor()

dashboard.section.buttons.val={
    dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("p", "  Open Recent Projects", ":Telescope projects<CR>"),
    dashboard.button("f", "  Find file", ":cd $HOME | Telescope find_files<CR>"),
    dashboard.button("e", "  Open file explorer", ":lua require('nvim-tree.api').tree.open({current_window=true})<CR>"),
    dashboard.button("s", "  Settings", ":e $MYVIMRC | :cd %:p:h | NvimTreeToggle<CR>"),
    dashboard.button("q", "✘  Quit  N E O V I M", ":qa<CR>")
}

dashboard.section.footer.val=footer()
dashboard.section.footer.opts.hl = "Constant"

alpha.setup(dashboard.opts)
