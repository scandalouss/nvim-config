return{
    -- makes folds better on nvim
    "kevinhwang91/nvim-ufo",
    dependencies="kevinhwang91/promise-async",
    lazy=false,
    config=function()
        local ufo=require("ufo")
        ufo.setup({
            provider_selector = function(bufnr, filetype, buftype)
                return{"treesitter", "indent"}
            end
        })
        --autocmd to stop folds from opening in certain buffer types
        vim.api.nvim_create_autocmd('FileType', {
            pattern = { 'neo-tree' },
            callback = function()
                require('ufo').detach()
                vim.opt_local.foldenable = false
                vim.opt_local.foldcolumn = '0'
            end,
        })
    end
}
