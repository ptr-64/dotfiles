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
filetype plugin indent on
filetype plugin on

" ~#####  ####### ####### ####### ### #     #  #####   #####  
" #       #          #       #     #  ##    # #       #      
" #       #          #       #     #  # #   # #       #       
"  #####  #####      #       #     #  #  #  # #  ####  #####  
"       # #          #       #     #  #   # # #     #       # 
"       # #          #       #     #  #    ## #     #       # 
"  #####  #######    #       #    ### #     #  #####   #####

" prevent redundant syntax nonsense
if !exists("g:syntax_on")
	syntax enable
endif
" Command line completion
set wildmenu
" Show the partial command as I type
set showcmd
"set tab = 4 <spaces>
set tabstop=8 softtabstop=8 expandtab shiftwidth=4 smarttab autoindent smartindent
" increase memory
set maxmempattern=2000
" use pastemode
" set pastetoggle=<F6>
"care about the LeTtEr casing only if you should
set ignorecase smartcase
set wildignorecase
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
" clears highlights when I hit leader-esc.
:set hls is ic
" Use the statusline
"set laststatus=2
"set statusline=%t       "tail of the filename
"set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
"set statusline+=%{&ff}] "file format
"" set statusline+=%h      "help file flag
"set statusline+=%m      "modified flag
""set statusline+=%r      "read only flag
"set statusline+=%y      "filetype
"set statusline+=%=      "left/right separator
"set statusline+=%c,     "cursor column
"set statusline+=%l\ of\ %L   "cursor line/total lines
"set statusline+=\ %P    "percent through file
"set scrolloff=3

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" #     #    #    ######  ######  ### #     #  #####   #####  
" ##   ##   # #   #     # #     #  #  ##    # #     # #     # 
" # # # #  #   #  #     # #     #  #  # #   # #       #       
" #  #  # #     # ######  ######   #  #  #  # #  ####  #####  
" #     # ####### #       #        #  #   # # #     #       # 
" #     # #     # #       #        #  #    ## #     # #     # 
" #     # #     # #       #       ### #     #  #####   #####

" Strip whitespace
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ws :call StripWhitespace()<CR>
" quickly edit and source the vimrc
nnoremap <leader>er :tabnew $MYVIMRC<cr>
nnoremap <leader><cr><cr> :source $MYVIMRC<cr>
" lets make tab navigation a bit more sane
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" add spell check and toggle highlighting
noremap <F5> :setlocal spell!<cr>
" map ; -> : and : -> ;, esc to jk, and add a few autocommands
noremap ; :
noremap : ;
inoremap jk <esc>
inoremap <C-x> <Del>
"inoremap <esc> <nop>
"inoremap OD <left>
"inoremap OC <right>
"inoremap OA <up>
"inoremap OB <down>
"
"Activate junegunn-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
"
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"
"
"
"
"
augroup ausave
	autocmd!
	autocmd Filetype * :autocmd! CursorHold <buffer> :update
augroup END
" use w!! to change a read only file without sudo-ing first
cnoremap w!! w !sudo tee % >/dev/null 
"Use Nerdtree
noremap <F2> :NERDTreeToggle<cr>
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber
" VIM-PLUG
" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Quickly change current directory of local buffer
command CDC lcd %:p:h

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

"Nord vim theme
Plug 'arcticicestudio/nord-vim'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'ptr-64/vim-snippets' 
" modify the ultisnip behavior
let g:UltiSnipsSnippetDirectories=[ "UltiSnips"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" add support for pandoc and pandoc-syntax
Plug 'vim-pandoc/vim-pandoc'  | Plug 'vim-pandoc/vim-pandoc-syntax'

" include support for rmarkdown
"Plug 'vim-pandoc/vim-rmarkdown'

" add language syntax support
Plug 'sheerun/vim-polyglot'

" and also add latex support
Plug 'lervag/vimtex'
let g:vimtex_view_method="skim"
let g:tex_flavor="latex"

" Add julia support
Plug 'JuliaEditorSupport/julia-vim'

" Nvim-r support
"Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}

" Add linting support
Plug 'dense-analysis/ale'
let g:ale_fixers = {'r': ['lintr']}

" Plug trasnpose
Plug 'https://github.com/salsifis/vim-transpose'

" Work with csv files
Plug 'chrisbra/csv.vim'

" use vim-slime to push code to the right
Plug 'jpalardy/vim-slime' 
let g:slime_target = "tmux"

" use a cool status bar
Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1
" Initialize plugin system
call plug#end()

" Change the color scheme to nord
colorscheme nord

" add Nvim-R support to improve R functionality; maybe someday... TMUX works
" for now...
"Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
" python with venv support
"py3 << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF
