" Reserved buffers: l, m, y
" Reserved control characters (lowercase = somewhat useful, can be changed):
" = ]
" - W E R t Y _ I o P
" a s D _ _ _ J K _
" z X C V _ _ _
" Reserved alt characters:
" q d y p j k

" ============================================================================
"                               STORED MACROS
" ============================================================================

" Break up an if-block
nmap <Leader>q ^w%a<CR>{<CR><ESC>o}<ESC>=%

nmap <Leader>w :s/1/2/g<CR><C-x>

" ============================================================================
"                               COMMANDS
" ============================================================================
" typo fix
command! WQ mks | wq
command! Wq mks | wq
command! W w
command! Q mks | q
" command Q! q!

" Word count
command! WC w !wc

" Automatically load vimrc changes
au! BufWritePost .vimrc source %
command! RL :source $MYVIMRC

" ============================================================================
"                               CHANGES
" ============================================================================

" fix Y to behave like D, C
map Y y$

" marks & register
" " is used to go to a particular mark
nnoremap " `
" ` now stores a mark in the given register
nnoremap M mm
" M stores a mark in the default register m
nnoremap m `m
" m goes to the mark in the default register mnnoremap m `m
" use ' instead of " to store to registers for easy typing
nnoremap ' "

" macro
nnoremap Q ql
nnoremap q @l
nnoremap <F1> Q
nnoremap <F2> q

" Go to last edited location
nnoremap - `.

" navigation on wrapped lines, line wrapping
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
inoremap <down> <ESC>lgji
inoremap <up> <ESC>lgki

" ============================================================================
"                               NEW STUFF
" ============================================================================

" delete, yank, format on paragraphs
nnoremap <C-d> {v}k$d
nnoremap <C-y> {v}k$y}
nnoremap <C-=> "nm{v}="n`

" clear status and higlighting
nnoremap <C-x> :let @/=""<CR>i<ESC>

" insert single character with s
function! RepeatChar(char, count)
    return repeat(a:char, a:count)
endfunction
nnoremap <silent> s :<C-U>exec "normal i".RepeatChar(nr2char(getchar()), v:count1)<CR>
nnoremap <silent> S :<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>

" autocomplete
function! SuperTab()
    if (strpart(getline('.'),col('.')-2,1)=~'^\W\?$')
        return "\<Tab>"
    else
        return "\<C-p>"
    endif
endfunction
inoremap <Tab> <C-R>=SuperTab()<CR>

" autocomplete
function! SuperTab2()
    if (strpart(getline('.'),col('.')-2,1)=~'^\W\?$')
        return "\<Tab>"
    else
        return "\<C-n>"
    endif
endfunction
inoremap <C-t> <C-R>=SuperTab2()<CR>

" F6 to toggle spellcheck mode
let g:spelling = 0
function! Spelling()
    let g:spelling = 1 - g:spelling
    if g:spelling == 1
        :setlocal spell! spelllang=en_au
        :nnoremap e zg
        :nnoremap ? z=
        :nnoremap n ]s
    else
        :setlocal nospell
        :nunmap e
        :nunmap ?
        :nunmap n
    endif
endf

nmap <F6> :call Spelling()<CR>

" paste second-last deleted content
nnoremap <C-p> "2p
" paste last inserted content
nnoremap <C-i> ".p
" operate on system clipboard
set clipboard+=unnamed
nnoremap <C-c> "+
vnoremap <C-c> "+y
nnoremap <C-v> "+p

" yanking & deleting
nnoremap _ "_
nnoremap <A-d> "_dd
vnoremap <A-d> "_d
nnoremap <A-y> "yyy
vnoremap <A-y> "yy
nnoremap <A-p> "yp

" select block
vnoremap - /{<CR>%

" Split window
nnoremap <C-s> :sp<CR>
" pasting
set pastetoggle=<F3>

" commenting
au FileType tex     nnoremap # 0i% <ESC>j
au FileType python  nnoremap # 0i# <ESC>j

" Close HTML/XML tags
:au Filetype html,xml,xsl source ~/.vim/plugin/closetag.vim 

"Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nnoremap <A-j> ddp
nnoremap <A-k> ddkP

" ============================================================================
"                               CONVENIENCE
" ============================================================================

" basics
nnoremap f .
nnoremap ; :wall<CR>

" split window navigation
nnoremap <C-e> <C-w>w
inoremap <C-e> <ESC><C-w>w

" Easy navigation
nmap <TAB> W
nmap H g^
nmap L g$
vnoremap H g^
vnoremap L g$
nnoremap <C-j> <C-F>
nnoremap <C-k> <C-B>

" Insert obvious characters in normal mode
nnoremap <RETURN> i<RETURN><ESC>
nnoremap <BACKSPACE> i<BACKSPACE><ESC>l
nnoremap + o<ESC>0D

" ============================================================================
"                               SETTINGS
" ============================================================================

" Mouse
set mouse=n

" Line wrap
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0
set display+=lastline

" scrolling
set scrolloff=4
set sidescrolloff=8
set sidescroll=1

" backups
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" syntax

" make name of file title
set title

" searching
" nnoremap / /\v
" vnoremap / /\v
set ignorecase
set smartcase
set hlsearch

" tabs

au filetype html set tabstop=2
au filetype html set shiftwidth=2
au filetype html set softtabstop=2
au filetype haml set tabstop=2
au filetype haml set shiftwidth=2
au filetype haml set softtabstop=2
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
" set autoindent
" set smartindent
" set smarttab
set nosmartindent
" autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Persistent undo
set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000


" Don't edit binary files
set wildignore=*.o,*.obj,*.exe,*.bak

" ============================================================================
"                               PLUGINS
" ============================================================================

call pathogen#infect()
filetype plugin on

" omnicompletion
set ofu=syntaxcomplete#Complete
filetype indent on
filetype plugin indent on
inoremap <C-f> <C-x><C-o>

" python repl
command! REPL sp repl | PyREPLToggle

" session.vim
let g:session_autosave=1
let g:session_autoload=1

" status line coloring
" hi StatusLine   guibg=red
" hi StatusLineNC   guibg=white

" Powerline
let g:Powerline_symbols='fancy'
" Solarized colorsheme
" if $COLORTERM == 'gnome-terminal'
  " set t_Co=256
" endif
let g:solarized_termcolors=16
set t_Co=16
syntax enable
set background=dark
colorscheme solarized

" ctags support
set tags=./tags;/
au filetype c nnoremap ] <C-]>
au filetype c nnoremap [ <C-T>
au filetype c nnoremap <C-]> :sp <CR>:exec("tag ".expand("<cword>"))<CR>

" leaders
let mapleader = ","
set showcmd
set timeoutlen=5000

" lisp stuff
let g:slimv_swank_cmd = '! xterm -e sbcl --load /home/andrew/.vim/slime/start-swank.lisp &'
"au filetype lisp nmap <C-e> ,e
"au filetype lisp imap <C-e> <ESC>,e
"au filetype lisp nmap <C-d> ,d
"au filetype lisp imap <C-d> <ESC>,d

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Automatic coffee rebuilding
" au BufWritePost *.coffee CoffeeMake! -b | cwindow | redraw!
