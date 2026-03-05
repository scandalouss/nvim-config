let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
doautoall SessionLoadPre
silent only
silent tabonly
cd ~/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
set shortmess+=aoO
badd +16 ~/.config/wezterm/wezterm.lua
badd +29 ~/.config/wezterm/colors/gentoo3.toml
badd +41 lua/dlk/plugins/utils.lua
badd +1 lua/dlk/plugins/mini.lua
badd +1 lua/dlk/opts/settings.lua
badd +3 lua/dlk/opts/theme/settings.lua
badd +11 lua/dlk/opts/theme/init.lua
argglobal
%argdel
edit lua/dlk/plugins/utils.lua
argglobal
balt lua/dlk/plugins/mini.lua
setlocal foldmethod=manual
setlocal foldexpr=v:lua.vim.treesitter.foldexpr()
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=99
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
sil! 1,18fold
sil! 42,45fold
sil! 46,48fold
sil! 49,52fold
sil! 41,53fold
sil! 38,54fold
sil! 60,62fold
sil! 59,63fold
sil! 71,73fold
sil! 75,78fold
sil! 80,82fold
sil! 85,89fold
sil! 90,92fold
sil! 84,93fold
let &fdl = &fdl
let s:l = 93 - ((66 * winheight(0) + 33) / 67)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 93
normal! 0
lcd ~/.config/nvim
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
