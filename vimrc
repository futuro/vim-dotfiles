version 6.0
if &cp | set nocp | endif
let mapleader=" "
let s:cpo_save=&cpo
set novisualbell
set cpo&vim
map ,kqs mz:%s/^> >/>>/
map ,l __start__scmd
map ,L 1G/Latest change:\s*/e+1CYDATE
map ,e ^wy$:r!"
vmap <Leader>tr :s/\s\+$//
nmap <Leader>tr :%s/\s\+$//
"nmap <C-f9> :!ctags -R --c++-kinds=+cdefglmnpstuvx --fields=+iaS --extra=+q --language-force=C++ . <CR>
" nmap <ESC>[20;5~ :!ctags -R --c++-kinds=+cdefglmnpstuvx --fields=+iaS --extra=+q --language-force=C++ . <CR>
map \dk <Plug>DirDiffPrev
map \dj <Plug>DirDiffNext
map \dp <Plug>DirDiffPut
map \dg <Plug>DirDiffGet
map \pull :!hg pull:e!
map \upd :!hg update:e!
map \stat :call ShowResults("RepoStatus", "hg\ status")
map \an :call ShowResults("annotate", "hg\ annotate")
map \log :call ShowResults("FileLog", "hg\ log")
map \revert :!hg revert %:e!
map \diff :call ShowResults("FileDiff", "hg\ diff")
map \fgt :!hg forget %
map \add :!hg add %
noremap __scmd :r !print -P $PS1A
noremap __cmd 0f>ly$:r !";print -P $PS1A
noremap __end :iunmap |iunmap :"Vish ended.
map __start :imap  __cmd|imap  __end
nmap gx <Plug>NetrwBrowseX
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
map <F12> :set spell!|:echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)
map <S-F7> :r!xclip -o
vmap <F7> "*y
nmap <F7> :w !xclip
omap <F7> :w !xclip
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
colo wombat256

" Better searching
set ignorecase smartcase hlsearch
nnoremap <silent> <Leader>l :noh<CR>:redraw<CR>

filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

runtime ftplugin/man.vim

autocmd Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim
autocmd Filetype scheme source ~/.vim/ftplugin/SchemeMode.vim

" Session bindings
command -bang -complete=file -nargs=1 Wsession :mksession<bang> ~/.vim/sessions/<args>
command -nargs=1 -complete=file Lsession :source ~/.vim/sessions/<args>
command Clear :0,100bdelete
command -nargs=1 -bar -complete=file  Cload :Clear | :Lsession <args>

" LaTeX suite remapping
" it maps ^j to jump to the next placeholder, which gets in the way of my
" window movement mapping.
nmap <C-space> <Plug>IMAP_JumpForward

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

let g:syntastic_enable_signs=1

" LaTeX options
let g:tex_flavor='latex'

" vim: ft=vim :
