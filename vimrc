scriptencoding utf-8
if &cp | set nocp | endif

" I've found space to be a much nicer mapleader than the default
let mapleader=" "

" Hold onto the compatability options for resetting later
let s:cpo_save=&cpo

" Kill the bell
set novisualbell

" Reset the compatability options to the vim default
set cpo&vim

" Map a more convenient key sequence for escape in insert mode
inoremap kj <Esc>

" Let's have stronger encryption, just in case we use it
set cryptmethod=blowfish2

" I don't really use this anymore, but I really like it so I'm keeping it
iabbr YDATE =strftime("%a %b %d %T %Z %Y")

" Change the compat options back to what they were
" Do I even use this? Where'd it come from?
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
set nofoldenable " Start new buffers with folds open
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
set number " enable line numbers in left gutter
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

" Syntax files
Plug 'dsolstad/vim-wombat256i'
Plug 'trapd00r/neverland-vim-theme'
Plug 'trapd00r/vim-after-syntax-perl', { 'for': 'perl' }

" Misc utility
Plug 'tpope/vim-fugitive' " Git support
Plug 'sjl/gundo.vim' " Graphical undo
Plug 'scrooloose/nerdcommenter' " Nice comment toggling

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" CoffeeScript
Plug 'kchmck/vim-coffee-script'

"Plug 'edsono/vim-matchit'
Plug 'ehamberg/vim-cute-python', { 'for': 'python' }
Plug 'fholgado/minibufexpl.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'Lokaltog/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'wincent/Command-T', { 'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make clean && make' }
Plug 'sophacles/vim-processing'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --system-libclang --tern-completer' }
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'flowtype/vim-flow', { 'for': 'javascript' }

" While these could have a "for" declaration, that causes the system js files
" to be loaded, and we lose proper formatting. As such, they need to be loaded
" like everything else.
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

Plug 'jiangmiao/auto-pairs'
"Plug 'vim-scripts/closetag.vim'
Plug 'mattn/emmet-vim', { 'for' : ['javascript', 'html', 'javascript.jsx']  }

" Make sure we read editorconfig's properly
Plug 'editorconfig/editorconfig-vim'

call plug#end()

let g:processing_fold = 1

let g:jsx_ext_required = 0

let g:javascript_plugin_flow = 1

" Set options related to ui, based on whether we're in gvim or not.
if has('gui_running')
    set go=aegi
    set guifont=xos4\ Terminess\ Powerline\ 14
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
autocmd Filetype javascript,javascript.jsx let NERDSpaceDelims=1
autocmd BufNewFile,BufRead *.boot set filetype=clojure
autocmd BufNewFile,BufRead .babelrc set filetype=json
autocmd BufNewFile,BufRead .tmux.conf set filetype=conf

" Session bindings
command -bang -complete=file -nargs=1 Wsession :mksession<bang> ~/.vim/sessions/<args>
command -nargs=1 -complete=file Lsession :source ~/.vim/sessions/<args>
command Clear :0,100bdelete
command -nargs=1 -bar -complete=file  Cload :Clear | :Lsession <args>

" Set some emmet options
let g:user_emmet_mode='i'

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
let g:ycm_log_level = 'info'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_add_preview_to_completeopt = 1

" Command-T options
let g:CommandTWildIgnore=&wildignore . ",*/node_modules"

" Snippet configs
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" vim: ft=vim :
