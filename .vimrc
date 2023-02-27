set nocompatible
set nobackup
set nowritebackup
set noswapfile
set encoding=UTF-8

call plug#begin()

Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'vim-syntastic/syntastic'
Plug 'majutsushi/tagbar'
Plug 'posva/vim-vue'
Plug 'govim/govim'
Plug 'github/copilot.vim'
Plug 'ryanoasis/vim-devicons'

call plug#end()

syntax on

filetype plugin on

set autoindent
set smartindent
filetype indent on

set fileformats=unix,dos,mac
set nu
set relativenumber
set nowrap
set hlsearch
set ruler
set backspace=indent,eol,start
set scrolloff=999
set mouse=r
set ttymouse=sgr

set noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

augroup twospaces
	autocmd!
	autocmd FileType javascript,json,html setlocal expandtab ts=2 sts=2 sw=2
augroup END

augroup fourspaces
	autocmd!
	autocmd FileType java,php,python setlocal expandtab ts=4 sts=4 sw=4
augroup END

" Open NERDTree with vim (focus on main window) and close when :quit
autocmd VimEnter * NERDTree | wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nmap <F5> :NERDTreeToggle<CR>
nmap <F6> :NERDTreeFind<CR>
nmap <F7> :Gblame<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F9> :Copilot panel<CR>

set statusline=[%n]\ %t
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%=%l:%c

" 80 column highlight
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn=join(range(81,120),",")
let &colorcolumn="80,".join(range(400,999),",")

highlight OverLength ctermbg=160 ctermfg=white guibg=NONE
match OverLength /\%120v.\+/

let NERDTreeShowHidden=1
let NERDTreeWinSize=30

set guifont=MesloLGM\ Nerd\ Font:h11

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
set updatetime=500
set signcolumn=yes
set balloondelay=250

autocmd! BufEnter,BufNewFile *.go,go.mod syntax on
autocmd! BufLeave *.go,go.mod syntax off
nmap <silent> <buffer> <Leader>h : <C-u>call GOVIMHover()<CR>
