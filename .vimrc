" Enable pathogen
execute pathogen#infect()	

"Enable syntax highlighting
syntax on

"Indentation 
set autoindent			
filetype plugin indent on

"Line numbers
set relativenumber
set number

"Tab width
set shiftwidth=4
set softtabstop=4
set tabstop=4

"Map ESCAPE to jk
inoremap jk <ESC>

"for vim-airline
set laststatus=2

"256 colour terminal
set t_Co=256

"Vim-airline theme
set background=dark
let g:airline_theme='wombat'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

"Prolog not Perl
let g:filetype_pl="prolog"

"NERDTree configuration
let g:NERDTreeDirArrows=1
map <C-n> :NERDTreeToggle<CR>

"For tmuxline
let g:airline#extensions#tmuxline#enabled = 1
let airline#extensions#tmuxline#snapshot_file = "~/.tmux-status.conf"

"Completion colours
hi Pmenu        cterm=none ctermfg=White     ctermbg=Black
hi PmenuSel     cterm=none ctermfg=Black     ctermbg=DarkGreen
hi PmenuSbar    cterm=none ctermfg=none      ctermbg=Green
hi PmenuThumb   cterm=none ctermfg=DarkGreen ctermbg=DarkGreen
