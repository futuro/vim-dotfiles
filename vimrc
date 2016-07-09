scriptencoding utf-8
if &cp | set nocp | endif
let mapleader=" "
let s:cpo_save=&cpo
set novisualbell
set cpo&vim
noremap __scmd :r !print -P $PS1A
noremap __cmd 0f>ly$:r !";print -P $PS1A
noremap __end :iunmap |iunmap :"Vish ended.
map __start :imap  __cmd|imap  __end
nmap gx <Plug>NetrwBrowseX
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
"map <S-F7> :r!xclip -o
"vmap <F7> "*y
"nmap <F7> :w !xclip
"omap <F7> :w !xclip
inoremap kj <Esc>
iabbr YDATE =strftime("%a %b %d %T %Z %Y")
let &cpo=s:cpo_save
unlet s:cpo_save
let g:moria_style='dark'
set autoindent smartindent
set background=dark
set backspace=2
set backupcopy=auto
set comments=b:#,:%,fb:-,n:>,n:)
set dictionary=/usr/share/dict/words
set directory^=$HOME/.vim/swap//
"set encoding=unicode
set fileencodings=utf-8,default,latin1
set foldenable
set foldmethod=syntax
set formatoptions=cqrt
set grepprg=grep\ -nH\ $*
set helplang=en
set hidden
set history=50
set laststatus=2
set listchars=eol:$,precedes:«,extends:»,tab:»·,trail:·
set modeline
set nostartofline
set nu
set pastetoggle=<F11>
set printoptions=paper:a4
set pumheight=7
set ruler
set shortmess=at
set showcmd
set showmatch
set spellfile=~/.vim/spellfile.add
set spellsuggest=best,10
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,,
set tags=./tags,./TAGS,tags,TAGS,../tags,../../tags,../../../tags,../../../../tags
set viminfo='50,\"100,:100
set whichwrap=<,>,h,l
set wildmenu
set window=60
syn on

" Better searching
set ignorecase smartcase hlsearch
nnoremap <silent> <Leader>l :noh<CR>:redraw<CR>

filetype plugin indent on

" vim-plug biz
call plug#begin('~/.vim/plugged')

Plug 'dsolstad/vim-wombat256i'
Plug 'tpope/vim-fugitive'
Plug 'sjl/gundo.vim'
Plug 'trapd00r/neverland-vim-theme'
Plug 'trapd00r/vim-after-syntax-perl', { 'for': 'perl' }
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/snipMate'
Plug 'edsono/vim-matchit'
Plug 'ehamberg/vim-cute-python', { 'for': 'python' }
Plug 'fholgado/minibufexpl.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'Lokaltog/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'wincent/Command-T', { 'do': 'cd ruby/command-t && ruby extconf.rb && make clean && make' }
Plug 'sophacles/vim-processing'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer --system-libclang', 'for': ['cpp', 'javascript'] }
Plug 'marijnh/tern_for_vim', { 'do': 'npm install', 'for': ['javascript','javascript.jsx'] }
Plug 'pangloss/vim-javascript', { 'for' : ['javascript','javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for' : ['javascript','javascript.jsx'] }
Plug 'jiangmiao/auto-pairs'
"Plug 'vim-scripts/closetag.vim'
Plug 'mattn/emmet-vim', { 'for' : ['javascript', 'html', 'javascript.jsx']  }

call plug#end()

let g:processing_fold = 1

let g:jsx_ext_required = 0

" Set options related to ui, based on whether we're in gvim or not.
if has('gui_running')
    set go=aegi
    set guifont=Terminus\ 9
    colo wombat256
else
    colo wombat256i
endif

runtime ftplugin/man.vim

autocmd Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim
autocmd Filetype html,xml,xsl setlocal fdm=indent
autocmd Filetype scheme source ~/.vim/ftplugin/SchemeMode.vim
autocmd Filetype json set et sw=2 ts=2
autocmd Filetype javascript,javascript.jsx set et sw=2 ts=2
autocmd BufNewFile,BufRead *.boot set filetype=clojure
autocmd BufNewFile,BufRead .babelrc set filetype=json

" Session bindings
command -bang -complete=file -nargs=1 Wsession :mksession<bang> ~/.vim/sessions/<args>
command -nargs=1 -complete=file Lsession :source ~/.vim/sessions/<args>
command Clear :0,100bdelete
command -nargs=1 -bar -complete=file  Cload :Clear | :Lsession <args>

" Window movement
nmap <C-h> <C-W>h
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l

" Perl
let perl_fold = 1
let perl_fold_blocks = 1

" fugitive options
set statusline=%<%t\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" syntastic options
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = '~/.node_modules/bin/eslint'
let g:syntastic_always_populate_loc_list=1

let g:syntastic_enable_signs=1

" YouCompleteMe options
let g:ycm_server_log_level = 'critical'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_add_preview_to_completeopt = 1

" Command-T options
let g:CommandTWildIgnore=&wildignore . ",*/node_modules"

" vim: ft=vim :
