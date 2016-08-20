" Use the Solarized Dark theme
set background=dark
" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=2
" Show “invisible” characters
set lcs=eol:¬
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Start scrolling three lines before the horizontal window border
set scrolloff=3
" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'AlessandroYorba/Sierra'

Plug 'wincent/command-t'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'Valloric/YouCompleteMe', { 'for': 'javascript' }
Plug 'ternjs/tern_for_vim', { 'for': 'javascript' }
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'AndrewRadev/linediff.vim'
Plug 'airblade/vim-gitgutter'
Plug 'mileszs/ack.vim'
Plug 'junegunn/goyo.vim' 
Plug 'junegunn/limelight.vim' 

Plug 'scrooloose/syntastic', { 'for': 'javascript' }
Plug 'heavenshell/vim-jsdoc', { 'for': ['javascript', 'jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'jsx'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'jsx'] }
Plug 'jelera/vim-javascript-syntax', { 'for': ['javascript', 'jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'jsx'] }
Plug 'othree/jsdoc-syntax.vim', { 'for': 'javascript' }
Plug 'elzr/vim-json', { 'for': 'json' }

Plug 'hdima/python-syntax', { 'for': 'python' }

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'edkolev/tmuxline.vim'

Plug 'swekaj/php-foldexpr.vim'

call plug#end()

colorscheme sierra
set gfn=Inconsolata\ for\ Powerline:h18

" Tab Settings
set expandtab
set smarttab
set softtabstop=2
set shiftwidth=2

" Use Silver Searcher instead of ack
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

autocmd Filetype php setlocal ts=4 sts=4 sw=4
" Fix the indentation for switch cases for clarity
let g:PHP_vintage_case_default_indent = 1

" Syntastic
autocmd Filetype javascript setlocal statusline+=%#warningmsg# statusline+=%{SyntasticStatuslineFlag()} statusline+=%*
autocmd Filetype javascript let g:syntastic_check_on_open = 1
autocmd Filetype javascript let g:syntastic_check_on_wq = 0
autocmd Filetype javascript let g:syntastic_javascript_checkers = ['eslint']
autocmd Filetype javascript let g:jsx_ext_required = 0
autocmd Filetype javascript let g:jsdoc_allow_input_prompt = 1
autocmd Filetype javascript let g:jsdoc_additional_descriptions = 1
autocmd Filetype javascript let g:jsdoc_input_description = 1
autocmd Filetype javascript let g:jsdoc_tags = 1

" NERDtree Git Plugin
" let g:NERDTreeIndicatorMapCustom = {
    " \ "Modified"  : "✹",
    " \ "Staged"    : "✚",
    " \ "Untracked" : "✭",
    " \ "Renamed"   : "➜",
    " \ "Unmerged"  : "═",
    " \ "Deleted"   : "✖",
    " \ "Dirty"     : "✗",
    " \ "Clean"     : "✔︎",
    " \ "Unknown"   : "?"
    " \ }

" Airline Custom Symbols
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_theme='ubaryd'

" PHP Foldexpr Settings
let b:phpfold_docblocks = 1
let b:phpfold_doc_with_funcs = 0

" Goyo Settings and Commands
let g:goyo_width = 130

function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
  " Limelight 0.85
  " ...
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
  " Limelight!
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Ignores
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*,*/bower_components/*
set wildignore+=*.gif,*.bmp,*.png,*.jpg

" NERDCommenter Space
let NERDSpaceDelims=1

" Custom Hotkeys
nnoremap <C-g> :Goyo<CR>
nnoremap <C-p> :CommandT<CR>
nnoremap <C-o> :CommandTBuffer<CR>