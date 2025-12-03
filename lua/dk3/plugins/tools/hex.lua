return{
    -- simple hex editing utilities within neovim
    'RaafatTurki/hex.nvim',
    event={"BufReadPre", "BufNewFile"},
    config=function()
        local hexedit=require('hex')
        hexedit.setup({})
    end
}
