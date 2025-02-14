return{
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
    },
    lazy=false,
    config=function()
        local neogit=require("neogit")
        neogit.setup{
            kind = "floating",
            commit_editor = {
               kind = "floating"
            },
            commit_select_view = {
               kind = "floating"
            },
            commit_view = {
                verify_commit = true,
                kind = "floating"
            },
            log_view = {
                kind = "floating",
            },
            rebase_editor = {
                kind = "floating",
            },
            reflog_view = {
                kind = "floating",
            },
            merge_editor = {
                kind = "floating",
            },
            description_editor = {
                kind = "floating",
            },
            tag_editor = {
                kind = "floating",
            },
            preview_buffer = {
                kind = "floating",
            },
            popup = {
                kind = "floating",
            },
            stash = {
                kind = "floating",
            },
            refs_view = {
                kind = "floating",
            },
            integrations = {
                telescope = true
            }
        }
    end
}
