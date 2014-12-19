" -------------
" General setup
" -------------

filetype plugin indent on
syntax enable

" Automatically remove all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Source completion
" Automatically open and close the popup menu / preview window
"set omnifunc=syntaxcomplete#Complete
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"set completeopt=menuone,menu,longest,preview

" ------
" Layout
" ------

" try 256 color mode if envvar is set
set t_Co=88
if $TERM == 'xterm-256color' | set t_Co=256 | endif

" Color scheme
"set background=dark
"colorscheme darkspectrum
runtime! plugin/guicolorscheme.vim
GuiColorScheme darkspectrum

set fileformats=unix    " obviously...
set ruler               " show cursor location
set modeline            " read modelines
set number              " show line numbers
set title               " change the terminal's title
set nocompatible        " disable Vi-compatibility
set laststatus=2        " always display filename
set textwidth=79        " break line at 79 chars

" Tabs are for heathens, we indent with spaces
set expandtab smarttab
set shiftwidth=4 tabstop=8 softtabstop=0
set autoindent copyindent
set shiftround
set backspace=indent,eol,start

" Don't give people epilepsy
set visualbell t_vb= noerrorbells

" Enable wildmenu for browsing files in :e command
set wildmenu
set wildcharm=<TAB>
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*.bc

" File explorer
let g:netrw_liststyle=3  " Use tree-mode as default view
let g:netrw_preview=1    " Preview window shown in a vertically split

" ---------
" Searching
" ---------

set history=1000 undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class,*.old
set hlsearch    " highlight search terms
set incsearch   " show search matches as you type
set smartcase   " clever case sensitivity

" -----------------------
" Key bindings / commands
" -----------------------

" Use ';' instead of ':'
nnoremap ; :

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" Solve line jumping with long, wrapped lines (use [jk] for normal behaviour)
nnoremap <down> gj
nnoremap <up> gk

" Window navigation with ctrl + [hjkl]
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Shortcuts for common commands
nmap <silent> ,/  :nohlsearch<CR>
nmap <silent> ,mm :!make<CR>
nmap <silent> ,ml :!make clean<CR>
nmap <silent> ,mt :!make check<CR>
nmap <silent> ,md :!make dist<CR>
nmap <silent> ,mb :!make -B<CR>

" Use w!! to save a file as root if opened with insufficient permissions
cmap w!! w !sudo tee % >/dev/null

" ---------------
" Syntax / indent
" ---------------

" Some files only have 2 spaces indent
autocmd FileType sass,html set shiftwidth=2

" Tabs in Makefiles are 4 spaces since they are required and thus need not be
" religiously burned
autocmd FileType make set tabstop=4

" Make pfd's readable
autocmd BufReadPre *.pdf set ro nowrap
autocmd BufReadPost *.pdf silent %!pdftotext "%" -nopgbrk -layout -q -eol unix -

" C syntax highlighting for CiviC files
autocmd BufNewFile,BufRead *.cvc set filetype=c

" Status line highlight
highlight StatusLine ctermbg=black ctermfg=grey

" Syntax highlighting for .less files
autocmd BufNewFile,BufRead *.less set filetype=less

" Highlight and underline badly spelled words when spellcheck is on
highlight SpellBad guisp=#fcaf3e cterm=underline
