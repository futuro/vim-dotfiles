version 6.0
if &cp | set nocp | endif
let mapleader=" "
let s:cpo_save=&cpo
set novisualbell
set cpo&vim
imap <F10> cit
map ,kqs mz:%s/^> >/>>/
map ,l __start__scmd
map ,L 1G/Latest change:\s*/e+1CYDATE
map ,e ^wy$:r!"
vmap ;tr :s/\s\+$//
nmap ;tr :%s/\s\+$//
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
"set cindent
"set cinoptions=>2,e-2,n-2,{0,}0,^-2,:1,l1,b0,g1,p1,t0,+2,(0,u0,)30
set autoindent smartindent
set background=dark
set backspace=2
set backupcopy=no
set comments=b:#,:%,fb:-,n:>,n:)
set dictionary=/usr/share/dict/word
set directory^=$HOME/.vim/swap//
set fileencodings=ucs-bom,utf-8,default,latin1
set foldenable
set foldmethod=syntax
set formatoptions=cqrt
set grepprg=grep\ -nH\ $*
set helplang=en
set hidden
set history=50
set laststatus=2
set listchars=eol:$,precedes:«,extends:»,tab:»·,trail:·
set nomodeline
set nostartofline
set nu
set pastetoggle=<F11>
set printoptions=paper:a4
set pumheight=7
set ruler
set runtimepath=~/.vim,/var/lib/vim/addons,/usr/share/vim,/usr/share/vim/vimfiles,/usr/share/vim/vim73,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/after
set shortmess=at
set showcmd
set showmatch
set spellfile=~/.vim/spellfile.add
set spellsuggest=best,10
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,,
set tags=./tags,./TAGS,tags,TAGS,../tags,../../tags,../../../tags,../../../../tags
set viminfo=%,'50,\"100,:100,n~/.viminfo
set whichwrap=<,>,h,l
set wildmenu
set window=60
syn on
colo wombat256

filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on
runtime ftplugin/man.vim
autocmd Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim
autocmd Filetype scheme source ~/.vim/ftplugin/SchemeMode.vim 

command Cplusplustags :!ctags -R --c++-kinds=+cdefglmnpstuvx --fields=+iaS --extra=+q --language-force=C++ . <CR>
command Ctags :!ctags -R --c-kinds=+cdefglmnpstuvx --fields=+S --extra=+f . <CR>

" Session bindings
command -bang -complete=file -nargs=1 Wsession :mksession<bang> ~/.vim/sessions/<args>
command -nargs=1 -complete=file Lsession :source ~/.vim/sessions/<args>
command Clear :0,100bdelete
command -nargs=1 -bar -complete=file  Cload :Clear | :Lsession <args> 

" Moving around in the error list (:cn :cp)
map <Leader>c :cnext<CR>
map <Leader>b :cpr<CR>

" NERDTree bindings
nmap <Leader>no :NERDTree<CR>
nmap <Leader>nt :NERDTreeToggle<CR>
nmap <Leader>nf :NERDTreeFind<CR>
nmap <Leader>nm :NERDTreeMirror<CR>
nmap <Leader>nc :NERDTreeClose<CR>

" vim-latex
let g:tex_flavor='latex'

" Extra definitions
" set tags+=~/.vim/tags/cpp

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
" vim: set ft=vim :

" Perl
let perl_fold = 1
let perl_fold_blocks = 1
