return{
    {
        "epwalsh/obsidian.nvim",
        lazy=true,
        ft="markdown",
        dependencies={"nvim-lua/plenary.nvim"},
        config=function()
            local obsidian=require("obsidian")
            obsidian.setup({
                workspaces={
                    {name="coding-notes", path="~/Documents/notes/coding-notes",}
                },
                ui={enable=false},
                --enable opening urls
                ---@param url string
                follow_url_func=function(url)
                    vim.fn.jobstart({"xdg-open", url})
                end,
                --do the same for images
                ---@param img string
                follow_img_func=function(img)
                    vim.fn.jobstart({"xdg-open",img})
                end,

            })
        end
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        lazy=true,
        ft="markdown",
        config=function()
            local rendermarkdown=require("render-markdown")
            rendermarkdown.setup()
        end
    }
}
