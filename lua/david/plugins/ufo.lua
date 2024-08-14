return{
    "kevinhwang91/nvim-ufo",
    dependencies="kevinhwang91/promise-async",
    lazy=false,
    config=function()
        local ufo=require("ufo")
        ufo.setup{
            provider_selector = function(_,_,_)
                return {'treesitter', 'indent'}
            end
        }
    end
}
