local bufferline=require("bufferline")
bufferline.setup{
    options={
        style_preset=bufferline.style_preset.no_italic,
        mode="buffers",
        themable=true,
        offsets={
            filetype="NvimTree",
            text="File Explorer",
            text_align="center",
            seperator=true
        },
        color_icons=true,
        diagnostics="nvim_lsp",
    }
}
