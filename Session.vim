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
set shortmess+=aoO
badd +73 lua/dlk/opts/theme/highlights/minimal.lua
badd +1 lua/dlk/opts/theme/colors/defaultnvim.lua
badd +32 lua/dlk/opts/theme/colors/neovim.lua
badd +2 lua/dlk/opts/theme/settings.lua
badd +1 lua/dk3/opts/theme/highlights/minimal.lua
badd +44 lua/dlk/opts/settings.lua
badd +82 lua/dlk/plugins/utils.lua
badd +1 lua/dlk/opts/theme/colors/gentoo2.lua
badd +9 lua/dlk/init.lua
argglobal
%argdel
edit lua/dlk/plugins/utils.lua
argglobal
balt lua/dlk/opts/theme/colors/gentoo2.lua
setlocal foldmethod=manual
setlocal foldexpr=v:lua.vim.treesitter.foldexpr()
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=99
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
sil! 1,16fold
sil! 35,37fold
sil! 38,40fold
sil! 41,44fold
sil! 34,45fold
sil! 49,51fold
sil! 48,52fold
sil! 60,62fold
sil! 64,67fold
sil! 69,71fold
sil! 74,78fold
sil! 79,81fold
sil! 73,82fold
let &fdl = &fdl
let s:l = 69 - ((68 * winheight(0) + 34) / 69)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 69
normal! 024|
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
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
