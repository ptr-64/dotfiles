" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

"--------------------------------------------------------------
" activate auto ftype detection
syntax on
filetype plugin indent on
filetype plugin on
syntax enable

" ~#####  ####### ####### ####### ### #     #  #####   #####  
" #       #          #       #     #  ##    # #       #      
" #       #          #       #     #  # #   # #       #       
"  #####  #####      #       #     #  #  #  # #  ####  #####  
"       # #          #       #     #  #   # # #     #       # 
"       # #          #       #     #  #    ## #     #       # 
"  #####  #######    #       #    ### #     #  #####   #####

" increase memory
set maxmempattern=2000

" use pastemode
set pastetoggle=<F6>

"care about the LeTtEr casing only if you should
set ignorecase smartcase

"don't bother with pointless :wq and :q!
set hidden

"live a little on the edge
set noswapfile

"Ensure nocompatible
set nocompatible

" Turn mouse on
:set mouse=a

" hybrid numbering
:set number relativenumber

" highlight searches as I type and be case insensitive. The succeeding line
" clears highlights when I hit enter a second time.
:set hls is ic
nnoremap <C-esc> :noh<cr><cr>

" Use the statusline
set laststatus=2
set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
" set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
"set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l\ of\ %L   "cursor line/total lines
set statusline+=\ %P    "percent through file


" #     #    #    ######  ######  ### #     #  #####   #####  
" ##   ##   # #   #     # #     #  #  ##    # #     # #     # 
" # # # #  #   #  #     # #     #  #  # #   # #       #       
" #  #  # #     # ######  ######   #  #  #  # #  ####  #####  
" #     # ####### #       #        #  #   # # #     #       # 
" #     # #     # #       #        #  #    ## #     # #     # 
" #     # #     # #       #       ### #     #  #####   #####

" quickly edit and source the vimrc
nnoremap <leader>er :e $MYVIMRC<cr>
nnoremap <leader><cr><cr> :source $MYVIMRC<cr>

" lets make tab navigation a bit more sane
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" map ; -> : and : -> ;, esc to jk, and add a few autocommands
noremap ; :
noremap : ;
inoremap jk <esc>
inoremap <esc> <nop>
augroup ausave
	autocmd!
	autocmd Filetype * :autocmd! CursorHold <buffer> :update
augroup END

augroup ftype_py
	autocmd!
	autocmd BufWritePre,BufRead *.py :normal! gg=G
	autocmd Filetype python setlocal expandtab foldmethod=indent
	autocmd BufRead,BufNewFile *.py, *.pyw, *.c, *.h match BadWhitespace /s\s\+$/
augroup END

augroup ftype_tex
	autocmd!
	autocmd BufNewFile,BufRead *.tex setf tex
	autocmd FileType tex setlocal foldmethod=indent
augroup END

" use w!! to change a read only file without sudo-ing first
cnoremap w!! w !sudo tee % >/dev/null 

"Use Nerdtree
noremap <F2> :NERDTreeToggle<cr>

" VIM-PLUG
" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

"Nord vim theme
Plug 'arcticicestudio/nord-vim'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' 
" modify the ultisnip behavior
let g:UltiSnipsSnippetDirectories=[ "UltiSnips", "mysnippets"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'

" add support for pandoc and pandoc-syntax
Plug 'vim-pandoc/vim-pandoc'  | Plug 'vim-pandoc/vim-pandoc-syntax'

" include support for rmarkdown
Plug 'vim-pandoc/vim-rmarkdown'

" and also add latex support
Plug 'lervag/vimtex'
let g:vimtex_view_method = 'zathura'

" Add julia support
Plug 'JuliaEditorSupport/julia-vim'
" Initialize plugin system
call plug#end()

" Change the color scheme to nord
colorscheme nord
