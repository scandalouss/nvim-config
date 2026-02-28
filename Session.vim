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
badd +58 lua/dlk/plugins/utils.lua
badd +441 lua/dlk/plugins/overseer.lua
badd +64 lua/dlk/opts/settings.lua
badd +2 lua/dlk/opts/theme/settings.lua
argglobal
%argdel
edit lua/dlk/plugins/overseer.lua
argglobal
balt lua/dlk/plugins/utils.lua
setlocal foldmethod=manual
setlocal foldexpr=v:lua.vim.treesitter.foldexpr()
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=99
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
sil! 12,14fold
sil! 10,15fold
sil! 9,16fold
sil! 17,19fold
sil! 7,20fold
sil! 26,28fold
sil! 24,29fold
sil! 23,30fold
sil! 31,33fold
sil! 21,34fold
sil! 40,42fold
sil! 38,43fold
sil! 37,44fold
sil! 45,47fold
sil! 35,48fold
sil! 54,56fold
sil! 52,57fold
sil! 51,58fold
sil! 59,61fold
sil! 49,62fold
sil! 68,70fold
sil! 66,71fold
sil! 65,72fold
sil! 73,75fold
sil! 63,76fold
sil! 87,89fold
sil! 85,90fold
sil! 82,91fold
sil! 92,94fold
sil! 80,95fold
sil! 102,104fold
sil! 100,105fold
sil! 98,106fold
sil! 107,109fold
sil! 96,110fold
sil! 116,118fold
sil! 119,121fold
sil! 115,122fold
sil! 113,123fold
sil! 124,126fold
sil! 111,127fold
sil! 133,135fold
sil! 136,138fold
sil! 132,139fold
sil! 130,140fold
sil! 141,143fold
sil! 128,144fold
sil! 152,154fold
sil! 150,155fold
sil! 147,156fold
sil! 157,159fold
sil! 145,160fold
sil! 166,167fold
sil! 168,170fold
sil! 165,171fold
sil! 163,172fold
sil! 173,175fold
sil! 161,176fold
sil! 182,183fold
sil! 184,186fold
sil! 181,187fold
sil! 179,188fold
sil! 189,191fold
sil! 177,192fold
sil! 200,202fold
sil! 198,203fold
sil! 195,204fold
sil! 205,207fold
sil! 193,208fold
sil! 218,220fold
sil! 221,223fold
sil! 217,224fold
sil! 214,225fold
sil! 226,229fold
sil! 212,230fold
sil! 237,239fold
sil! 240,242fold
sil! 236,243fold
sil! 233,244fold
sil! 245,248fold
sil! 231,249fold
sil! 255,256fold
sil! 257,259fold
sil! 254,260fold
sil! 252,261fold
sil! 262,265fold
sil! 250,266fold
sil! 273,275fold
sil! 276,278fold
sil! 272,279fold
sil! 269,280fold
sil! 281,284fold
sil! 267,285fold
sil! 292,294fold
sil! 295,297fold
sil! 291,298fold
sil! 288,299fold
sil! 300,303fold
sil! 286,304fold
sil! 310,311fold
sil! 312,314fold
sil! 309,315fold
sil! 307,316fold
sil! 317,320fold
sil! 305,321fold
sil! 327,329fold
sil! 325,330fold
sil! 324,331fold
sil! 332,334fold
sil! 322,335fold
sil! 345,347fold
sil! 348,350fold
sil! 344,351fold
sil! 341,352fold
sil! 353,355fold
sil! 339,356fold
sil! 363,365fold
sil! 366,368fold
sil! 362,369fold
sil! 359,370fold
sil! 371,373fold
sil! 357,374fold
sil! 382,384fold
sil! 380,385fold
sil! 377,386fold
sil! 387,389fold
sil! 375,390fold
sil! 399,401fold
sil! 397,402fold
sil! 395,403fold
sil! 404,406fold
sil! 393,407fold
sil! 413,415fold
sil! 411,416fold
sil! 410,417fold
sil! 418,420fold
sil! 408,421fold
sil! 427,429fold
sil! 430,432fold
sil! 434,441fold
sil! 443,446fold
sil! 433,447fold
sil! 424,448fold
sil! 453,457fold
sil! 458,463fold
sil! 451,464fold
let &fdl = &fdl
let s:l = 441 - ((28 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 441
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
