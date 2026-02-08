let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 init.lua
badd +126 lua/dk3/plugins/tools/mini.lua
badd +1 ~/.config/nvim
badd +1 lua/dk3/init.lua
badd +1 lua/dk3/plugins/tools/sessions.lua
badd +2 lua/dk3/opts/theme/settings.lua
argglobal
%argdel
edit lua/dk3/plugins/tools/mini.lua
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
balt lua/dk3/opts/theme/settings.lua
setlocal foldmethod=manual
setlocal foldexpr=v:lua.vim.treesitter.foldexpr()
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=99
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
sil! 7,10fold
sil! 3,11fold
sil! 19,21fold
sil! 18,22fold
sil! 16,23fold
sil! 12,24fold
sil! 35,41fold
sil! 31,43fold
sil! 29,44fold
sil! 25,45fold
sil! 53,58fold
sil! 52,59fold
sil! 50,60fold
sil! 46,61fold
sil! 66,69fold
sil! 62,70fold
sil! 74,77fold
sil! 71,78fold
sil! 84,86fold
sil! 82,87fold
sil! 79,88fold
sil! 93,96fold
sil! 89,97fold
sil! 122,124fold
sil! 125,127fold
sil! 120,129fold
sil! 102,130fold
sil! 98,131fold
sil! 136,140fold
sil! 132,141fold
sil! 2,142fold
let &fdl = &fdl
let s:l = 126 - ((50 * winheight(0) + 33) / 67)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 126
normal! 0102|
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
