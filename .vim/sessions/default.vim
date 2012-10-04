" ~/.vim/sessions/default.vim: Vim session script.
" Created by session.vim 1.5 on 02 October 2012 at 23:16:24.
" Open this file in Vim and run :source % to restore your session.

set guioptions=aegimrLtT
silent! set guifont=
if exists('g:syntax_on') != 1 | syntax on | endif
if exists('g:did_load_filetypes') != 1 | filetype on | endif
if exists('g:did_load_ftplugin') != 1 | filetype plugin on | endif
if exists('g:did_indent_on') != 1 | filetype indent on | endif
if &background != 'dark'
	set background=dark
endif
if !exists('g:colors_name') || g:colors_name != 'solarized' | colorscheme solarized | endif
call setqflist([])
let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Dropbox/touhoumon/web
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 main.rb
badd +1 templates/play.html
badd +1 public/js/data.js
badd +1 public/coffee/play.coffee
badd +1 public/less/play.less
badd +1 views/play.haml
badd +69 ../game/types.csv
badd +0 ../types.csv
args main.rb
set lines=70 columns=203
edit main.rb
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
2wincmd k
wincmd w
wincmd w
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe '1resize ' . ((&lines * 7 + 35) / 70)
exe 'vert 1resize ' . ((&columns * 101 + 101) / 203)
exe '2resize ' . ((&lines * 25 + 35) / 70)
exe 'vert 2resize ' . ((&columns * 101 + 101) / 203)
exe '3resize ' . ((&lines * 34 + 35) / 70)
exe 'vert 3resize ' . ((&columns * 101 + 101) / 203)
exe '4resize ' . ((&lines * 33 + 35) / 70)
exe 'vert 4resize ' . ((&columns * 101 + 101) / 203)
exe '5resize ' . ((&lines * 34 + 35) / 70)
exe 'vert 5resize ' . ((&columns * 101 + 101) / 203)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 9 - ((6 * winheight(0) + 3) / 7)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
9
normal! 02l
wincmd w
argglobal
edit public/js/data.js
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 214 - ((8 * winheight(0) + 12) / 25)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
214
normal! 01l
wincmd w
argglobal
edit public/coffee/play.coffee
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 298 - ((21 * winheight(0) + 17) / 34)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
298
normal! 0
wincmd w
argglobal
edit views/play.haml
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 19 - ((9 * winheight(0) + 16) / 33)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
19
normal! 070l
wincmd w
argglobal
edit public/less/play.less
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 473 - ((30 * winheight(0) + 17) / 34)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
473
normal! 025l
wincmd w
3wincmd w
exe '1resize ' . ((&lines * 7 + 35) / 70)
exe 'vert 1resize ' . ((&columns * 101 + 101) / 203)
exe '2resize ' . ((&lines * 25 + 35) / 70)
exe 'vert 2resize ' . ((&columns * 101 + 101) / 203)
exe '3resize ' . ((&lines * 34 + 35) / 70)
exe 'vert 3resize ' . ((&columns * 101 + 101) / 203)
exe '4resize ' . ((&lines * 33 + 35) / 70)
exe 'vert 4resize ' . ((&columns * 101 + 101) / 203)
exe '5resize ' . ((&lines * 34 + 35) / 70)
exe 'vert 5resize ' . ((&columns * 101 + 101) / 203)
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
tabnext 1
3wincmd w

" vim: ft=vim ro nowrap smc=128
