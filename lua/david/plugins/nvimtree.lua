return{
    "nvim-tree/nvim-tree.lua",
    dependencies={"nvim-tree/nvim-web-devicons"},
    event="VeryLazy",
    config=function()
        local nvimtree=require("nvim-tree")
        --
        --turn off netrw
        vim.g.loaded_netrw=1
        vim.g.loaded_netrwPlugin=1

        nvimtree.setup({
            sync_root_with_cwd=true,
            respect_buf_cwd=true,
            update_focused_file={
                enable=true,
                update_root=true,
            },
            actions={
                open_file={
                    quit_on_open=false,
                },
            },
            filters={
                dotfiles=true
            }
        })
    end
}
